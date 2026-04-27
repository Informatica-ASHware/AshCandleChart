import 'dart:typed_data';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/src/controller.dart';
import 'package:kchart_flutter/src/panels/ohlcv_overlay.dart';
import 'package:kchart_flutter/src/theme.dart';
import 'package:kchart_flutter/src/i18n/number_formatters.dart';
import 'package:kchart_flutter/src/widgets/kchart_scope.dart';

void main() {
  late KChartController controller;
  late ChartFrame frame;

  setUp(() {
    final series = Series(
      timestamps: Int64List.fromList([1000, 2000, 3000]),
      open: Float64List.fromList([10.0, 20.0, 30.0]),
      high: Float64List.fromList([15.0, 25.0, 35.0]),
      low: Float64List.fromList([5.0, 15.0, 25.0]),
      close: Float64List.fromList([12.0, 18.0, 32.0]),
      volume: Float64List.fromList([100.0, 200.0, 300.0]),
    );

    frame = ChartFrame(
      series: series,
      indicators: {},
      viewport: const Viewport(startIdx: 0, endIdx: 2, scale: 1.0, scrollX: 0.0),
      overlays: [],
      sequenceNumber: 1,
      panelSequenceNumbers: {'main': 1},
    );

    controller = KChartController(frame: frame);
  });

  Widget buildTestWidget(KChartController controller) {
    return WidgetsApp(
      color: Colors.blue,
      builder: (context, _) => KChartScope(
        chartKey: GlobalKey(),
        theme: ChartTheme.dark(),
        formatters: ChartNumberFormatters('en_US'),
        child: OhlcvOverlay(controller: controller),
      ),
    );
  }

  testWidgets('OhlcvOverlay displays last candle data when crosshair is inactive',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(controller));

    // Last candle is at index 2: O:30, H:35, L:25, C:32, Vol:300
    expect(find.text('30'), findsOneWidget);
    expect(find.text('35'), findsOneWidget);
    expect(find.text('25'), findsOneWidget);
    expect(find.text('32'), findsOneWidget);
    expect(find.text('300'), findsOneWidget);
  });

  testWidgets('OhlcvOverlay displays crosshair candle data when active',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(controller));

    // Activate crosshair at timestamp 2000 (index 1)
    controller.crosshair.update(const CrosshairState(timestamp: 2000));
    await tester.pump();

    // Candle at index 1: O:20, H:25, L:15, C:18, Vol:200
    expect(find.text('20'), findsOneWidget);
    expect(find.text('25'), findsOneWidget);
    expect(find.text('15'), findsOneWidget);
    expect(find.text('18'), findsOneWidget);
    expect(find.text('200'), findsOneWidget);
  });

  testWidgets('OhlcvOverlay uses correct colors for bullish and bearish candles',
      (WidgetTester tester) async {
    final theme = ChartTheme.dark();
    await tester.pumpWidget(buildTestWidget(controller));

    // Last candle (index 2) is bullish (32 > 30)
    final closeText = find.text('32');
    Text textWidget = tester.widget(closeText);
    expect(textWidget.style?.color, theme.bullColor);

    // Switch to index 1 which is bearish (18 < 20)
    controller.crosshair.update(const CrosshairState(timestamp: 2000));
    await tester.pump();

    final closeTextBearish = find.text('18');
    textWidget = tester.widget(closeTextBearish);
    expect(textWidget.style?.color, theme.bearColor);
  });
}
