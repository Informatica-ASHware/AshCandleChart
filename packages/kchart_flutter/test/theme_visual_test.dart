import 'dart:typed_data';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';

void main() {
  group('ChartTheme Golden Tests', () {
    late ChartFrame frame;

    setUp(() {
      final int n = 50;
      final timestamps = Int64List(n);
      final open = Float64List(n);
      final high = Float64List(n);
      final low = Float64List(n);
      final close = Float64List(n);
      final volume = Float64List(n);

      for (int i = 0; i < n; i++) {
        timestamps[i] = i * 1000;
        open[i] = 100.0 + i;
        high[i] = open[i] + 5;
        low[i] = open[i] - 5;
        close[i] = open[i] + (i % 2 == 0 ? 2 : -2);
        volume[i] = 100.0;
      }

      frame = ChartFrame(
        series: Series(
          timestamps: timestamps,
          open: open,
          high: high,
          low: low,
          close: close,
          volume: volume,
        ),
        indicators: {},
        viewport:
            const Viewport(startIdx: 0, endIdx: 49, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 0,
        panelSequenceNumbers: const {'main': 0, 'volume': 0},
      );
    });

    testWidgets('Renders light theme correctly', (WidgetTester tester) async {
      final controller = KChartController(frame: frame);
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: KChart(
                  controller: controller,
                  theme: ChartTheme.light(),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(KChart),
        matchesGoldenFile('goldens/theme_light.png'),
      );
    });

    testWidgets('Renders dark theme correctly', (WidgetTester tester) async {
      final controller = KChartController(frame: frame);
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: const Color(0xFF121212),
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: KChart(
                  controller: controller,
                  theme: ChartTheme.dark(),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(KChart),
        matchesGoldenFile('goldens/theme_dark.png'),
      );
    });
  });
}
