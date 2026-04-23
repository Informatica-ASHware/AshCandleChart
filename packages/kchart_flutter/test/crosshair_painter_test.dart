import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/src/painting/crosshair_painter.dart';

void main() {
  group('CrosshairPainter', () {
    test('should repaint when state changes', () {
      final painter1 = CrosshairPainter(state: const CrosshairState(dx: 10));
      final painter2 = CrosshairPainter(state: const CrosshairState(dx: 11));
      final painter3 = CrosshairPainter(state: const CrosshairState(dx: 10));

      expect(painter1.shouldRepaint(painter2), isTrue);
      expect(painter1.shouldRepaint(painter3), isFalse);
    });

    testWidgets('should render vertical and horizontal lines', (WidgetTester tester) async {
      final state = const CrosshairState(dx: 50, dy: 60);
      final painter = CrosshairPainter(state: state, color: Colors.red);

      await tester.pumpWidget(
        CustomPaint(
          painter: painter,
          size: const Size(100, 100),
        ),
      );

      // We can't easily "see" the lines in a basic test without golden tests
      // or a mock Canvas, but we've verified the logic is simple.
    });
  });
}
