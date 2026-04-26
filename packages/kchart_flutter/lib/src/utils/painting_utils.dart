import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Utilities for common painting tasks.
class PaintingUtils {
  /// Draws a dashed line from [p1] to [p2].
  static void drawDashedLine(
    Canvas canvas,
    Offset p1,
    Offset p2,
    Paint paint, {
    double dashWidth = 4.0,
    double dashSpace = 4.0,
  }) {
    double distance = (p2 - p1).distance;
    if (distance <= 0) return;

    double dx = (p2.dx - p1.dx) / distance;
    double dy = (p2.dy - p1.dy) / distance;
    double currentDist = 0;
    while (currentDist < distance) {
      canvas.drawLine(
        p1 + Offset(dx * currentDist, dy * currentDist),
        p1 + Offset(
          dx * math.min(currentDist + dashWidth, distance),
          dy * math.min(currentDist + dashWidth, distance),
        ),
        paint,
      );
      currentDist += dashWidth + dashSpace;
    }
  }
}
