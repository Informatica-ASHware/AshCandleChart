import 'dart:typed_data';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';

void main() {
  /// US 3.02: Performance Lab - Golden Test
  /// Ensures visual rendering remains consistent across changes.
  testWidgets('Golden Test - 50k candles viewport rendering',
      (WidgetTester tester) async {
    final int n = 50000;
    final timestamps = Int64List(n);
    final open = Float64List(n);
    final high = Float64List(n);
    final low = Float64List(n);
    final close = Float64List(n);
    final volume = Float64List(n);

    double lastClose = 100.0;
    for (int i = 0; i < n; i++) {
      timestamps[i] = 1700000000000 + i * 60000;
      final double o = lastClose;
      final double change = (i % 10 - 5) * 0.1;
      final double c = o + change;
      open[i] = o;
      close[i] = c;
      high[i] = (o > c ? o : c) + 0.2;
      low[i] = (o < c ? o : c) - 0.2;
      volume[i] = 100.0 + (i % 50);
      lastClose = c;
    }

    final frame = ChartFrame(
      series: Series(
        timestamps: timestamps,
        open: open,
        high: high,
        low: low,
        close: close,
        volume: volume,
      ),
      indicators: {},
      viewport: const Viewport(
          startIdx: 25000, endIdx: 25100, scale: 1.0, scrollX: 0.0),
      overlays: [],
      sequenceNumber: 0,
      panelSequenceNumbers: const {'main': 0},
    );
    final controller = KChartController(frame: frame);

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 800,
              height: 600,
              child: KChart(controller: controller),
            ),
          ),
        ),
      ),
    );

    await expectLater(
      find.byType(KChart),
      matchesGoldenFile('goldens/kchart_50k_fixture.png'),
    );
  });
}
