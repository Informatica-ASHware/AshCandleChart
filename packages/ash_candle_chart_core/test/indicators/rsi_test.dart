import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:ash_candle_chart_core/src/indicators/rsi.dart';
import 'package:ash_candle_chart_core/src/series/series.dart';

void main() {
  group('RSIIndicator', () {
    // Need enough data for RSI (default 14)
    final close =
        Float64List.fromList(List.generate(30, (i) => i.toDouble() + 1));
    final series = Series(
      timestamps: Int64List(30),
      open: Float64List(30),
      high: Float64List(30),
      low: Float64List(30),
      close: close,
      volume: Float64List(30),
    );

    test('computes RSI correctly', () {
      final config = RSIConfig(id: 'rsi', period: 14);
      final indicator = RSIIndicator(config);
      final results = indicator.compute(series, {});

      expect(results.length, 30);

      // Since it's always increasing, RSI should be 100 or close to 100
      for (int i = 15; i < 30; i++) {
        expect(results[i], closeTo(100.0, 1e-10));
      }
    });

    test('computeAppend matches compute', () {
      final config = RSIConfig(id: 'rsi', period: 14);
      final indicator = RSIIndicator(config);

      final seriesPart = Series(
        timestamps: Int64List(29),
        open: Float64List(29),
        high: Float64List(29),
        low: Float64List(29),
        close: Float64List.fromList(List.generate(29, (i) => i.toDouble() + 1)),
        volume: Float64List(29),
      );

      final resultsPart = indicator.compute(seriesPart, {});
      final resultsAppend = indicator.computeAppend(series, {}, resultsPart);

      final resultsFull = indicator.compute(series, {});

      for (int i = 0; i < 30; i++) {
        if (resultsFull[i].isNaN) {
          expect(resultsAppend[i], isNaN);
        } else {
          expect(resultsAppend[i], closeTo(resultsFull[i], 1e-10));
        }
      }
    });
  });
}
