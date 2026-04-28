import 'package:freezed_annotation/freezed_annotation.dart';

part 'viewport.freezed.dart';

/// Represents the visible range and state of the chart.
@freezed
abstract class Viewport with _$Viewport {
  const Viewport._();

  /// Creates a [Viewport] with the given parameters.
  const factory Viewport({
    /// Index of the first visible data point in the [Series].
    required int startIdx,

    /// Index of the last visible data point in the [Series].
    required int endIdx,

    /// Horizontal scale factor (zoom).
    required double scale,

    /// Horizontal scroll offset.
    required double scrollX,
  }) = _Viewport;

  /// Returns a new [Viewport] with indices clamped to [0, maxIndex]
  /// and ensuring [startIdx] <= [endIdx].
  ///
  /// If [maxIndex] is less than 0 (empty series), both indices are set to 0.
  Viewport normalize(int maxIndex) {
    if (maxIndex < 0) {
      return copyWith(startIdx: 0, endIdx: 0);
    }
    final clampedStart = startIdx.clamp(0, maxIndex);
    final clampedEnd = endIdx.clamp(0, maxIndex);

    return copyWith(
      startIdx: clampedStart <= clampedEnd ? clampedStart : clampedEnd,
      endIdx: clampedStart <= clampedEnd ? clampedEnd : clampedStart,
    );
  }
}
