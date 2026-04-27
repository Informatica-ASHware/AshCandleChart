import 'dart:typed_data';
import 'package:meta/meta.dart';
import 'annotation.dart';
import 'candle.dart';

/// Exception thrown when binary deserialization fails.
class SeriesDeserializationException implements Exception {
  /// Message describing the error.
  final String message;

  /// Creates a [SeriesDeserializationException].
  SeriesDeserializationException(this.message);

  @override
  String toString() => 'SeriesDeserializationException: $message';
}

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

  /// Whether the series is empty.
  bool get isEmpty => timestamps.isEmpty;

  /// Whether the series is not empty.
  bool get isNotEmpty => timestamps.isNotEmpty;

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

  /// Finds the nearest OHLC value to the given [targetTimestamp] and [targetPrice].
  ///
  /// Returns an [AnnotationPoint] with the snapped timestamp and price.
  /// Snapping prioritizes the closest candle in time, then the closest
  /// OHLC value (Open, High, Low, or Close) of that candle.
  AnnotationPoint findNearestPoint(int targetTimestamp, double targetPrice) {
    if (length == 0) {
      return AnnotationPoint(timestamp: targetTimestamp, price: targetPrice);
    }

    // 1. Find nearest timestamp using binary search.
    int left = 0;
    int right = length - 1;
    while (left <= right) {
      final int mid = left + ((right - left) >> 1);
      if (timestamps[mid] == targetTimestamp) {
        left = mid;
        break;
      }
      if (timestamps[mid] < targetTimestamp) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    // Check which one is closer: timestamps[left] or timestamps[left-1]
    int index;
    if (left >= length) {
      index = length - 1;
    } else if (left <= 0) {
      index = 0;
    } else {
      final diff1 = (timestamps[left] - targetTimestamp).abs();
      final diff2 = (timestamps[left - 1] - targetTimestamp).abs();
      index = diff1 < diff2 ? left : left - 1;
    }

    final candleTimestamp = timestamps[index];
    final prices = [
      open[index],
      high[index],
      low[index],
      close[index],
    ];

    // 2. Find nearest price among OHLC.
    double nearestPrice = prices[0];
    double minPriceDiff = (prices[0] - targetPrice).abs();

    for (int i = 1; i < prices.length; i++) {
      final diff = (prices[i] - targetPrice).abs();
      if (diff < minPriceDiff) {
        minPriceDiff = diff;
        nearestPrice = prices[i];
      }
    }

    return AnnotationPoint(timestamp: candleTimestamp, price: nearestPrice);
  }

  /// Returns a new [Series] containing a sub-range of the data.
  ///
  /// The [start] and [end] indices follow [List.sublist] semantics:
  /// [start] is inclusive, [end] is exclusive.
  Series slice(int start, int end) {
    return Series(
      timestamps: timestamps.sublist(start, end),
      open: open.sublist(start, end),
      high: high.sublist(start, end),
      low: low.sublist(start, end),
      close: close.sublist(start, end),
      volume: volume.sublist(start, end),
    );
  }

  /// Serializes the [Series] to a binary format (Uint8List).
  ///
  /// Format:
  /// - int32: length (N)
  /// - N * int64: timestamps
  /// - N * float64: open
  /// - N * float64: high
  /// - N * float64: low
  /// - N * float64: close
  /// - N * float64: volume
  Uint8List toBinary() {
    final n = length;
    final totalBytes = 4 + // length
        n * 8 + // timestamps (int64)
        n * 8 * 5; // OHLCV (float64)

    final bytes = Uint8List(totalBytes);
    final bd = ByteData.view(bytes.buffer);

    int offset = 0;
    bd.setInt32(offset, n);
    offset += 4;

    for (int i = 0; i < n; i++) {
      bd.setInt64(offset, timestamps[i]);
      offset += 8;
    }
    for (int i = 0; i < n; i++) {
      bd.setFloat64(offset, open[i]);
      offset += 8;
    }
    for (int i = 0; i < n; i++) {
      bd.setFloat64(offset, high[i]);
      offset += 8;
    }
    for (int i = 0; i < n; i++) {
      bd.setFloat64(offset, low[i]);
      offset += 8;
    }
    for (int i = 0; i < n; i++) {
      bd.setFloat64(offset, close[i]);
      offset += 8;
    }
    for (int i = 0; i < n; i++) {
      bd.setFloat64(offset, volume[i]);
      offset += 8;
    }

    return bytes;
  }

  /// Reconstructs a [Series] from a binary format.
  ///
  /// Throws [SeriesDeserializationException] if the input is malformed.
  factory Series.fromBinary(Uint8List bytes) {
    if (bytes.length < 4) {
      throw SeriesDeserializationException(
          'Input too short: expected at least 4 bytes for length, got ${bytes.length}');
    }

    final bd = ByteData.view(bytes.buffer, bytes.offsetInBytes, bytes.length);
    final n = bd.getInt32(0);

    if (n < 0) {
      throw SeriesDeserializationException('Invalid series length: $n');
    }

    final expectedBytes = 4 + n * 8 * 6;
    if (bytes.length < expectedBytes) {
      throw SeriesDeserializationException(
          'Input too short for $n elements: expected $expectedBytes bytes, got ${bytes.length}');
    }

    int offset = 4;
    final timestamps = Int64List(n);
    for (int i = 0; i < n; i++) {
      timestamps[i] = bd.getInt64(offset);
      offset += 8;
    }

    final open = Float64List(n);
    for (int i = 0; i < n; i++) {
      open[i] = bd.getFloat64(offset);
      offset += 8;
    }

    final high = Float64List(n);
    for (int i = 0; i < n; i++) {
      high[i] = bd.getFloat64(offset);
      offset += 8;
    }

    final low = Float64List(n);
    for (int i = 0; i < n; i++) {
      low[i] = bd.getFloat64(offset);
      offset += 8;
    }

    final close = Float64List(n);
    for (int i = 0; i < n; i++) {
      close[i] = bd.getFloat64(offset);
      offset += 8;
    }

    final volume = Float64List(n);
    for (int i = 0; i < n; i++) {
      volume[i] = bd.getFloat64(offset);
      offset += 8;
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
