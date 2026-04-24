import 'dart:math' as math;
import 'institutional_models.dart';
import 'series.dart';

/// Extension to calculate [VolumeProfile] from a [Series].
extension VolumeProfileCalculator on Series {
  /// Calculates the volume profile for a given range of indices.
  ///
  /// [startIdx] and [endIdx] define the visible range.
  /// [binCount] specifies how many price levels to aggregate.
  VolumeProfile calculateVolumeProfile({
    required int startIdx,
    required int endIdx,
    int binCount = 24,
  }) {
    if (length == 0 || startIdx > endIdx) {
      return const VolumeProfile(bins: [], pocPrice: 0, maxVolume: 0);
    }

    final int actualStart = startIdx.clamp(0, length - 1);
    final int actualEnd = endIdx.clamp(0, length - 1);

    double minPrice = double.infinity;
    double maxPrice = double.negativeInfinity;

    for (int i = actualStart; i <= actualEnd; i++) {
      if (low[i] < minPrice) minPrice = low[i];
      if (high[i] > maxPrice) maxPrice = high[i];
    }

    if (minPrice == maxPrice) {
      minPrice -= 1.0;
      maxPrice += 1.0;
    }

    final double priceRange = maxPrice - minPrice;
    final double binSize = priceRange / binCount;

    final List<double> totalVolumes = List.filled(binCount, 0.0);
    final List<double> buyVolumes = List.filled(binCount, 0.0);
    final List<double> sellVolumes = List.filled(binCount, 0.0);

    for (int i = actualStart; i <= actualEnd; i++) {
      final double v = volume[i];
      final double c = close[i];
      final double o = open[i];
      final bool isBullish = c >= o;

      // For simplicity, we assign the entire candle volume to its close price bin.
      // A more advanced implementation could distribute volume across the high-low range.
      final int binIdx = ((c - minPrice) / binSize).floor().clamp(0, binCount - 1);

      totalVolumes[binIdx] += v;
      if (isBullish) {
        buyVolumes[binIdx] += v;
      } else {
        sellVolumes[binIdx] += v;
      }
    }

    double maxVol = 0;
    double pocPrice = minPrice;
    final List<VolumeProfileBin> bins = [];

    for (int i = 0; i < binCount; i++) {
      final double binPrice = minPrice + (i + 0.5) * binSize;
      final double vol = totalVolumes[i];

      if (vol > maxVol) {
        maxVol = vol;
        pocPrice = binPrice;
      }

      bins.add(VolumeProfileBin(
        price: binPrice,
        volume: vol,
        buyVolume: buyVolumes[i],
        sellVolume: sellVolumes[i],
      ));
    }

    return VolumeProfile(
      bins: bins,
      pocPrice: pocPrice,
      maxVolume: maxVol,
    );
  }
}
