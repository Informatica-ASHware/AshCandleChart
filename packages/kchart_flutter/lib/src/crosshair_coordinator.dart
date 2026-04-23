import 'package:flutter/foundation.dart';
import 'package:kchart_core/kchart_core.dart';

/// Coordinates the crosshair state across multiple panels.
///
/// Holds a [ValueNotifier] that emits [CrosshairState] updates.
class CrosshairCoordinator {
  final ValueNotifier<CrosshairState?> _state = ValueNotifier(null);

  /// The current state of the crosshair.
  ValueListenable<CrosshairState?> get state => _state;

  /// Updates the crosshair state.
  void update(CrosshairState? newState) {
    if (_state.value == newState) return;
    _state.value = newState;
  }

  /// Clears the crosshair state.
  void clear() {
    if (_state.value == null) return;
    _state.value = null;
  }

  /// Disposes of the coordinator.
  void dispose() {
    _state.dispose();
  }
}
