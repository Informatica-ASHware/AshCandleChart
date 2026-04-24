import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:flutter/material.dart' hide Viewport;

void main() {
  Series createSeries(int count, {int startTs = 0}) {
    return Series(
      timestamps: Int64List.fromList(List.generate(count, (i) => startTs + i * 1000)),
      open: Float64List.fromList(List.generate(count, (i) => 100.0 + i)),
      high: Float64List.fromList(List.generate(count, (i) => 110.0 + i)),
      low: Float64List.fromList(List.generate(count, (i) => 90.0 + i)),
      close: Float64List.fromList(List.generate(count, (i) => 105.0 + i)),
      volume: Float64List(count),
    );
  }

  ChartFrame createFrame(Series series) {
    return ChartFrame(
      series: series,
      indicators: {},
      viewport: const Viewport(startIdx: 0, endIdx: 10, scale: 1.0, scrollX: 0),
      overlays: [],
      sequenceNumber: 0,
      panelSequenceNumbers: {'main': 0},
    );
  }

  Widget buildChartGrid({
    required int count,
    KChartGridLayout layout = KChartGridLayout.grid,
    SyncEngine? syncEngine,
  }) {
    final charts = List.generate(count, (i) {
      final controller = KChartController(frame: createFrame(createSeries(100)));
      return KChart(
        key: ValueKey('chart_$i'),
        controller: controller,
        theme: ChartTheme.dark(),
      );
    });

    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 800,
          height: 600,
          child: KChartGrid(
            charts: charts,
            layout: layout,
            syncEngine: syncEngine,
          ),
        ),
      ),
    );
  }

  testWidgets('KChartGrid renders in grid layout', (WidgetTester tester) async {
    await tester.pumpWidget(buildChartGrid(count: 4, layout: KChartGridLayout.grid));
    await tester.pumpAndSettle();

    expect(find.byType(KChart), findsNWidgets(4));

    // Check approximate positions to ensure it's a grid
    final chart0 = tester.getTopLeft(find.byKey(const ValueKey('chart_0')));
    final chart1 = tester.getTopLeft(find.byKey(const ValueKey('chart_1')));
    final chart2 = tester.getTopLeft(find.byKey(const ValueKey('chart_2')));

    expect(chart0.dx, equals(0));
    expect(chart0.dy, equals(0));
    expect(chart1.dx, greaterThan(0));
    expect(chart1.dy, equals(0));
    expect(chart2.dx, equals(0));
    expect(chart2.dy, greaterThan(0));
  });

  testWidgets('KChartGrid renders in mainAndOthers layout', (WidgetTester tester) async {
    await tester.pumpWidget(buildChartGrid(count: 3, layout: KChartGridLayout.mainAndOthers));
    await tester.pumpAndSettle();

    expect(find.byType(KChart), findsNWidgets(3));

    final chart0 = tester.getSize(find.byKey(const ValueKey('chart_0')));
    final chart1 = tester.getSize(find.byKey(const ValueKey('chart_1')));

    expect(chart0.width, greaterThan(chart1.width));
  });
}
