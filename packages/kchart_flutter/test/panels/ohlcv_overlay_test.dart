import 'dart:typed_data';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:kchart_flutter/src/panels/ohlcv_overlay.dart';
import 'package:kchart_flutter/src/widgets/kchart_scope.dart';

void main() {
  group('OhlcvOverlay', () {
    late KChartController controller;
    late ChartFrame frame;

    setUp(() {
      final timestamps = Int64List.fromList([1000, 2000, 3000]);
      final open = Float64List.fromList([100, 110, 105]);
      final high = Float64List.fromList([110, 115, 110]);
      final low = Float64List.fromList([95, 105, 100]);
      final close = Float64List.fromList([105, 108, 107]);
      final volume = Float64List.fromList([1000, 1100, 1200]);

      final series = Series(
        timestamps: timestamps,
        open: open,
        high: high,
        low: low,
        close: close,
        volume: volume,
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

    Widget wrapWithScope(Widget child) {
      return MaterialApp(
        home: Scaffold(
          body: KChartScope(
            chartKey: GlobalKey(),
            theme: ChartTheme.light(),
            formatters: ChartNumberFormatters('en_US'),
            child: child,
          ),
        ),
      );
    }

    testWidgets('shows last candle by default when crosshair is inactive', (tester) async {
      await tester.pumpWidget(wrapWithScope(OhlcvOverlay(controller: controller)));

      expect(find.byType(RichText), findsNWidgets(5));
      expect(tester.widget<RichText>(find.byType(RichText).at(0)).text.toPlainText(), contains('O: 105'));
      expect(tester.widget<RichText>(find.byType(RichText).at(1)).text.toPlainText(), contains('H: 110'));
      expect(tester.widget<RichText>(find.byType(RichText).at(2)).text.toPlainText(), contains('L: 100'));
      expect(tester.widget<RichText>(find.byType(RichText).at(3)).text.toPlainText(), contains('C: 107'));
      expect(tester.widget<RichText>(find.byType(RichText).at(4)).text.toPlainText(), contains('Vol: 1.2K'));
    });

    testWidgets('shows candle under crosshair when crosshair is active', (tester) async {
      await tester.pumpWidget(wrapWithScope(OhlcvOverlay(controller: controller)));

      // Activate crosshair at timestamp 2000 (second candle)
      controller.crosshair.update(const CrosshairState(timestamp: 2000, dx: 100, dy: 100));
      await tester.pump();

      expect(find.byType(RichText), findsNWidgets(5));
      expect(tester.widget<RichText>(find.byType(RichText).at(0)).text.toPlainText(), contains('O: 110'));
      expect(tester.widget<RichText>(find.byType(RichText).at(1)).text.toPlainText(), contains('H: 115'));
      expect(tester.widget<RichText>(find.byType(RichText).at(2)).text.toPlainText(), contains('L: 105'));
      expect(tester.widget<RichText>(find.byType(RichText).at(3)).text.toPlainText(), contains('C: 108'));
      expect(tester.widget<RichText>(find.byType(RichText).at(4)).text.toPlainText(), contains('Vol: 1.1K'));
    });

    testWidgets('updates in real-time when crosshair moves', (tester) async {
      await tester.pumpWidget(wrapWithScope(OhlcvOverlay(controller: controller)));

      // Move to first candle
      controller.crosshair.update(const CrosshairState(timestamp: 1000, dx: 50, dy: 100));
      await tester.pump();
      expect(tester.widget<RichText>(find.byType(RichText).at(0)).text.toPlainText(), contains('O: 100'));

      // Move to third candle
      controller.crosshair.update(const CrosshairState(timestamp: 3000, dx: 150, dy: 100));
      await tester.pump();
      expect(tester.widget<RichText>(find.byType(RichText).at(0)).text.toPlainText(), contains('O: 105'));
    });

    testWidgets('handles empty series gracefully', (tester) async {
      final emptySeries = Series(
        timestamps: Int64List(0),
        open: Float64List(0),
        high: Float64List(0),
        low: Float64List(0),
        close: Float64List(0),
        volume: Float64List(0),
      );
      controller.frame = frame.copyWith(series: emptySeries);

      await tester.pumpWidget(wrapWithScope(OhlcvOverlay(controller: controller)));

      expect(find.byType(RichText), findsNothing);
    });
  });
}
