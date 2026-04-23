import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:kchart_core/src/indicators/bollinger_bands.dart';
import 'package:kchart_core/src/series/series.dart';

void main() {
  group('BollingerBandsIndicator', () {
    final close =
        Float64List.fromList([10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]);
    final series = Series(
      timestamps: Int64List(11),
      open: Float64List(11),
      high: Float64List(11),
      low: Float64List(11),
      close: close,
      volume: Float64List(11),
    );

    test('computes Bollinger Bands correctly', () {
      final config = BollingerBandsConfig(id: 'bb', period: 5, stdDev: 2.0);
      final indicator = BollingerBandsIndicator(config);
      final results = indicator.compute(series, {});

      expect(results.middle.length, 11);
      expect(results.upper.length, 11);
      expect(results.lower.length, 11);

      // At index 4 (5th element): [10, 11, 12, 13, 14]
      // SMA = 12
      // Variances: (10-12)^2=4, (11-12)^2=1, (12-12)^2=0, (13-12)^2=1, (14-12)^2=4
      // Sum = 10. Avg = 10/5 = 2. SD = sqrt(2) = 1.4142135624
      // Upper = 12 + 2 * 1.4142... = 14.8284...
      // Lower = 12 - 2 * 1.4142... = 9.1715...

      expect(results.middle[4], closeTo(12.0, 1e-10));
      expect(results.upper[4], closeTo(12.0 + 2 * 1.4142135624, 1e-10));
      expect(results.lower[4], closeTo(12.0 - 2 * 1.4142135624, 1e-10));
    });

    test('computeAppend matches compute', () {
      final config = BollingerBandsConfig(id: 'bb', period: 5);
      final indicator = BollingerBandsIndicator(config);

      final seriesPart = Series(
        timestamps: Int64List(10),
        open: Float64List(10),
        high: Float64List(10),
        low: Float64List(10),
        close: Float64List.fromList([10, 11, 12, 13, 14, 15, 16, 17, 18, 19]),
        volume: Float64List(10),
      );

      final resultsPart = indicator.compute(seriesPart, {});
      final resultsAppend = indicator.computeAppend(series, {}, resultsPart);

      final resultsFull = indicator.compute(series, {});

      for (int i = 0; i < 11; i++) {
        if (resultsFull.middle[i].isNaN) {
          expect(resultsAppend.middle[i], isNaN);
        } else {
          expect(
              resultsAppend.middle[i], closeTo(resultsFull.middle[i], 1e-10));
        }

        if (resultsFull.upper[i].isNaN) {
          expect(resultsAppend.upper[i], isNaN);
        } else {
          expect(resultsAppend.upper[i], closeTo(resultsFull.upper[i], 1e-10));
        }

        if (resultsFull.lower[i].isNaN) {
          expect(resultsAppend.lower[i], isNaN);
        } else {
          expect(resultsAppend.lower[i], closeTo(resultsFull.lower[i], 1e-10));
        }
      }
    });
  });
}
