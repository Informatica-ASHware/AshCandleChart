import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/src/painting/main_panel_painter.dart';
import 'package:kchart_flutter/src/painting/paint_pool.dart';
import 'package:kchart_flutter/src/painting/layer_cache.dart';
import 'package:kchart_flutter/src/theme.dart';

void main() {
  group('MainPanelPainter Y-axis Logic', () {
    late MainPanelPainter painter;

    setUp(() {
      final frame = ChartFrame(
        series: Series(
          timestamps: Int64List.fromList([1000, 2000]),
          open: Float64List.fromList([100, 110]),
          high: Float64List.fromList([120, 130]),
          low: Float64List.fromList([90, 100]),
          close: Float64List.fromList([110, 120]),
          volume: Float64List.fromList([1000, 2000]),
        ),
        indicators: {},
        viewport: const Viewport(startIdx: 0, endIdx: 1, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 0,
        panelSequenceNumbers: const {'main': 0},
      );

      painter = MainPanelPainter(
        frame: frame,
        paintPool: PaintPool(),
        gridCache: LayerCache(),
        candleCache: LayerCache(),
        yAxisCache: LayerCache(),
        theme: ChartTheme.light(),
      );
    });

    test('calculateVisiblePriceRange returns correct range', () {
      final range = painter.calculateVisiblePriceRange();
      expect(range.$1, 90.0);
      expect(range.$2, 130.0);
    });

    test('calculatePriceTicks returns "nice" steps', () {
      final ticks = painter.calculatePriceTicks(90.0, 130.0, 5);
      // Range is 40. maxTicks 5. Step might be 10.
      expect(ticks, containsAllInOrder([90.0, 100.0, 110.0, 120.0, 130.0]));
    });

    test('calculatePriceTicks handles small range', () {
      final ticks = painter.calculatePriceTicks(100.0, 101.0, 5);
      expect(ticks.length, greaterThanOrEqualTo(2));
      for (int i = 0; i < ticks.length - 1; i++) {
        expect(ticks[i+1], greaterThan(ticks[i]));
      }
    });

    test('calculatePriceTicks handles large range', () {
      final ticks = painter.calculatePriceTicks(1000.0, 5000.0, 5);
      expect(ticks, containsAllInOrder([1000.0, 2000.0, 3000.0, 4000.0, 5000.0]));
    });
  });
}
