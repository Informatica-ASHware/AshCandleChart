import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart' hide Viewport;
import 'package:kchart_core/kchart_core.dart';
import '../painting/paint_pool.dart';

/// Painter for trade overlays (markers and positions).
class TradeOverlayPainter {
  /// The pool for reusing [Paint] objects.
  final PaintPool paintPool;

  /// Creates a [TradeOverlayPainter] with the given [paintPool].
  TradeOverlayPainter({required this.paintPool});

  /// Draws the trade overlays on the given [canvas].
  void draw(
    Canvas canvas,
    Size size,
    ChartFrame frame,
    double Function(double price) priceToY,
    double Function(int timestamp) timestampToX,
  ) {
    final overlays = frame.tradeOverlays.overlays;
    if (overlays.isEmpty) return;

    for (final overlay in overlays) {
      if (overlay is TradeMarker) {
        _drawMarker(canvas, overlay, priceToY, timestampToX);
      } else if (overlay is PositionOverlay) {
        _drawPosition(canvas, size, overlay, priceToY);
      }
    }
  }

  void _drawMarker(
    Canvas canvas,
    TradeMarker marker,
    double Function(double price) priceToY,
    double Function(int timestamp) timestampToX,
  ) {
    final x = timestampToX(marker.point.timestamp);
    final y = priceToY(marker.point.price);

    final paint = paintPool.borrow()
      ..color = Color(marker.color)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(x, y), marker.size / 2, paint);

    if (marker.label != null) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: marker.label,
          style: TextStyle(color: Color(marker.color), fontSize: 10),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x + marker.size, y - textPainter.height / 2));
    }
  }

  void _drawPosition(
    Canvas canvas,
    Size size,
    PositionOverlay position,
    double Function(double price) priceToY,
  ) {
    final yEntry = priceToY(position.entryPrice);

    // Draw profit zone
    if (position.takeProfit != null) {
      final yTP = priceToY(position.takeProfit!);
      final top = yTP < yEntry ? yTP : yEntry;
      final bottom = yTP < yEntry ? yEntry : yTP;

      final profitPaint = paintPool.borrow()..color = Color(position.profitColor);

      final vertices = Float32List.fromList([
        0, top,
        size.width, top,
        size.width, bottom,
        0, top,
        size.width, bottom,
        0, bottom,
      ]);

      canvas.drawVertices(
        ui.Vertices.raw(ui.VertexMode.triangles, vertices),
        ui.BlendMode.srcOver,
        profitPaint,
      );

      final tpLinePaint = paintPool.borrow()
        // ignore: deprecated_member_use
        ..color = Color(position.profitColor).withOpacity(1.0)
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;
      canvas.drawLine(Offset(0, yTP), Offset(size.width, yTP), tpLinePaint);
    }

    // Draw loss zone
    if (position.stopLoss != null) {
      final ySL = priceToY(position.stopLoss!);
      final top = ySL < yEntry ? ySL : yEntry;
      final bottom = ySL < yEntry ? yEntry : ySL;

      final lossPaint = paintPool.borrow()..color = Color(position.lossColor);

      final vertices = Float32List.fromList([
        0, top,
        size.width, top,
        size.width, bottom,
        0, top,
        size.width, bottom,
        0, bottom,
      ]);

      canvas.drawVertices(
        ui.Vertices.raw(ui.VertexMode.triangles, vertices),
        ui.BlendMode.srcOver,
        lossPaint,
      );

      final slLinePaint = paintPool.borrow()
        // ignore: deprecated_member_use
        ..color = Color(position.lossColor).withOpacity(1.0)
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;
      canvas.drawLine(Offset(0, ySL), Offset(size.width, ySL), slLinePaint);
    }

    // Draw entry line
    final entryPaint = paintPool.borrow()
      ..color = Color(position.entryColor)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, yEntry), Offset(size.width, yEntry), entryPaint);
  }
}
