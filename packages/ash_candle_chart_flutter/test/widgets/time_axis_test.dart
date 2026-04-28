import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:ash_candle_chart_flutter/ash_candle_chart_flutter.dart';
import 'package:ash_candle_chart_core/ash_candle_chart_core.dart';
import 'dart:typed_data';

void main() {
  testWidgets('TimeAxisPanel renders labels correctly', (WidgetTester tester) async {
    // 1. Setup mock data
    final timestamps = Int64List.fromList(List.generate(100, (i) =>
      DateTime(2023, 1, 1, 10, i).millisecondsSinceEpoch
    ));
    final data = Float64List(100)..fillRange(0, 100, 100.0);

    final series = Series(
      timestamps: timestamps,
      open: data,
      high: data,
      low: data,
      close: data,
      volume: data,
    );

    final frame = ChartFrame(
      series: series,
      indicators: {},
      viewport: const Viewport(startIdx: 0, endIdx: 10, scale: 1.0, scrollX: 0.0),
      overlays: [],
      sequenceNumber: 1,
      panelSequenceNumbers: {'main': 1},
    );

    final controller = KChartController(frame: frame);

    // 2. Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 500,
            height: 300,
            child: KChart(controller: controller),
          ),
        ),
      ),
    );

    // 3. Verify it renders
    expect(find.byType(TimeAxisPanel), findsOneWidget);

    // 4. Verify specific labels (approximate, since it's a CustomPaint)
    // We can't easily find.text() for labels drawn via TextPainter in CustomPaint,
    // but we can check if it repaints on pan.

    final initialTimeRange = controller.getVisibleTimeRange();
    expect(initialTimeRange.$1, timestamps[0]);

    // Pan the chart (delta -200 should move more than one candle since chartWidth is 500-60 and 5 candles)
    // candleWidth = 440 / 5 = 88.
    await tester.drag(find.byType(KChart), const Offset(-200, 0));
    await tester.pump();

    // Viewport should have changed
    final newTimeRange = controller.getVisibleTimeRange();
    expect(newTimeRange.$1, isNot(initialTimeRange.$1));
  });
}
