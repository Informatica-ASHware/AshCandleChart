import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../series/series.dart';
import 'indicator.dart';

part 'ema.freezed.dart';

/// Configuration for the Exponential Moving Average (EMA) indicator.
@freezed
class EMAConfig with _$EMAConfig implements IndicatorConfig {
  /// Creates an [EMAConfig].
  const factory EMAConfig({
    required String id,
    @Default(20) int period,
    @Default([]) List<String> dependsOn,
  }) = _EMAConfig;
}

/// Implementation of the Exponential Moving Average (EMA) indicator.
class EMAIndicator extends Indicator<EMAConfig> {
  /// Creates an [EMAIndicator] with the given [config].
  EMAIndicator(super.config);

  @override
  Float64List compute(Series input, Map<String, Object> dependencies) {
    final data = input.close;
    final n = data.length;
    final period = config.period;
    final results = Float64List(n);

    if (n < period) {
      results.fillRange(0, n, double.nan);
      return results;
    }

    final double alpha = 2.0 / (period + 1);

    // Initial EMA is SMA
    double sum = 0;
    for (int i = 0; i < period; i++) {
      sum += data[i];
    }
    results.fillRange(0, period - 1, double.nan);
    double ema = sum / period;
    results[period - 1] = ema;

    for (int i = period; i < n; i++) {
      ema = (data[i] - ema) * alpha + ema;
      results[i] = ema;
    }

    return results;
  }

  @override
  Float64List computeAppend(Series input, Map<String, Object> dependencies, Object previousResults) {
    final data = input.close;
    final n = data.length;
    final period = config.period;
    final prev = previousResults as Float64List;

    if (n <= prev.length) return prev;

    final results = Float64List(n);
    results.setRange(0, prev.length, prev);

    if (n < period) {
      results[n - 1] = double.nan;
    } else if (n == period) {
      double sum = 0;
      for (int i = 0; i < period; i++) {
        sum += data[i];
      }
      results[n - 1] = sum / period;
    } else {
      final double alpha = 2.0 / (period + 1);
      final prevEma = prev[n - 2];
      if (prevEma.isNaN) {
        // Recalculate if previous was NaN (e.g. just reached period)
        return compute(input, dependencies);
      }
      results[n - 1] = (data[n - 1] - prevEma) * alpha + prevEma;
    }

    return results;
  }
}
