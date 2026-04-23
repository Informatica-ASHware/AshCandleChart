import 'dart:typed_data';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';

void main() {
  late KChartController controller;

  Series createSeries(int n) {
    final timestamps = Int64List(n);
    final values = Float64List(n);
    for (int i = 0; i < n; i++) {
      timestamps[i] = i * 1000;
      values[i] = 100.0 + i;
    }
    return Series(
      timestamps: timestamps,
      open: values,
      high: values,
      low: values,
      close: values,
      volume: values,
    );
  }

  setUp(() {
    final series = createSeries(100);
    final frame = ChartFrame(
      series: series,
      indicators: {},
      viewport: const Viewport(startIdx: 40, endIdx: 50, scale: 1.0, scrollX: 0.0),
      overlays: [],
      sequenceNumber: 0,
      panelSequenceNumbers: const {'main': 0},
    );
    controller = KChartController(frame: frame);
  });

  testWidgets('Fling continues to pan the chart and then snaps', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 500,
            height: 500,
            child: KChart(controller: controller),
          ),
        ),
      ),
    );

    final initialStartIdx = controller.frame.viewport.startIdx;

    // Fling from left to right (scroll backward in time)
    // Offset is positive to drag to the right
    await tester.fling(find.byType(KChart), const Offset(200, 0), 1000);

    // During fling, startIdx should decrease
    await tester.pump(const Duration(milliseconds: 50));
    expect(controller.frame.viewport.startIdx, lessThan(initialStartIdx));

    // Wait for fling to finish and snap to occur
    await tester.pumpAndSettle();

    // After snap, scrollX should be 0
    expect(controller.frame.viewport.scrollX, 0.0);
  });

  testWidgets('Small drag snaps to candle without fling', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 500,
            height: 500,
            child: KChart(controller: controller),
          ),
        ),
      ),
    );

    // Small drag that doesn't trigger fling
    // We need enough distance to trigger the pan state in GestureArbiter (>10)
    final gesture = await tester.startGesture(const Offset(250, 250));
    await gesture.moveBy(const Offset(20, 0));
    await tester.pump();

    // scrollX should be around 20 (depending on candleWidth, but definitely not 0)
    expect(controller.frame.viewport.scrollX, isNot(0.0));

    await gesture.up();
    await tester.pumpAndSettle();

    // Should have snapped back to 0 (or another candle boundary if dragged far enough)
    expect(controller.frame.viewport.scrollX, 0.0);
  });
}
