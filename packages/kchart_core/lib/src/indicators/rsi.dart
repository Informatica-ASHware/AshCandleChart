import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../series/series.dart';
import 'indicator.dart';

part 'rsi.freezed.dart';

/// Configuration for the Relative Strength Index (RSI) indicator.
@freezed
abstract class RSIConfig with _$RSIConfig implements IndicatorConfig {
  /// Creates an [RSIConfig].
  const factory RSIConfig({
    required String id,
    @Default(14) int period,
    @Default([]) List<String> dependsOn,
  }) = _RSIConfig;
}

/// Implementation of the Relative Strength Index (RSI) indicator.
class RSIIndicator extends Indicator<RSIConfig> {
  /// Creates an [RSIIndicator] with the given [config].
  RSIIndicator(super.config);

  @override
  Float64List compute(Series input, Map<String, Object> dependencies) {
    final data = input.close;
    final n = data.length;
    final period = config.period;
    final results = Float64List(n);

    if (n <= period) {
      results.fillRange(0, n, double.nan);
      return results;
    }

    results.fillRange(0, period, double.nan);

    double avgGain = 0;
    double avgLoss = 0;

    // Initial average
    for (int i = 1; i <= period; i++) {
      final diff = data[i] - data[i - 1];
      if (diff >= 0) {
        avgGain += diff;
      } else {
        avgLoss -= diff;
      }
    }

    avgGain /= period;
    avgLoss /= period;

    if (avgLoss == 0) {
      results[period] = 100;
    } else {
      final rs = avgGain / avgLoss;
      results[period] = 100 - (100 / (1 + rs));
    }

    // Wilder's smoothing
    for (int i = period + 1; i < n; i++) {
      final diff = data[i] - data[i - 1];
      double gain = 0;
      double loss = 0;
      if (diff >= 0) {
        gain = diff;
      } else {
        loss = -diff;
      }

      avgGain = (avgGain * (period - 1) + gain) / period;
      avgLoss = (avgLoss * (period - 1) + loss) / period;

      if (avgLoss == 0) {
        results[i] = 100;
      } else {
        final rs = avgGain / avgLoss;
        results[i] = 100 - (100 / (1 + rs));
      }
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

    if (n <= period) {
      results[n - 1] = double.nan;
    } else if (n == period + 1) {
      // First RSI value
      return compute(input, dependencies);
    } else {
      // We need avgGain and avgLoss from previous state.
      // Since we don't store them, we have to backtrack once or recompute.
      // To keep it simple and stateless for now (as per current Indicator API):
      // We can derive avgGain and avgLoss from previous RSI if we assume RS = avgGain / avgLoss.
      // But RSI = 100 - (100 / (1 + RS)) => RS = RSI / (100 - RSI)
      // This doesn't give us avgGain and avgLoss individually.
      // So we have to re-calculate Wilder's smoothing from the start or a bit back.
      // Let's re-calculate for simplicity, or we could extend the result type to include internal state.
      // TradingView/TA-Lib typically needs some "warm up" data.

      double curAvgGain = 0;
      double curAvgLoss = 0;

      // Re-calculate initial averages
      for (int i = 1; i <= period; i++) {
        final diff = data[i] - data[i - 1];
        if (diff >= 0) {
          curAvgGain += diff;
        } else {
          curAvgLoss -= diff;
        }
      }
      curAvgGain /= period;
      curAvgLoss /= period;

      // Iterate up to n-1
      for (int i = period + 1; i < n; i++) {
        final diff = data[i] - data[i - 1];
        double gain = 0;
        double loss = 0;
        if (diff >= 0) {
          gain = diff;
        } else {
          loss = -diff;
        }

        curAvgGain = (curAvgGain * (period - 1) + gain) / period;
        curAvgLoss = (curAvgLoss * (period - 1) + loss) / period;
      }

      if (curAvgLoss == 0) {
        results[n - 1] = 100;
      } else {
        final rs = curAvgGain / curAvgLoss;
        results[n - 1] = 100 - (100 / (1 + rs));
      }
    }

    return results;
  }
}
