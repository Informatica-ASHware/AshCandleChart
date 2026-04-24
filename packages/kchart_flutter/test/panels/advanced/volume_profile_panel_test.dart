import 'dart:typed_data';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:kchart_flutter/src/panels/advanced/volume_profile_panel.dart';
import 'package:kchart_flutter/src/widgets/kchart_scope.dart';

void main() {
  group('VolumeProfilePanel Golden Tests', () {
    late KChartController controller;
    late Series series;

    setUp(() {
      final n = 20;
      final timestamps = Int64List.fromList(List.generate(n, (i) => i * 1000));
      final open = Float64List.fromList(List.generate(n, (i) => 100.0 + i));
      final high = Float64List.fromList(List.generate(n, (i) => 105.0 + i));
      final low = Float64List.fromList(List.generate(n, (i) => 95.0 + i));
      final close = Float64List.fromList(List.generate(n, (i) => 100.0 + i));
      final volume = Float64List.fromList(List.generate(n, (i) => 100.0));

      series = Series(
        timestamps: timestamps,
        open: open,
        high: high,
        low: low,
        close: close,
        volume: volume,
      );

      final frame = ChartFrame(
        series: series,
        indicators: {},
        viewport: Viewport(startIdx: 0, endIdx: 19, scrollX: 0, scale: 1.0),
        overlays: [],
        sequenceNumber: 1,
        panelSequenceNumbers: {'main': 1},
      );

      controller = KChartController(frame: frame);
    });

    testWidgets('VolumeProfilePanel renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => KChartScope(
                chartKey: GlobalKey(),
                theme: ChartTheme.dark(),
                formatters: ChartNumberFormatters('en_US'),
                child: SizedBox(
                  width: 400,
                  height: 300,
                  child:
                      VolumeProfilePanel(controller: controller).build(context),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(CustomPaint).first,
        matchesGoldenFile('goldens/volume_profile_panel.png'),
      );
    });
  });
}
