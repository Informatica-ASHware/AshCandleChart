import 'package:flutter/material.dart';
import 'package:kchart_core/kchart_core.dart';

/// Painter for the crosshair.
///
/// Renders a vertical line across all panels and a horizontal line
/// at the current price/value level within the panel.
class CrosshairPainter extends CustomPainter {
  /// The current state of the crosshair.
  final CrosshairState? state;

  /// The color of the crosshair lines.
  final Color color;

  /// The width of the crosshair lines.
  final double strokeWidth;

  /// The width of the Y-axis margin to exclude from the crosshair lines.
  final double yAxisWidth;

  /// Creates a [CrosshairPainter].
  CrosshairPainter({
    required this.state,
    this.color = Colors.grey,
    this.strokeWidth = 1.0,
    this.yAxisWidth = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final currentState = state;
    if (currentState == null) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double chartWidth = size.width - yAxisWidth;

    // Draw vertical line (if dx is within bounds)
    if (currentState.dx != null &&
        currentState.dx! >= 0 &&
        currentState.dx! <= chartWidth) {
      canvas.drawLine(
        Offset(currentState.dx!, 0),
        Offset(currentState.dx!, size.height),
        paint,
      );
    }

    // Draw horizontal line (if dy is within bounds)
    if (currentState.dy != null &&
        currentState.dy! >= 0 &&
        currentState.dy! <= size.height) {
      canvas.drawLine(
        Offset(0, currentState.dy!),
        Offset(chartWidth, currentState.dy!),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CrosshairPainter oldDelegate) {
    return oldDelegate.state != state ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.yAxisWidth != yAxisWidth;
  }
}
