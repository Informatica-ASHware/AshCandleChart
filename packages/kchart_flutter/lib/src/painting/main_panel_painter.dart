import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart' hide Viewport;
import 'package:kchart_core/kchart_core.dart';
import 'layer_cache.dart';
import 'paint_pool.dart';
import '../overlays/trade_overlay_painter.dart';

/// Painter for the main chart panel that renders candles and a grid.
///
/// Uses [ui.Vertices] and [canvas.drawVertices] for high-performance rendering.
/// Optimizes rendering by using [LayerCache] for static components and [PaintPool]
/// to reduce GC pressure.
class MainPanelPainter extends CustomPainter {
  /// The chart frame containing the data to render.
  final ChartFrame frame;

  /// Pool for reusing [Paint] objects.
  final PaintPool paintPool;

  /// Cache for the grid layer.
  final LayerCache gridCache;

  /// Cache for the candle layer (static history).
  final LayerCache candleCache;

  /// Optional pre-allocated buffer for bullish vertices to reduce GC pressure.
  final Float32List? bullishBuffer;

  /// Optional pre-allocated buffer for bearish vertices to reduce GC pressure.
  final Float32List? bearishBuffer;

  /// Creates a [MainPanelPainter] with the given [frame], [paintPool], and caches.
  MainPanelPainter({
    required this.frame,
    required this.paintPool,
    required this.gridCache,
    required this.candleCache,
    this.bullishBuffer,
    this.bearishBuffer,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawGrid(canvas, size);
    _drawCandles(canvas, size);
    _drawAnnotations(canvas, size);
    _drawTradeOverlays(canvas, size);

    paintPool.releaseAll();
  }

  void _drawGrid(Canvas canvas, Size size) {
    // Cache key for grid depends on size.
    final Object cacheKey = (size.width, size.height);

    gridCache.updateIfNeeded(
      cacheKey: cacheKey,
      size: size,
      paint: (ui.Canvas gridCanvas) {
        final paint = paintPool.borrow()
          ..color = const Color(0xFFE0E0E0)
          ..strokeWidth = 1.0
          ..style = PaintingStyle.stroke;

        const int horizontalLines = 5;
        for (int i = 0; i <= horizontalLines; i++) {
          final double y = size.height * i / horizontalLines;
          gridCanvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
        }

        const int verticalLines = 8;
        for (int i = 0; i <= verticalLines; i++) {
          final double x = size.width * i / verticalLines;
          gridCanvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
        }
      },
    );

    if (gridCache.picture != null) {
      canvas.drawPicture(gridCache.picture!);
    }
  }

  void _drawCandles(Canvas canvas, Size size) {
    final series = frame.series;
    final viewport = frame.viewport;

    if (series.length == 0) return;

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);

    if (startIdx > endIdx) return;

    // Cache key for candles depends on panelSequenceNumber and viewport state.
    final Object cacheKey = (
      frame.panelSequenceNumbers['main'] ?? 0,
      viewport.startIdx,
      viewport.endIdx,
      size.width,
      size.height,
    );

    candleCache.updateIfNeeded(
      cacheKey: cacheKey,
      size: size,
      paint: (ui.Canvas candleCanvas) {
        // Calculate min/max price in visible range for Y-axis scaling.
        double minPrice = double.infinity;
        double maxPrice = double.negativeInfinity;

        for (int i = startIdx; i <= endIdx; i++) {
          if (series.low[i] < minPrice) minPrice = series.low[i];
          if (series.high[i] > maxPrice) maxPrice = series.high[i];
        }

        if (minPrice == maxPrice) {
          minPrice -= 1.0;
          maxPrice += 1.0;
        }

        final double priceRange = maxPrice - minPrice;
        final double viewHeight = size.height;
        final double viewWidth = size.width;

        final int visibleCount = endIdx - startIdx + 1;
        final double candleWidth = viewWidth / visibleCount;
        final double bodyWidth = candleWidth * 0.8;
        final double wickWidth = (candleWidth * 0.1).clamp(1.0, 3.0);

        double priceToY(double price) {
          return viewHeight - ((price - minPrice) / priceRange * viewHeight);
        }

        final int vertexCountPerCandle = 24;
        final int requiredSize = visibleCount * vertexCountPerCandle;

        final Float32List bullishVertices =
            (bullishBuffer != null && bullishBuffer!.length >= requiredSize)
                ? bullishBuffer!
                : Float32List(requiredSize);

        final Float32List bearishVertices =
            (bearishBuffer != null && bearishBuffer!.length >= requiredSize)
                ? bearishBuffer!
                : Float32List(requiredSize);

        int bullishOffset = 0;
        int bearishOffset = 0;

        for (int i = startIdx; i <= endIdx; i++) {
          final double open = series.open[i];
          final double close = series.close[i];
          final double high = series.high[i];
          final double low = series.low[i];

          final bool isBullish = close >= open;
          final Float32List targetVertices =
              isBullish ? bullishVertices : bearishVertices;
          int offset = isBullish ? bullishOffset : bearishOffset;

          final double centerX = (i - startIdx) * candleWidth + candleWidth / 2;
          final double x1 = centerX - bodyWidth / 2;
          final double x2 = centerX + bodyWidth / 2;
          final double wx1 = centerX - wickWidth / 2;
          final double wx2 = centerX + wickWidth / 2;

          final double yOpen = priceToY(open);
          final double yClose = priceToY(close);
          final double yHigh = priceToY(high);
          final double yLow = priceToY(low);

          final double bodyTop = isBullish ? yClose : yOpen;
          final double bodyBottom = isBullish ? yOpen : yClose;

          // Wick (2 triangles)
          targetVertices[offset++] = wx1; targetVertices[offset++] = yHigh;
          targetVertices[offset++] = wx2; targetVertices[offset++] = yHigh;
          targetVertices[offset++] = wx2; targetVertices[offset++] = yLow;
          targetVertices[offset++] = wx1; targetVertices[offset++] = yHigh;
          targetVertices[offset++] = wx2; targetVertices[offset++] = yLow;
          targetVertices[offset++] = wx1; targetVertices[offset++] = yLow;

          // Body (2 triangles)
          targetVertices[offset++] = x1; targetVertices[offset++] = bodyTop;
          targetVertices[offset++] = x2; targetVertices[offset++] = bodyTop;
          targetVertices[offset++] = x2; targetVertices[offset++] = bodyBottom;
          targetVertices[offset++] = x1; targetVertices[offset++] = bodyTop;
          targetVertices[offset++] = x2; targetVertices[offset++] = bodyBottom;
          targetVertices[offset++] = x1; targetVertices[offset++] = bodyBottom;

          if (isBullish) {
            bullishOffset = offset;
          } else {
            bearishOffset = offset;
          }
        }

        final Paint bullishPaint = paintPool.borrow()
          ..color = const Color(0xFF4CAF50);
        final Paint bearishPaint = paintPool.borrow()
          ..color = const Color(0xFFE91E63);

        if (bullishOffset > 0) {
          candleCanvas.drawVertices(
            ui.Vertices.raw(
              ui.VertexMode.triangles,
              Float32List.view(bullishVertices.buffer, 0, bullishOffset),
            ),
            ui.BlendMode.srcOver,
            bullishPaint,
          );
        }

        if (bearishOffset > 0) {
          candleCanvas.drawVertices(
            ui.Vertices.raw(
              ui.VertexMode.triangles,
              Float32List.view(bearishVertices.buffer, 0, bearishOffset),
            ),
            ui.BlendMode.srcOver,
            bearishPaint,
          );
        }
      },
    );

    if (candleCache.picture != null) {
      canvas.drawPicture(candleCache.picture!);
    }
  }

