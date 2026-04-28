import 'package:freezed_annotation/freezed_annotation.dart';

part 'crosshair_state.freezed.dart';

/// Represents the state of the crosshair in the chart.
///
/// Contains the position and data associated with the current tracking point.
@freezed
abstract class CrosshairState with _$CrosshairState {
  /// Creates a [CrosshairState].
  const factory CrosshairState({
    /// Horizontal position in local pixels.
    double? dx,

    /// Vertical position in local pixels.
    double? dy,

    /// The timestamp at the current horizontal position.
    int? timestamp,

    /// The price (or value) at the current vertical position.
    double? price,
  }) = _CrosshairState;
}
