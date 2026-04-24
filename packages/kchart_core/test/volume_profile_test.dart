import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:kchart_core/kchart_core.dart';

void main() {
  group('VolumeProfileCalculator', () {
    late Series series;

    setUp(() {
      final n = 10;
      final timestamps = Int64List.fromList(List.generate(n, (i) => i * 1000));
      // Prices: 100, 101, 102, ..., 109
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
    });

    test('calculates volume profile correctly for full range', () {
      // price range: min 95 (low of index 0) to max 114 (high of index 9)
      // range = 19. 19 bins means bin size = 1.0
      final vp =
          series.calculateVolumeProfile(startIdx: 0, endIdx: 9, binCount: 19);

      expect(vp.bins.length, 19);
      // Each candle has volume 100. Close prices are 100 to 109.
      // So 10 bins should have 100 volume each, others 0.
      int binsWithVolume = vp.bins.where((b) => b.volume > 0).length;
      expect(binsWithVolume, 10);
      expect(vp.maxVolume, 100.0);
    });

    test('POC price is correctly identified', () {
      // Modify one candle to have more volume
      final volume = Float64List.fromList(series.volume);
      volume[5] = 500.0; // Price 105
      final series2 = series.copyWith(volume: volume);

      final vp =
          series2.calculateVolumeProfile(startIdx: 0, endIdx: 9, binCount: 19);

      expect(vp.maxVolume, 500.0);
      expect(vp.pocPrice, closeTo(105.5, 0.5));
    });

    test('handles empty series', () {
      final emptySeries = Series(
        timestamps: Int64List(0),
        open: Float64List(0),
        high: Float64List(0),
        low: Float64List(0),
        close: Float64List(0),
        volume: Float64List(0),
      );

      final vp = emptySeries.calculateVolumeProfile(startIdx: 0, endIdx: 0);
      expect(vp.bins, isEmpty);
      expect(vp.maxVolume, 0);
    });
  });
}