  void _drawTradeOverlays(Canvas canvas, Size size) {
    final series = frame.series;
    final viewport = frame.viewport;

    if (series.length == 0) return;

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);
    final int visibleCount = endIdx - startIdx + 1;
    final double viewWidth = size.width;
    final double viewHeight = size.height;
    final double candleWidth = viewWidth / visibleCount;

    double minPrice = double.infinity;
    double maxPrice = double.negativeInfinity;
    for (int i = startIdx; i <= endIdx; i++) {
      if (series.low[i] < minPrice) minPrice = series.low[i];
      if (series.high[i] > maxPrice) maxPrice = series.high[i];
    }
    if (minPrice == maxPrice) {
      minPrice -= 1.0;
      maxPrice += 1.0;
    }
    final double priceRange = maxPrice - minPrice;

    double priceToY(double price) {
      return viewHeight - ((price - minPrice) / priceRange * viewHeight);
    }

    double timestampToX(int timestamp) {
      int idx = findIndexAtTimestamp(series.timestamps, timestamp);
      return (idx - startIdx) * candleWidth + candleWidth / 2;
    }

    final tradePainter = TradeOverlayPainter(paintPool: paintPool);
    tradePainter.draw(canvas, size, frame, priceToY, timestampToX);
  }

  void _drawAnnotations(Canvas canvas, Size size) {
    final series = frame.series;
    final viewport = frame.viewport;
    final annotations = frame.annotations.annotations;

    if (annotations.isEmpty || series.length == 0) return;

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);
    final int visibleCount = endIdx - startIdx + 1;
    final double viewWidth = size.width;
    final double viewHeight = size.height;
    final double candleWidth = viewWidth / visibleCount;

    // We need price range to scale Y coordinates.
    // Ideally this is pre-calculated or shared.
    double minPrice = double.infinity;
    double maxPrice = double.negativeInfinity;
    for (int i = startIdx; i <= endIdx; i++) {
      if (series.low[i] < minPrice) minPrice = series.low[i];
      if (series.high[i] > maxPrice) maxPrice = series.high[i];
    }
    if (minPrice == maxPrice) {
      minPrice -= 1.0;
      maxPrice += 1.0;
    }
    final double priceRange = maxPrice - minPrice;

    double priceToY(double price) {
      return viewHeight - ((price - minPrice) / priceRange * viewHeight);
    }

    double timestampToX(int timestamp) {
      // Find fractional index for timestamp
      int idx = findIndexAtTimestamp(series.timestamps, timestamp);
      return (idx - startIdx) * candleWidth + candleWidth / 2;
    }

    for (final annotation in annotations) {
      if (annotation is TrendLine) {
        final x1 = timestampToX(annotation.start.timestamp);
        final y1 = priceToY(annotation.start.price);
        final x2 = timestampToX(annotation.end.timestamp);
        final y2 = priceToY(annotation.end.price);

        final paint = paintPool.borrow()
          ..color = Color(annotation.color)
          ..strokeWidth = annotation.strokeWidth
          ..style = PaintingStyle.stroke;

        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);

        // Draw circles at ends for easier identification
        final dotPaint = paintPool.borrow()
          ..color = Color(annotation.color)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(Offset(x1, y1), 4, dotPaint);
        canvas.drawCircle(Offset(x2, y2), 4, dotPaint);
      }
    }
  }

  /// Binary search to find the index of a timestamp.
  ///
  /// This method fulfills the O(log N) requirement for finding visible range
  /// when data is indexed by time.
  static int findIndexAtTimestamp(Int64List timestamps, int target) {
    int low = 0;
    int high = timestamps.length - 1;
    while (low <= high) {
      final int mid = low + ((high - low) >> 1);
      if (timestamps[mid] == target) return mid;
      if (timestamps[mid] < target) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }
    return low;
  }

  @override
  bool shouldRepaint(covariant MainPanelPainter oldDelegate) {
    return oldDelegate.frame.panelSequenceNumbers['main'] !=
        frame.panelSequenceNumbers['main'];
  }
}
