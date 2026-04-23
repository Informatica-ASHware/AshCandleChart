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

  /// Creates a [CrosshairPainter].
  CrosshairPainter({
    required this.state,
    this.color = Colors.grey,
    this.strokeWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final currentState = state;
    if (currentState == null) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Draw vertical line (if dx is within bounds)
    if (currentState.dx != null &&
        currentState.dx! >= 0 &&
        currentState.dx! <= size.width) {
      canvas.drawLine(
        Offset(currentState.dx!, 0),
        Offset(currentState.dx!, size.height),
        paint,
      );
    }

    // Draw horizontal line (if dy is within bounds)
    // dy is provided relative to the KChart root.
    // We assume the painter is rendered in a panel that starts at some offset.
    // However, since we don't know the panel's offset here,
    // we should have dy be relative to the panel, or use a better approach.
    // For now, we'll draw it if dy is between 0 and size.height (local coords).
    if (currentState.dy != null &&
        currentState.dy! >= 0 &&
        currentState.dy! <= size.height) {
      canvas.drawLine(
        Offset(0, currentState.dy!),
        Offset(size.width, currentState.dy!),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CrosshairPainter oldDelegate) {
    return oldDelegate.state != state ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
