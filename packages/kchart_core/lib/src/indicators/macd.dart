import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../series/series.dart';
import 'indicator.dart';
import 'ema.dart';

part 'macd.freezed.dart';

/// Configuration for the Moving Average Convergence Divergence (MACD) indicator.
@freezed
class MACDConfig with _$MACDConfig implements IndicatorConfig {
  /// Creates a [MACDConfig].
  const factory MACDConfig({
    required String id,
    @Default(12) int fastPeriod,
    @Default(26) int slowPeriod,
    @Default(9) int signalPeriod,
    @Default([]) List<String> dependsOn,
  }) = _MACDConfig;
}

/// Result of the MACD calculation.
class MACDResult {
  /// MACD line.
  final Float64List macd;

  /// Signal line.
  final Float64List signal;

  /// Histogram (MACD line - Signal line).
  final Float64List histogram;

  /// Creates a [MACDResult].
  MACDResult({
    required this.macd,
    required this.signal,
    required this.histogram,
  });

  /// Length of the series.
  int get length => macd.length;
}

/// Implementation of the Moving Average Convergence Divergence (MACD) indicator.
class MACDIndicator extends Indicator<MACDConfig> {
  /// Creates a [MACDIndicator] with the given [config].
  MACDIndicator(super.config);

  @override
  MACDResult compute(Series input, Map<String, Object> dependencies) {
    final n = input.length;

    // We compute internal EMAs to get the MACD line
    final fastEma =
        EMAIndicator(EMAConfig(id: 'fast', period: config.fastPeriod))
            .compute(input, {});
    final slowEma =
        EMAIndicator(EMAConfig(id: 'slow', period: config.slowPeriod))
            .compute(input, {});

    final macdLine = Float64List(n);
    for (int i = 0; i < n; i++) {
      macdLine[i] = fastEma[i] - slowEma[i];
    }

    // Signal line is an EMA of the MACD line
    // We need a dummy Series to use EMAIndicator.compute or just implement EMA here.
    final signalLine = _computeEma(macdLine, config.signalPeriod);

    final histogram = Float64List(n);
    for (int i = 0; i < n; i++) {
      histogram[i] = macdLine[i] - signalLine[i];
    }

    return MACDResult(macd: macdLine, signal: signalLine, histogram: histogram);
  }

  @override
  MACDResult computeAppend(
      Series input, Map<String, Object> dependencies, Object previousResults) {
    final n = input.length;
    final prev = previousResults as MACDResult;
    if (n <= prev.length) return prev;

    // Fast EMA
    final fastEmaFull =
        EMAIndicator(EMAConfig(id: 'fast', period: config.fastPeriod))
            .compute(input, {});
    final fastEma = fastEmaFull[n - 1];

    // Slow EMA
    final slowEmaFull =
        EMAIndicator(EMAConfig(id: 'slow', period: config.slowPeriod))
            .compute(input, {});
    final slowEma = slowEmaFull[n - 1];

    final newMacdLine = fastEma - slowEma;

    final macdList = Float64List(n);
    macdList.setRange(0, prev.macd.length, prev.macd);
    macdList[n - 1] = newMacdLine;

    // Signal EMA
    final double alpha = 2.0 / (config.signalPeriod + 1);
    final prevSignal = prev.signal[n - 2];

    double newSignal;
    if (prevSignal.isNaN) {
      // Recompute if not enough data yet
      final tempSignal = _computeEma(macdList, config.signalPeriod);
      newSignal = tempSignal[n - 1];
    } else {
      newSignal = (newMacdLine - prevSignal) * alpha + prevSignal;
    }

    final signalList = Float64List(n);
    signalList.setRange(0, prev.signal.length, prev.signal);
    signalList[n - 1] = newSignal;

    final histogramList = Float64List(n);
    histogramList.setRange(0, prev.histogram.length, prev.histogram);
    histogramList[n - 1] = newMacdLine - newSignal;

    return MACDResult(
        macd: macdList, signal: signalList, histogram: histogramList);
  }

  Float64List _computeEma(Float64List data, int period) {
    final n = data.length;
    final results = Float64List(n);

    // Find first non-NaN
    int firstValid = -1;
    for (int i = 0; i < n; i++) {
      if (!data[i].isNaN) {
        firstValid = i;
        break;
      }
    }

    if (firstValid == -1 || n - firstValid < period) {
      results.fillRange(0, n, double.nan);
      return results;
    }

    results.fillRange(0, firstValid + period - 1, double.nan);

    double sum = 0;
    for (int i = firstValid; i < firstValid + period; i++) {
      sum += data[i];
    }
    double ema = sum / period;
    results[firstValid + period - 1] = ema;

    final double alpha = 2.0 / (period + 1);
    for (int i = firstValid + period; i < n; i++) {
      ema = (data[i] - ema) * alpha + ema;
      results[i] = ema;
    }

    return results;
  }
}
