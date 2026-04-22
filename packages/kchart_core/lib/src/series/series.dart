import 'dart:typed_data';
import 'package:meta/meta.dart';
import 'candle.dart';

/// An immutable columnar storage for financial series data.
///
/// [Series] stores data using [Float64List] and [Int64List] to ensure
/// contiguous memory allocation. This structure is significantly more
/// performant than a [List] of objects because:
/// 1. It reduces memory overhead by avoiding object wrappers for each data point.
/// 2. It improves CPU cache hit rates (Spatial Locality) when iterating over
///    a single attribute (e.g., all closing prices).
@immutable
class Series {
  /// Unix timestamps in milliseconds.
  final Int64List timestamps;

  /// Opening prices.
  final Float64List open;

  /// High prices.
  final Float64List high;

  /// Low prices.
  final Float64List low;

  /// Closing prices.
  final Float64List close;

  /// Volumes.
  final Float64List volume;

  /// Creates a [Series] with the provided typed lists.
  ///
  /// All lists must have the same length.
  Series({
    required this.timestamps,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  }) : assert(
          timestamps.length == open.length &&
              open.length == high.length &&
              high.length == low.length &&
              low.length == close.length &&
              close.length == volume.length,
          'All lists in a Series must have the same length',
        );

  /// Number of data points in the series.
  int get length => timestamps.length;

  /// Creates a copy of this [Series] but with the given fields replaced
  /// with the new values.
  Series copyWith({
    Int64List? timestamps,
    Float64List? open,
    Float64List? high,
    Float64List? low,
    Float64List? close,
    Float64List? volume,
  }) {
    return Series(
      timestamps: timestamps ?? this.timestamps,
      open: open ?? this.open,
      high: high ?? this.high,
      low: low ?? this.low,
      close: close ?? this.close,
      volume: volume ?? this.volume,
    );
  }

  /// Factory that converts a list of [Candle] objects into a columnar [Series].
  ///
  /// This conversion is O(N) where N is the number of candles.
  factory Series.fromCandles(List<Candle> candles) {
    final n = candles.length;
    final timestamps = Int64List(n);
    final open = Float64List(n);
    final high = Float64List(n);
    final low = Float64List(n);
    final close = Float64List(n);
    final volume = Float64List(n);

    for (var i = 0; i < n; i++) {
      final candle = candles[i];
      timestamps[i] = candle.timestamp;
      open[i] = candle.open;
      high[i] = candle.high;
      low[i] = candle.low;
      close[i] = candle.close;
      volume[i] = candle.volume;
    }

    return Series(
      timestamps: timestamps,
      open: open,
      high: high,
      low: low,
      close: close,
      volume: volume,
    );
  }
}
