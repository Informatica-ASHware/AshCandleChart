import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:kchart_core/src/indicators/macd.dart';
import 'package:kchart_core/src/series/series.dart';

void main() {
  group('MACDIndicator', () {
    // Need enough data for MACD (default 12, 26)
    final close =
        Float64List.fromList(List.generate(50, (i) => i.toDouble() + 1));
    final series = Series(
      timestamps: Int64List(50),
      open: Float64List(50),
      high: Float64List(50),
      low: Float64List(50),
      close: close,
      volume: Float64List(50),
    );

    test('computes MACD correctly', () {
      final config = MACDConfig(
          id: 'macd', fastPeriod: 12, slowPeriod: 26, signalPeriod: 9);
      final indicator = MACDIndicator(config);
      final results = indicator.compute(series, {});

      expect(results.macd.length, 50);
      expect(results.signal.length, 50);
      expect(results.histogram.length, 50);

      // MACD line should be fastEMA - slowEMA
      // Signal line should be EMA of MACD line
      // Histogram should be MACD - Signal

      for (int i = 0; i < 50; i++) {
        if (!results.macd[i].isNaN && !results.signal[i].isNaN) {
          expect(results.histogram[i],
              closeTo(results.macd[i] - results.signal[i], 1e-10));
        }
      }
    });

    test('computeAppend matches compute', () {
      final config = MACDConfig(id: 'macd');
      final indicator = MACDIndicator(config);

      final seriesPart = Series(
        timestamps: Int64List(49),
        open: Float64List(49),
        high: Float64List(49),
        low: Float64List(49),
        close: Float64List.fromList(List.generate(49, (i) => i.toDouble() + 1)),
        volume: Float64List(49),
      );

      final resultsPart = indicator.compute(seriesPart, {});
      final resultsAppend = indicator.computeAppend(series, {}, resultsPart);

      final resultsFull = indicator.compute(series, {});

      for (int i = 0; i < 50; i++) {
        if (resultsFull.macd[i].isNaN) {
          expect(resultsAppend.macd[i], isNaN);
        } else {
          expect(resultsAppend.macd[i], closeTo(resultsFull.macd[i], 1e-10));
        }

        if (resultsFull.signal[i].isNaN) {
          expect(resultsAppend.signal[i], isNaN);
        } else {
          expect(
              resultsAppend.signal[i], closeTo(resultsFull.signal[i], 1e-10));
        }

        if (resultsFull.histogram[i].isNaN) {
          expect(resultsAppend.histogram[i], isNaN);
        } else {
          expect(resultsAppend.histogram[i],
              closeTo(resultsFull.histogram[i], 1e-10));
        }
      }
    });
  });
}
