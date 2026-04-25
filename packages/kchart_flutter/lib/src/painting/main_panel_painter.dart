import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:kchart_core/kchart_core.dart';
import '../accessibility/chart_semantics_builder.dart';
import '../i18n/number_formatters.dart';
import 'layer_cache.dart';
import 'paint_pool.dart';
import '../overlays/trade_overlay_painter.dart';
import '../theme.dart';

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

  /// Cache for the Y-axis layer.
  final LayerCache yAxisCache;

  /// Optional pre-allocated buffer for bullish vertices to reduce GC pressure.
  final Float32List? bullishBuffer;

  /// Optional pre-allocated buffer for bearish vertices to reduce GC pressure.
  final Float32List? bearishBuffer;

  /// The theme to use for painting.
  final ChartTheme theme;

  /// Optional selection range (start and end timestamps).
  final (int, int)? selectionRange;

  /// Formatters for semantic labels.
  final ChartNumberFormatters? formatters;

  /// Creates a [MainPanelPainter] with the given [frame], [paintPool], and caches.
  MainPanelPainter({
    required this.frame,
    required this.paintPool,
    required this.gridCache,
    required this.candleCache,
    required this.yAxisCache,
    required this.theme,
    this.bullishBuffer,
    this.bearishBuffer,
    this.selectionRange,
    this.formatters,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final priceRange = calculateVisiblePriceRange();
    final ticks = calculatePriceTicks(priceRange.$1, priceRange.$2, 5);

    _drawGrid(canvas, size, ticks);
    _drawSelection(canvas, size);
    _drawCandles(canvas, size);
    _drawAnnotations(canvas, size);
    _drawTradeOverlays(canvas, size);
    _drawYAxis(canvas, size, ticks);

    paintPool.releaseAll();
  }

  void _drawYAxis(Canvas canvas, Size size, List<double> ticks) {
    if (theme.yAxisWidth <= 0 || formatters == null) return;

    // Cache key for Y-axis depends on ticks and price range.
    final priceRange = calculateVisiblePriceRange();
    final Object cacheKey =
        (size.width, size.height, Object.hashAll(ticks), priceRange);

    yAxisCache.updateIfNeeded(
      cacheKey: cacheKey,
      size: size,
      paint: (ui.Canvas yAxisCanvas) {
        final double minPrice = priceRange.$1;
        final double maxPrice = priceRange.$2;
        final double range = maxPrice - minPrice;
        final double viewHeight = size.height;

        for (final tick in ticks) {
          final double y = viewHeight - ((tick - minPrice) / range * viewHeight);
          final String label = formatters!.formatPrice(tick);

          final textPainter = TextPainter(
            text: TextSpan(
              text: label,
              style: theme.axisTextStyle,
            ),
            textDirection: TextDirection.ltr,
          );
          textPainter.layout();

          // Draw label aligned to the right margin with some padding
          final double x = size.width - theme.yAxisWidth + 4;
          textPainter.paint(yAxisCanvas, Offset(x, y - textPainter.height / 2));
        }
      },
    );

    if (yAxisCache.picture != null) {
      canvas.drawPicture(yAxisCache.picture!);
    }
  }

  void _drawSelection(Canvas canvas, Size size) {
    final selection = selectionRange;
    if (selection == null) return;

    final series = frame.series;
    final viewport = frame.viewport;

    if (series.length == 0) return;

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);
    final int visibleCount = endIdx - startIdx + 1;
    final double chartWidth = size.width - theme.yAxisWidth;
    final double candleWidth = chartWidth / visibleCount;

    final int selStartIdx =
        findIndexAtTimestamp(series.timestamps, selection.$1);
    final int selEndIdx = findIndexAtTimestamp(series.timestamps, selection.$2);

    final double xStart = (selStartIdx - startIdx) * candleWidth;
    final double xEnd = (selEndIdx - startIdx) * candleWidth + candleWidth;

    if (xEnd < 0 || xStart > chartWidth) return;

    final double left = xStart.clamp(0.0, chartWidth);
    final double right = xEnd.clamp(0.0, chartWidth);

    final paint = paintPool.borrow()
      // ignore: deprecated_member_use
      ..color = theme.crosshairColor.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTRB(left, 0, right, size.height), paint);
  }

  void _drawGrid(Canvas canvas, Size size, List<double> ticks) {
    // Cache key for grid depends on size and ticks.
    // Use hashAll for ticks because List equality is referential.
    final Object cacheKey =
        (size.width, size.height, Object.hashAll(ticks), theme.yAxisWidth);

    gridCache.updateIfNeeded(
      cacheKey: cacheKey,
      size: size,
      paint: (ui.Canvas gridCanvas) {
        final paint = paintPool.borrow()
          ..color = theme.gridColor
          ..strokeWidth = 1.0
          ..style = PaintingStyle.stroke;

        final double chartWidth = size.width - theme.yAxisWidth;
        final double viewHeight = size.height;

        // Draw horizontal lines based on price ticks
        final priceRange = calculateVisiblePriceRange();
        final double minPrice = priceRange.$1;
        final double maxPrice = priceRange.$2;
        final double range = maxPrice - minPrice;

        for (final tick in ticks) {
          final double y = viewHeight - ((tick - minPrice) / range * viewHeight);
          gridCanvas.drawLine(Offset(0, y), Offset(chartWidth, y), paint);
        }

        const int verticalLines = 8;
        for (int i = 0; i <= verticalLines; i++) {
          final double x = chartWidth * i / verticalLines;
          gridCanvas.drawLine(Offset(x, 0), Offset(x, viewHeight), paint);
        }

        // Draw Y-axis border line
        if (theme.yAxisWidth > 0) {
          gridCanvas.drawLine(
            Offset(chartWidth, 0),
            Offset(chartWidth, viewHeight),
            paint,
          );
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
      theme.yAxisWidth,
      // ignore: deprecated_member_use
      theme.bullColor.value,
      // ignore: deprecated_member_use
      theme.bearColor.value,
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
        final double chartWidth = size.width - theme.yAxisWidth;

        final int visibleCount = endIdx - startIdx + 1;
        final double candleWidth = chartWidth / visibleCount;
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
          targetVertices[offset++] = wx1;
          targetVertices[offset++] = yHigh;
          targetVertices[offset++] = wx2;
          targetVertices[offset++] = yHigh;
          targetVertices[offset++] = wx2;
          targetVertices[offset++] = yLow;
          targetVertices[offset++] = wx1;
          targetVertices[offset++] = yHigh;
          targetVertices[offset++] = wx2;
          targetVertices[offset++] = yLow;
          targetVertices[offset++] = wx1;
          targetVertices[offset++] = yLow;

          // Body (2 triangles)
          targetVertices[offset++] = x1;
          targetVertices[offset++] = bodyTop;
          targetVertices[offset++] = x2;
          targetVertices[offset++] = bodyTop;
          targetVertices[offset++] = x2;
          targetVertices[offset++] = bodyBottom;
          targetVertices[offset++] = x1;
          targetVertices[offset++] = bodyTop;
          targetVertices[offset++] = x2;
          targetVertices[offset++] = bodyBottom;
          targetVertices[offset++] = x1;
          targetVertices[offset++] = bodyBottom;

          if (isBullish) {
            bullishOffset = offset;
          } else {
            bearishOffset = offset;
          }
        }

        final Paint bullishPaint = paintPool.borrow()..color = theme.bullColor;
        final Paint bearishPaint = paintPool.borrow()..color = theme.bearColor;

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
    final double chartWidth = size.width - theme.yAxisWidth;
    final double viewHeight = size.height;
    final double candleWidth = chartWidth / visibleCount;

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
    final double chartWidth = size.width - theme.yAxisWidth;
    final double viewHeight = size.height;
    final double candleWidth = chartWidth / visibleCount;

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
  SemanticsBuilderCallback? get semanticsBuilder => _buildSemantics;

  List<CustomPainterSemantics> _buildSemantics(Size size) {
    final series = frame.series;
    final viewport = frame.viewport;
    final currentFormatters = formatters;

    if (series.length == 0 || currentFormatters == null) return [];

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);
    final int visibleCount = endIdx - startIdx + 1;
    final double chartWidth = size.width - theme.yAxisWidth;
    final double candleWidth = chartWidth / visibleCount;

    final List<CustomPainterSemantics> nodes = [];

    for (int i = startIdx; i <= endIdx; i++) {
      final label = ChartSemanticsBuilder.buildCandleDescription(
        timestamp: series.timestamps[i],
        open: series.open[i],
        high: series.high[i],
        low: series.low[i],
        close: series.close[i],
        formatters: currentFormatters,
      );

      nodes.add(
        CustomPainterSemantics(
          rect: Rect.fromLTWH(
            (i - startIdx) * candleWidth,
            0,
            candleWidth,
            size.height,
          ),
          properties: SemanticsProperties(
            label: label,
            readOnly: true,
            textDirection: TextDirection.ltr,
          ),
        ),
      );
    }

    return nodes;
  }

  /// Calculates the min and max price in the visible range.
  @visibleForTesting
  (double, double) calculateVisiblePriceRange() {
    final series = frame.series;
    final viewport = frame.viewport;
    if (series.length == 0) return (0.0, 0.0);

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);

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
    return (minPrice, maxPrice);
  }

  /// Calculates "nice" price ticks for the Y-axis.
  @visibleForTesting
  List<double> calculatePriceTicks(double min, double max, int maxTicks) {
    if (min >= max || maxTicks <= 1) return [];

    final double range = _niceNum(max - min, false);
    final double step = _niceNum(range / (maxTicks - 1), true);
    final double graphMin = (min / step).floor() * step;
    final double graphMax = (max / step).ceil() * step;

    final List<double> ticks = [];
    for (double x = graphMin; x <= graphMax + (step / 10); x += step) {
      if (x >= min && x <= max) {
        ticks.add(x);
      }
    }
    return ticks;
  }

  double _niceNum(double range, bool round) {
    final double exponent = (math.log(range) / math.ln10).floorToDouble();
    final double fraction = range / math.pow(10, exponent);
    double niceFraction;

    if (round) {
      if (fraction < 1.5) {
        niceFraction = 1;
      } else if (fraction < 3) {
        niceFraction = 2;
      } else if (fraction < 7) {
        niceFraction = 5;
      } else {
        niceFraction = 10;
      }
    } else {
      if (fraction <= 1) {
        niceFraction = 1;
      } else if (fraction <= 2) {
        niceFraction = 2;
      } else if (fraction <= 5) {
        niceFraction = 5;
      } else {
        niceFraction = 10;
      }
    }

    return niceFraction * math.pow(10, exponent);
  }

  @override
  bool shouldRepaint(covariant MainPanelPainter oldDelegate) {
    return oldDelegate.frame.panelSequenceNumbers['main'] !=
            frame.panelSequenceNumbers['main'] ||
        oldDelegate.theme.yAxisWidth != theme.yAxisWidth;
  }
}
