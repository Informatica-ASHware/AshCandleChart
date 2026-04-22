import 'package:freezed_annotation/freezed_annotation.dart';

part 'candle.freezed.dart';

/// Represents a single OHLCV candle in a financial chart.
///
/// This model is used primarily for data input. For performance-critical
/// operations, use [Series] which stores data in a columnar format to
/// optimize CPU cache usage.
@freezed
class Candle with _$Candle {
  /// Creates a [Candle] with the given parameters.
  const factory Candle({
    /// Unix timestamp in milliseconds.
    required int timestamp,

    /// Opening price.
    required double open,

    /// Highest price reached during the interval.
    required double high,

    /// Lowest price reached during the interval.
    required double low,

    /// Closing price.
    required double close,

    /// Volume traded during the interval.
    required double volume,
  }) = _Candle;
}
