import 'dart:ui' as ui;
import 'package:flutter/material.dart' hide Viewport;
import 'package:kchart_core/kchart_core.dart';
import 'layer_cache.dart';
import 'paint_pool.dart';
import '../theme.dart';

/// Painter for secondary panels (Volume, RSI, etc.).
class SecondaryPanelPainter extends CustomPainter {
  /// The chart frame containing the data to render.
  final ChartFrame frame;

  /// Pool for reusing [Paint] objects.
  final PaintPool paintPool;

  /// Cache for the drawing layer.
  final LayerCache cache;

  /// The ID of the indicator to render.
  final String indicatorId;

  /// The theme to use for painting.
  final ChartTheme theme;

  /// Creates a [SecondaryPanelPainter].
  SecondaryPanelPainter({
    required this.frame,
    required this.paintPool,
    required this.cache,
    required this.indicatorId,
    required this.theme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (indicatorId == 'volume') {
      _drawVolume(canvas, size);
    } else {
      _drawIndicator(canvas, size);
    }
    paintPool.releaseAll();
  }

  void _drawVolume(Canvas canvas, Size size) {
    final series = frame.series;
    final viewport = frame.viewport;
    if (series.length == 0) return;

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);

    final Object cacheKey = (
      frame.panelSequenceNumbers['volume'] ?? 0,
      frame.panelSequenceNumbers[indicatorId] ?? 0,
      viewport.startIdx,
      viewport.endIdx,
      size.width,
      size.height,
      'volume',
      // ignore: deprecated_member_use
      theme.bullColor.value,
      // ignore: deprecated_member_use
      theme.bearColor.value,
    );

    cache.updateIfNeeded(
      cacheKey: cacheKey,
      size: size,
      paint: (ui.Canvas volumeCanvas) {
        double maxVolume = 0;
        for (int i = startIdx; i <= endIdx; i++) {
          if (series.volume[i] > maxVolume) maxVolume = series.volume[i];
        }

        if (maxVolume == 0) return;

        final double viewWidth = size.width;
        final double viewHeight = size.height;
        final int visibleCount = endIdx - startIdx + 1;
        final double barWidth = viewWidth / visibleCount;
        final double bodyWidth = barWidth * 0.8;

        final Paint bullPaint = paintPool.borrow()
          // ignore: deprecated_member_use
          ..color = theme.bullColor.withOpacity(0.5);
        final Paint bearPaint = paintPool.borrow()
          // ignore: deprecated_member_use
          ..color = theme.bearColor.withOpacity(0.5);

        for (int i = startIdx; i <= endIdx; i++) {
          final double vol = series.volume[i];
          final double h = (vol / maxVolume) * viewHeight;
          final double centerX = (i - startIdx) * barWidth + barWidth / 2;
          final double x1 = centerX - bodyWidth / 2;

          final bool isBullish = series.close[i] >= series.open[i];
          final Paint paint = isBullish ? bullPaint : bearPaint;

          volumeCanvas.drawRect(
            Rect.fromLTWH(x1, viewHeight - h, bodyWidth, h),
            paint,
          );
        }
      },
    );

    if (cache.picture != null) {
      canvas.drawPicture(cache.picture!);
    }
  }

  void _drawIndicator(Canvas canvas, Size size) {
    final series = frame.indicators[indicatorId];
    if (series == null || series.length == 0) return;

    final viewport = frame.viewport;
    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);

    final Object cacheKey = (
      frame.sequenceNumber,
      viewport.startIdx,
      viewport.endIdx,
      size.width,
      size.height,
      indicatorId,
    );

    cache.updateIfNeeded(
      cacheKey: cacheKey,
      size: size,
      paint: (ui.Canvas indicatorCanvas) {
        // Simple line drawing for indicators like RSI
        double minValue = double.infinity;
        double maxValue = double.negativeInfinity;

        // Using close as a proxy for the indicator value for now,
        // as IndicatorSeries should have it.
        for (int i = startIdx; i <= endIdx; i++) {
          final val = series.close[i];
          if (val < minValue) minValue = val;
          if (val > maxValue) maxValue = val;
        }

        if (minValue == maxValue) {
          minValue -= 1.0;
          maxValue += 1.0;
        }

        final double range = maxValue - minValue;
        final double viewHeight = size.height;
        final double viewWidth = size.width;
        final int visibleCount = endIdx - startIdx + 1;
        final double stepX = viewWidth / visibleCount;

        final Path path = Path();
        bool first = true;

        for (int i = startIdx; i <= endIdx; i++) {
          final double val = series.close[i];
          final double x = (i - startIdx) * stepX + stepX / 2;
          final double y = viewHeight - ((val - minValue) / range * viewHeight);

          if (first) {
            path.moveTo(x, y);
            first = false;
          } else {
            path.lineTo(x, y);
          }
        }

        final Paint paint = paintPool.borrow()
          ..color = theme.tradeLineColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;

        indicatorCanvas.drawPath(path, paint);
      },
    );

    if (cache.picture != null) {
      canvas.drawPicture(cache.picture!);
    }
  }

  @override
  bool shouldRepaint(covariant SecondaryPanelPainter oldDelegate) {
    return oldDelegate.frame.panelSequenceNumbers[indicatorId] !=
            frame.panelSequenceNumbers[indicatorId] ||
        oldDelegate.indicatorId != indicatorId;
  }
}
