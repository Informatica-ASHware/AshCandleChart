import 'dart:typed_data';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';

void main() {
  testWidgets('Y-axis rendering golden test', (WidgetTester tester) async {
    final frame = ChartFrame(
      series: Series(
        timestamps: Int64List.fromList([1000, 2000, 3000, 4000, 5000]),
        open: Float64List.fromList([100, 110, 105, 115, 120]),
        high: Float64List.fromList([120, 130, 125, 135, 140]),
        low: Float64List.fromList([90, 100, 95, 105, 110]),
        close: Float64List.fromList([110, 105, 115, 120, 130]),
        volume: Float64List.fromList([1000, 2000, 1500, 2500, 3000]),
      ),
      indicators: {},
      viewport: const Viewport(startIdx: 0, endIdx: 4, scale: 1.0, scrollX: 0.0),
      overlays: [],
      sequenceNumber: 0,
      panelSequenceNumbers: const {'main': 0},
    );
    final controller = KChartController(frame: frame);

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 800,
              height: 400,
              child: KChart(
                controller: controller,
                theme: ChartTheme.dark().copyWith(yAxisWidth: 80.0),
              ),
            ),
          ),
        ),
      ),
    );

    await expectLater(
      find.byType(KChart),
      matchesGoldenFile('goldens/y_axis_render.png'),
    );
  });
}
