import 'package:freezed_annotation/freezed_annotation.dart';

part 'viewport.freezed.dart';

/// Represents the visible range and state of the chart.
@freezed
class Viewport with _$Viewport {
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
}
