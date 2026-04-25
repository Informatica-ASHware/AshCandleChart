import 'dart:ui' as ui;
import 'package:flutter/material.dart' hide Viewport;
import 'package:kchart_core/kchart_core.dart';
import '../i18n/number_formatters.dart';
import '../theme.dart';
import 'layer_cache.dart';

/// Painter for the X-axis (timeline) that renders time labels.
class TimeAxisPainter extends CustomPainter {
  /// The chart frame containing the data and viewport.
  final ChartFrame frame;

  /// The theme providing colors and text styles.
  final ChartTheme theme;

  /// Formatters for time labels.
  final ChartNumberFormatters formatters;

  /// Cache for the timeline layer.
  final LayerCache cache;

  /// Creates a [TimeAxisPainter].
  TimeAxisPainter({
    required this.frame,
    required this.theme,
    required this.formatters,
    required this.cache,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final series = frame.series;
    final viewport = frame.viewport;
    if (series.length == 0) return;

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);
    if (startIdx >= endIdx) return;

    final double chartWidth = size.width - theme.yAxisWidth;
    if (chartWidth <= 0) return;

    // Cache key depends on viewport and size
    final Object cacheKey = (
      viewport.startIdx,
      viewport.endIdx,
      viewport.scrollX,
      size.width,
      size.height,
      theme.yAxisWidth,
      theme.xAxisHeight,
      formatters.locale,
    );

    cache.updateIfNeeded(
      cacheKey: cacheKey,
      size: size,
      paint: (ui.Canvas timelineCanvas) {
        final int visibleCount = endIdx - startIdx + 1;
        final double candleWidth = chartWidth / visibleCount;

        // Determine how many labels can fit
        const double minLabelWidth = 60.0;
        final int maxLabels = (chartWidth / minLabelWidth).floor();
        if (maxLabels <= 0) return;

        // Simple approach: pick N labels distributed equitably
        final int step = (visibleCount / maxLabels).ceil();

        for (int i = startIdx; i <= endIdx; i += step) {
          final int timestamp = series.timestamps[i];

          // Check if it's the same day as previous label (approximate for now)
          // For a more robust approach, we could compare with the first visible candle's day
          final bool isSameDay = _isSameDay(series.timestamps[startIdx], timestamp);
          final String label = formatters.formatXAxisLabel(timestamp, isSameDay: isSameDay);

          final textPainter = TextPainter(
            text: TextSpan(
              text: label,
              style: theme.axisTextStyle,
            ),
            textDirection: TextDirection.ltr,
          );
          textPainter.layout();

          final double x = (i - startIdx) * candleWidth + candleWidth / 2;
          // Center the label at X, and at vertical center of xAxisHeight
          textPainter.paint(
            timelineCanvas,
            Offset(x - textPainter.width / 2, (size.height - textPainter.height) / 2),
          );
        }
      },
    );

    if (cache.picture != null) {
      canvas.drawPicture(cache.picture!);
    }
  }

  bool _isSameDay(int ts1, int ts2) {
    final d1 = DateTime.fromMillisecondsSinceEpoch(ts1, isUtc: true);
    final d2 = DateTime.fromMillisecondsSinceEpoch(ts2, isUtc: true);
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  @override
  bool shouldRepaint(covariant TimeAxisPainter oldDelegate) {
    return oldDelegate.frame.sequenceNumber != frame.sequenceNumber ||
        oldDelegate.frame.viewport != frame.viewport ||
        oldDelegate.theme.xAxisHeight != theme.xAxisHeight ||
        oldDelegate.theme.yAxisWidth != theme.yAxisWidth;
  }
}
