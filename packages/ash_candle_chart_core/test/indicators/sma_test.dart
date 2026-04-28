import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:ash_candle_chart_core/src/indicators/sma.dart';
import 'package:ash_candle_chart_core/src/series/series.dart';

void main() {
  group('SMAIndicator', () {
    final close = Float64List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    final timestamps = Int64List(10);
    final empty = Float64List(10);
    final series = Series(
      timestamps: timestamps,
      open: empty,
      high: empty,
      low: empty,
      close: close,
      volume: empty,
    );

    test('computes SMA correctly', () {
      final config = SMAConfig(id: 'sma', period: 3);
      final indicator = SMAIndicator(config);
      final results = indicator.compute(series, {});

      expect(results.length, 10);
      expect(results[0], isNaN);
      expect(results[1], isNaN);
      expect(results[2], closeTo(2.0, 1e-10)); // (1+2+3)/3
      expect(results[3], closeTo(3.0, 1e-10)); // (2+3+4)/3
      expect(results[9], closeTo(9.0, 1e-10)); // (8+9+10)/3
    });

    test('computeAppend matches compute', () {
      final config = SMAConfig(id: 'sma', period: 3);
      final indicator = SMAIndicator(config);

      final seriesPart = Series(
        timestamps: Int64List(9),
        open: Float64List(9),
        high: Float64List(9),
        low: Float64List(9),
        close: Float64List.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9]),
        volume: Float64List(9),
      );

      final resultsPart = indicator.compute(seriesPart, {});
      final resultsAppend = indicator.computeAppend(series, {}, resultsPart);

      final resultsFull = indicator.compute(series, {});

      for (int i = 0; i < 10; i++) {
        if (resultsFull[i].isNaN) {
          expect(resultsAppend[i], isNaN);
        } else {
          expect(resultsAppend[i], closeTo(resultsFull[i], 1e-10));
        }
      }
    });
  });
}
