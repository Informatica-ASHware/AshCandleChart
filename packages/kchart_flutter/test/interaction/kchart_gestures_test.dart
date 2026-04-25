import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:kchart_core/kchart_core.dart';

void main() {
  group('KChart Gestures Test', () {
    late KChartController controller;
    final List<Candle> candles = List.generate(100, (i) {
      return Candle(
        timestamp: 1600000000000 + (i * 60000),
        open: 100.0 + i,
        high: 105.0 + i,
        low: 95.0 + i,
        close: 102.0 + i,
        volume: 1000.0,
      );
    });

    Widget createTestApp() {
      controller = KChartController(
        frame: ChartFrame(
          series: Series.fromCandles(candles),
          viewport: const Viewport(
            startIdx: 50,
            endIdx: 69,
            scale: 1.0,
            scrollX: 0.0,
          ),
          indicators: {},
          overlays: [],
          sequenceNumber: 0,
          panelSequenceNumbers: {'main': 0, 'volume': 0},
        ),
      );

      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 800,
              height: 600,
              child: KChart(controller: controller),
            ),
          ),
        ),
      );
    }

    testWidgets('Pan gesture updates viewport', (tester) async {
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      final initialStartIdx = controller.frame.viewport.startIdx;

      // Candle width for 800px width and 20 visible candles is 40.
      // If we drag left by -200, indexDelta = truncate(-200 / 40) = -5.
      // newStartIdx = 80 - (-5) = 85.

      final gesture = await tester.startGesture(const Offset(400, 300));
      await gesture.moveBy(const Offset(-10, 0)); // First move to pass the 10.0 threshold
      await tester.pump();
      await gesture.moveBy(const Offset(-200, 0));
      await gesture.up();
      await tester.pumpAndSettle();

      expect(controller.frame.viewport.startIdx, isNot(initialStartIdx), reason: 'Viewport startIdx should have changed. Current: ${controller.frame.viewport.startIdx}');
      expect(controller.frame.viewport.startIdx, greaterThan(initialStartIdx));
    });

    testWidgets('Pinch-to-zoom updates visible count', (tester) async {
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      final initialVisibleCount =
          controller.frame.viewport.endIdx - controller.frame.viewport.startIdx + 1;

      // Simulate pinch-to-zoom (outward to zoom in -> fewer candles)
      // Zooming in KChart:
      // newVisibleCount = (visibleCount / scaleFactor).round();
      // scaleFactor = 1.1 -> newVisibleCount = visibleCount / 1.1 (smaller)

      final center = tester.getCenter(find.byType(KChart));
      final gesture1 = await tester.createGesture(pointer: 1);
      final gesture2 = await tester.createGesture(pointer: 2);

      await gesture1.down(center + const Offset(-10, 0));
      await gesture2.down(center + const Offset(10, 0));

      await gesture1.moveBy(const Offset(-50, 0));
      await gesture2.moveBy(const Offset(50, 0));

      await gesture1.up();
      await gesture2.up();

      await tester.pumpAndSettle();

      final finalVisibleCount =
          controller.frame.viewport.endIdx - controller.frame.viewport.startIdx + 1;
      expect(finalVisibleCount, lessThan(initialVisibleCount));
    });

    testWidgets('Long-press activates crosshair', (tester) async {
      await tester.pumpWidget(createTestApp());
      await tester.pumpAndSettle();

      expect(controller.crosshair.state.value, isNull);

      final center = tester.getCenter(find.byType(KChart));

      // We use a gesture to have fine control over the timing
      final gesture = await tester.startGesture(center);
      // Wait for long press timeout (default 500ms)
      await tester.pump(const Duration(milliseconds: 600));

      expect(controller.crosshair.state.value, isNotNull, reason: 'Crosshair should be active after long press timeout');
      expect(controller.crosshair.state.value!.timestamp, isNotNull);

      await gesture.up();
      await tester.pumpAndSettle();
      expect(controller.crosshair.state.value, isNull, reason: 'Crosshair should be cleared after pointer up');
    });
  });
}
