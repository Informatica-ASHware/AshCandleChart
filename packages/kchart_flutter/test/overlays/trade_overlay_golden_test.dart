import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:flutter/material.dart' hide Viewport;

void main() {
  testWidgets('Trade Overlays Golden Test', (WidgetTester tester) async {
    final int n = 100;
    final timestamps = Int64List(n);
    final open = Float64List(n);
    final high = Float64List(n);
    final low = Float64List(n);
    final close = Float64List(n);
    final volume = Float64List(n);

    for (int i = 0; i < n; i++) {
      timestamps[i] = i * 1000;
      // Varied data to make it look like a real chart
      open[i] = 100.0 + i;
      high[i] = open[i] + 10.0;
      low[i] = open[i] - 10.0;
      close[i] = open[i] + (i % 2 == 0 ? 5.0 : -5.0);
      volume[i] = 100.0;
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
      viewport: const Viewport(startIdx: 0, endIdx: 49, scale: 1.0, scrollX: 0.0),
      tradeOverlays: TradeOverlayDocument(
        overlays: [
          TradeOverlay.marker(
            id: 'm1',
            point: const AnnotationPoint(timestamp: 10000, price: 110.0),
            color: 0xFF4CAF50,
            label: 'Buy',
          ),
          TradeOverlay.marker(
            id: 'm2',
            point: const AnnotationPoint(timestamp: 30000, price: 130.0),
            color: 0xFFE91E63,
            label: 'Sell',
          ),
          TradeOverlay.position(
            id: 'p1',
            entryPrice: 125.0,
            takeProfit: 145.0,
            stopLoss: 110.0,
          ),
        ],
      ),
      overlays: [],
      sequenceNumber: 0,
      panelSequenceNumbers: const {'main': 0},
    );
    final controller = KChartController(frame: frame);

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(),
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
      matchesGoldenFile('../goldens/trade_overlays.png'),
    );

    // Pan to see more
    controller.pan(-200, 800);
    await tester.pump();

    await expectLater(
      find.byType(KChart),
      matchesGoldenFile('../goldens/trade_overlays_panned.png'),
    );

    // Zoom in and verify anchoring
    controller.zoom(2.0, 400.0, 800.0);
    await tester.pump();

    await expectLater(
      find.byType(KChart),
      matchesGoldenFile('../goldens/trade_overlays_zoomed.png'),
    );
  });
}
