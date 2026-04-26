import 'package:flutter/material.dart';
import 'package:kchart_core/kchart_core.dart';
import '../theme.dart';
import '../i18n/number_formatters.dart';
import '../utils/painting_utils.dart';

/// Painter for the crosshair.
///
/// Renders a vertical line across all panels and a horizontal line
/// at the current price/value level within the panel.
class CrosshairPainter extends CustomPainter {
  /// The current state of the crosshair.
  final CrosshairState? state;

  /// The theme providing colors and text styles.
  final ChartTheme theme;

  /// Formatters for time and price labels.
  final ChartNumberFormatters formatters;

  /// The width of the Y-axis margin to exclude from the crosshair lines.
  final double yAxisWidth;

  /// Creates a [CrosshairPainter].
  CrosshairPainter({
    required this.state,
    required this.theme,
    required this.formatters,
    this.yAxisWidth = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final currentState = state;
    if (currentState == null) return;

    final paint = Paint()
      ..color = theme.crosshairColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final double chartWidth = size.width - yAxisWidth;

    // Draw vertical line (if dx is within bounds)
    if (currentState.dx != null &&
        currentState.dx! >= 0 &&
        currentState.dx! <= chartWidth) {
      PaintingUtils.drawDashedLine(
        canvas,
        Offset(currentState.dx!, 0),
        Offset(currentState.dx!, size.height),
        paint,
      );

      // Draw X-axis label
      if (currentState.timestamp != null) {
        _drawXAxisLabel(canvas, size, currentState.dx!, currentState.timestamp!);
      }
    }
  }

  /// Draws the X-axis label at the bottom of the chart.
  void _drawXAxisLabel(Canvas canvas, Size size, double dx, int timestamp) {
    final label = formatters.formatTimestamp(timestamp);

    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: theme.crosshairTextStyle,
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final double labelWidth = textPainter.width + 8;
    final double labelHeight = textPainter.height + 4;

    double x = dx - labelWidth / 2;
    // Keep within chart bounds
    x = x.clamp(0.0, size.width - yAxisWidth - labelWidth);

    final double y = size.height - labelHeight;

    final rect = Rect.fromLTWH(x, y, labelWidth, labelHeight);
    final bgPaint = Paint()
      ..color = theme.crosshairColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(4)), bgPaint);
    textPainter.paint(canvas, Offset(x + 4, y + 2));
  }

  @override
  bool shouldRepaint(covariant CrosshairPainter oldDelegate) {
    return oldDelegate.state != state ||
        oldDelegate.theme != theme ||
        oldDelegate.formatters != formatters ||
        oldDelegate.yAxisWidth != yAxisWidth;
  }
}
