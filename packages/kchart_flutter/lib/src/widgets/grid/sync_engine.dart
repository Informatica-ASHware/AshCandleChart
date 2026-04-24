import 'dart:async';
import 'package:kchart_core/kchart_core.dart';
import '../../controller.dart';

/// Engine to coordinate synchronization between multiple [KChartController]s.
class SyncEngine {
  final Map<KChartController, VoidCallback> _controllerListeners = {};
  final Map<KChartController, VoidCallback> _crosshairListeners = {};
  bool _isSyncing = false;

  /// Whether to synchronize the horizontal axis (time range).
  bool syncTimeAxis;

  /// Whether to synchronize the crosshair.
  bool syncCrosshair;

  /// Creates a [SyncEngine] with the given synchronization options.
  SyncEngine({
    this.syncTimeAxis = true,
    this.syncCrosshair = true,
  });

  /// Adds a controller to be synchronized.
  void addController(KChartController controller) {
    if (!_controllerListeners.containsKey(controller)) {
      void controllerListener() => _handleControllerUpdate(controller);
      void crosshairListener() => _handleCrosshairUpdate(controller);

      _controllerListeners[controller] = controllerListener;
      _crosshairListeners[controller] = crosshairListener;

      controller.addListener(controllerListener);
      controller.crosshair.state.addListener(crosshairListener);
    }
  }

  /// Removes a controller from synchronization.
  void removeController(KChartController controller) {
    final controllerListener = _controllerListeners.remove(controller);
    final crosshairListener = _crosshairListeners.remove(controller);

    if (controllerListener != null) {
      controller.removeListener(controllerListener);
    }
    if (crosshairListener != null) {
      controller.crosshair.state.removeListener(crosshairListener);
    }
  }

  void _handleControllerUpdate(KChartController source) {
    if (_isSyncing || !syncTimeAxis) return;
    _isSyncing = true;

    try {
      final range = source.getVisibleTimeRange();
      for (final controller in _controllerListeners.keys) {
        if (controller != source) {
          controller.setVisibleTimeRange(range.$1, range.$2);
        }
      }
    } finally {
      // Use a microtask to allow all controllers to finish their current notification cycle
      scheduleMicrotask(() {
        _isSyncing = false;
      });
    }
  }

  void _handleCrosshairUpdate(KChartController source) {
    if (_isSyncing || !syncCrosshair) return;
    _isSyncing = true;

    try {
      final state = source.crosshair.state.value;
      if (state == null) {
        for (final controller in _controllerListeners.keys) {
          if (controller != source) {
            controller.crosshair.clear();
          }
        }
      } else {
        final timestamp = state.timestamp;
        if (timestamp != null) {
          for (final controller in _controllerListeners.keys) {
            if (controller != source) {
              final dx = controller.getDxAt(timestamp);
              if (dx != null) {
                // We only sync X (timestamp). Synchronizing Y (price) across different
                // charts/timeframes often doesn't make sense and can cause the
                // horizontal line to jump or disappear.
                controller.crosshair.update(CrosshairState(
                  dx: dx,
                  timestamp: timestamp,
                ));
              } else {
                controller.crosshair.clear();
              }
            }
          }
        }
      }
    } finally {
      _isSyncing = false;
    }
  }

  /// Disposes of the engine.
  void dispose() {
    for (final entry in _controllerListeners.entries) {
      entry.key.removeListener(entry.value);
    }
    for (final entry in _crosshairListeners.entries) {
      entry.key.crosshair.state.removeListener(entry.value);
    }
    _controllerListeners.clear();
    _crosshairListeners.clear();
  }
}

/// Callback type for listeners.
typedef VoidCallback = void Function();
