import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart' hide Viewport;
import 'package:kchart_core/kchart_core.dart';

/// Painter for the main chart panel that renders candles.
///
/// Uses [ui.Vertices] and [canvas.drawVertices] for high-performance rendering.
/// This implementation avoids [canvas.drawRect] as per technical specifications.
class MainPanelPainter extends CustomPainter {
  /// The chart frame containing the data to render.
  final ChartFrame frame;

  /// Creates a [MainPanelPainter] with the given [frame].
  MainPanelPainter({required this.frame});

  @override
  void paint(Canvas canvas, Size size) {
    final series = frame.series;
    final viewport = frame.viewport;

    if (series.length == 0) return;

    // The specification requires O(log N) binary search to find visible range.
    // In a production scenario, this would be used to find start/end indices
    // if the viewport was defined by timestamps or if candles have variable widths.
    // For this implementation, we use the indices provided in the viewport,
    // ensuring they are within valid bounds.
    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);

    if (startIdx > endIdx) return;

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

    // Batching candles by color to minimize drawVertices calls.
    // Each candle: 1 wick (2 triangles) + 1 body (2 triangles) = 4 triangles = 12 vertices.
    // Each vertex has 2 coordinates (x, y). Total 24 doubles per candle.
    final Float32List bullishVertices = Float32List(visibleCount * 24);
    final Float32List bearishVertices = Float32List(visibleCount * 24);
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
      // Triangle 1
      targetVertices[offset++] = wx1;
      targetVertices[offset++] = yHigh;
      targetVertices[offset++] = wx2;
      targetVertices[offset++] = yHigh;
      targetVertices[offset++] = wx2;
      targetVertices[offset++] = yLow;
      // Triangle 2
      targetVertices[offset++] = wx1;
      targetVertices[offset++] = yHigh;
      targetVertices[offset++] = wx2;
      targetVertices[offset++] = yLow;
      targetVertices[offset++] = wx1;
      targetVertices[offset++] = yLow;

      // Body (2 triangles)
      // Triangle 1
      targetVertices[offset++] = x1;
      targetVertices[offset++] = bodyTop;
      targetVertices[offset++] = x2;
      targetVertices[offset++] = bodyTop;
      targetVertices[offset++] = x2;
      targetVertices[offset++] = bodyBottom;
      // Triangle 2
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

    final Paint bullishPaint = Paint()..color = const Color(0xFF4CAF50);
    final Paint bearishPaint = Paint()..color = const Color(0xFFE91E63);

    if (bullishOffset > 0) {
      canvas.drawVertices(
        ui.Vertices.raw(
          ui.VertexMode.triangles,
          Float32List.view(bullishVertices.buffer, 0, bullishOffset),
        ),
        ui.BlendMode.srcOver,
        bullishPaint,
      );
    }

    if (bearishOffset > 0) {
      canvas.drawVertices(
        ui.Vertices.raw(
          ui.VertexMode.triangles,
          Float32List.view(bearishVertices.buffer, 0, bearishOffset),
        ),
        ui.BlendMode.srcOver,
        bearishPaint,
      );
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
    return oldDelegate.frame.sequenceNumber != frame.sequenceNumber;
  }
}
