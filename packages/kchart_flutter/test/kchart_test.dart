import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:flutter/material.dart' hide Viewport;
import 'package:kchart_flutter/src/painting/layer_cache.dart';
import 'package:kchart_flutter/src/painting/paint_pool.dart';

void main() {
  group('KChartController', () {
    test('initializes with frame', () {
      final frame = ChartFrame(
        series: Series(
          timestamps: Int64List(0),
          open: Float64List(0),
          high: Float64List(0),
          low: Float64List(0),
          close: Float64List(0),
          volume: Float64List(0),
        ),
        indicators: {},
        viewport: const Viewport(startIdx: 0, endIdx: 0, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 0,
      );
      final controller = KChartController(frame: frame);
      expect(controller.frame, frame);
    });

    test('updates frame and notifies listeners', () {
      final frame1 = ChartFrame(
        series: Series(
          timestamps: Int64List(0),
          open: Float64List(0),
          high: Float64List(0),
          low: Float64List(0),
          close: Float64List(0),
          volume: Float64List(0),
        ),
        indicators: {},
        viewport: const Viewport(startIdx: 0, endIdx: 0, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 0,
      );
      final frame2 = frame1.copyWith(sequenceNumber: 1);
      final controller = KChartController(frame: frame1);

      bool notified = false;
      controller.addListener(() => notified = true);

      controller.frame = frame2;
      expect(controller.frame, frame2);
      expect(notified, isTrue);
    });
  });

  group('MainPanelPainter', () {
    test('findIndexAtTimestamp performs binary search correctly', () {
      final timestamps = Int64List.fromList([100, 200, 300, 400, 500]);

      expect(MainPanelPainter.findIndexAtTimestamp(timestamps, 300), 2);
      expect(MainPanelPainter.findIndexAtTimestamp(timestamps, 100), 0);
      expect(MainPanelPainter.findIndexAtTimestamp(timestamps, 500), 4);
      expect(MainPanelPainter.findIndexAtTimestamp(timestamps, 250), 2); // Insertion point
      expect(MainPanelPainter.findIndexAtTimestamp(timestamps, 50), 0);
      expect(MainPanelPainter.findIndexAtTimestamp(timestamps, 600), 5);
    });

    test('shouldRepaint returns true when sequenceNumber changes', () {
      final frame1 = ChartFrame(
        series: Series(
          timestamps: Int64List(0),
          open: Float64List(0),
          high: Float64List(0),
          low: Float64List(0),
          close: Float64List(0),
          volume: Float64List(0),
        ),
        indicators: {},
        viewport: const Viewport(startIdx: 0, endIdx: 0, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 0,
      );
      final frame2 = frame1.copyWith(sequenceNumber: 1);

      final paintPool = PaintPool();
      final gridCache = LayerCache();
      final candleCache = LayerCache();

      final painter1 = MainPanelPainter(
        frame: frame1,
        paintPool: paintPool,
        gridCache: gridCache,
        candleCache: candleCache,
      );
      final painter2 = MainPanelPainter(
        frame: frame2,
        paintPool: paintPool,
        gridCache: gridCache,
        candleCache: candleCache,
      );

      expect(painter2.shouldRepaint(painter1), isTrue);
      expect(painter1.shouldRepaint(painter1), isFalse);
    });
  });

  group('KChart Widget', () {
    testWidgets('renders without error', (WidgetTester tester) async {
      final frame = ChartFrame(
        series: Series(
          timestamps: Int64List.fromList([1000, 2000]),
          open: Float64List.fromList([10.0, 12.0]),
          high: Float64List.fromList([15.0, 16.0]),
          low: Float64List.fromList([8.0, 11.0]),
          close: Float64List.fromList([12.0, 11.0]),
          volume: Float64List.fromList([100.0, 150.0]),
        ),
        indicators: {},
        viewport: const Viewport(startIdx: 0, endIdx: 1, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 0,
      );
      final controller = KChartController(frame: frame);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 600,
              child: KChart(controller: controller),
            ),
          ),
        ),
      );

      expect(find.byType(KChart), findsOneWidget);
      expect(find.byType(CustomPaint), findsAtLeastNWidgets(1));
    });

    testWidgets('Golden Test - 100k candles rendering performance mock', (WidgetTester tester) async {
      final int n = 100000;
      final timestamps = Int64List(n);
      final open = Float64List(n);
      final high = Float64List(n);
      final low = Float64List(n);
      final close = Float64List(n);
      final volume = Float64List(n);

      for (int i = 0; i < n; i++) {
        timestamps[i] = i * 1000;
        open[i] = 100.0 + i % 10;
        high[i] = open[i] + 5;
        low[i] = open[i] - 5;
        close[i] = open[i] + (i % 2 == 0 ? 2 : -2);
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
        viewport: const Viewport(startIdx: 50000, endIdx: 50100, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 0,
      );
      final controller = KChartController(frame: frame);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 800,
              height: 600,
              child: KChart(controller: controller),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(KChart),
        matchesGoldenFile('goldens/kchart_100k_candles.png'),
      );
    });
  });
}
