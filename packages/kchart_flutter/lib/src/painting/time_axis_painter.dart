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

        // Determine if we should use time or date format for the entire axis
        // If the visible range is less than 2 days, use time format.
        final bool isIntraday =
            (series.timestamps[endIdx] - series.timestamps[startIdx]) <
                86400000 * 2;

        for (int i = startIdx; i <= endIdx; i += step) {
          final int timestamp = series.timestamps[i];
          final String label =
              formatters.formatXAxisLabel(timestamp, isSameDay: isIntraday);

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

  @override
  bool shouldRepaint(covariant TimeAxisPainter oldDelegate) {
    return oldDelegate.frame.sequenceNumber != frame.sequenceNumber ||
        oldDelegate.frame.viewport != frame.viewport ||
        oldDelegate.theme.xAxisHeight != theme.xAxisHeight ||
        oldDelegate.theme.yAxisWidth != theme.yAxisWidth;
  }
}
