import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../series/series.dart';
import 'indicator.dart';

part 'sma.freezed.dart';

/// Configuration for the Simple Moving Average (SMA) indicator.
@freezed
class SMAConfig with _$SMAConfig implements IndicatorConfig {
  /// Creates an [SMAConfig].
  const factory SMAConfig({
    required String id,
    @Default(20) int period,
    @Default([]) List<String> dependsOn,
  }) = _SMAConfig;
}

/// Implementation of the Simple Moving Average (SMA) indicator.
class SMAIndicator extends Indicator<SMAConfig> {
  /// Creates an [SMAIndicator] with the given [config].
  SMAIndicator(super.config);

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

    double sum = 0;
    for (int i = 0; i < period; i++) {
      sum += data[i];
    }
    results.fillRange(0, period - 1, double.nan);
    results[period - 1] = sum / period;

    for (int i = period; i < n; i++) {
      sum += data[i] - data[i - period];
      results[i] = sum / period;
    }

    return results;
  }

  @override
  Float64List computeAppend(
      Series input, Map<String, Object> dependencies, Object previousResults) {
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
      // SMA_t = SMA_{t-1} + (Price_t - Price_{t-period}) / period
      final prevSma = prev[n - 2];
      if (prevSma.isNaN) {
        // This shouldn't happen if n > period, but for safety:
        double sum = 0;
        for (int i = n - period; i < n; i++) {
          sum += data[i];
        }
        results[n - 1] = sum / period;
      } else {
        results[n - 1] =
            prevSma + (data[n - 1] - data[n - 1 - period]) / period;
      }
    }

    return results;
  }
}
