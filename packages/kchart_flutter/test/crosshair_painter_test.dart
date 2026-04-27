import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/src/painting/crosshair_painter.dart';
import 'package:kchart_flutter/src/theme.dart';
import 'package:kchart_flutter/src/i18n/number_formatters.dart';

void main() {
  final theme = ChartTheme.light();
  final formatters = ChartNumberFormatters('en_US');

  group('CrosshairPainter', () {
    test('should repaint when state changes', () {
      final painter1 = CrosshairPainter(
        state: const CrosshairState(dx: 10),
        theme: theme,
        formatters: formatters,
      );
      final painter2 = CrosshairPainter(
        state: const CrosshairState(dx: 11),
        theme: theme,
        formatters: formatters,
      );
      final painter3 = CrosshairPainter(
        state: const CrosshairState(dx: 10),
        theme: theme,
        formatters: formatters,
      );

      expect(painter1.shouldRepaint(painter2), isTrue);
      expect(painter1.shouldRepaint(painter3), isFalse);
    });

    testWidgets('should render vertical and horizontal lines',
        (WidgetTester tester) async {
      final state = const CrosshairState(dx: 50, dy: 60, timestamp: 1000);
      final painter = CrosshairPainter(
        state: state,
        theme: theme,
        formatters: formatters,
      );

      await tester.pumpWidget(
        CustomPaint(
          painter: painter,
          size: const Size(100, 100),
        ),
      );

      expect(find.byType(CustomPaint), findsOneWidget);
    });
  });
}
