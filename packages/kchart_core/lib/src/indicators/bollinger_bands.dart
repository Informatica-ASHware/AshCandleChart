import 'dart:math' as math;
import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../series/series.dart';
import 'indicator.dart';
import 'sma.dart';

part 'bollinger_bands.freezed.dart';

/// Configuration for the Bollinger Bands indicator.
@freezed
class BollingerBandsConfig
    with _$BollingerBandsConfig
    implements IndicatorConfig {
  /// Creates a [BollingerBandsConfig].
  const factory BollingerBandsConfig({
    required String id,
    @Default(20) int period,
    @Default(2.0) double stdDev,
    @Default([]) List<String> dependsOn,
  }) = _BollingerBandsConfig;
}

/// Result of the Bollinger Bands calculation.
class BollingerBandsResult {
  /// Middle band (usually an SMA).
  final Float64List middle;

  /// Upper band.
  final Float64List upper;

  /// Lower band.
  final Float64List lower;

  /// Creates a [BollingerBandsResult].
  BollingerBandsResult({
    required this.middle,
    required this.upper,
    required this.lower,
  });

  /// Length of the series.
  int get length => middle.length;
}

/// Implementation of the Bollinger Bands indicator.
class BollingerBandsIndicator extends Indicator<BollingerBandsConfig> {
  /// Creates a [BollingerBandsIndicator] with the given [config].
  BollingerBandsIndicator(super.config);

  @override
  BollingerBandsResult compute(Series input, Map<String, Object> dependencies) {
    final data = input.close;
    final n = data.length;
    final period = config.period;

    final middle = SMAIndicator(
      SMAConfig(id: 'sma', period: period),
    ).compute(input, {});
    final upper = Float64List(n);
    final lower = Float64List(n);

    for (int i = 0; i < n; i++) {
      if (i < period - 1) {
        upper[i] = double.nan;
        lower[i] = double.nan;
        continue;
      }

      double sumSqDiff = 0;
      final m = middle[i];
      for (int j = i - period + 1; j <= i; j++) {
        final diff = data[j] - m;
        sumSqDiff += diff * diff;
      }
      final sd = math.sqrt(sumSqDiff / period);
      upper[i] = m + config.stdDev * sd;
      lower[i] = m - config.stdDev * sd;
    }

    return BollingerBandsResult(middle: middle, upper: upper, lower: lower);
  }

  @override
  BollingerBandsResult computeAppend(
    Series input,
    Map<String, Object> dependencies,
    Object previousResults,
  ) {
    final data = input.close;
    final n = data.length;
    final period = config.period;
    final prev = previousResults as BollingerBandsResult;

    if (n <= prev.length) return prev;

    final middleFull = SMAIndicator(
      SMAConfig(id: 'sma', period: period),
    ).computeAppend(input, {}, prev.middle);
    final newMiddle = middleFull[n - 1];

    final upperList = Float64List(n);
    upperList.setRange(0, prev.upper.length, prev.upper);

    final lowerList = Float64List(n);
    lowerList.setRange(0, prev.lower.length, prev.lower);

    if (n < period) {
      upperList[n - 1] = double.nan;
      lowerList[n - 1] = double.nan;
    } else {
      double sumSqDiff = 0;
      for (int j = n - period; j < n; j++) {
        final diff = data[j] - newMiddle;
        sumSqDiff += diff * diff;
      }
      final sd = math.sqrt(sumSqDiff / period);
      upperList[n - 1] = newMiddle + config.stdDev * sd;
      lowerList[n - 1] = newMiddle - config.stdDev * sd;
    }

    return BollingerBandsResult(
      middle: middleFull,
      upper: upperList,
      lower: lowerList,
    );
  }
}
