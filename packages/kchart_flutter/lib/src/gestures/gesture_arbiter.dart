import 'dart:async';
import 'package:flutter/gestures.dart';

/// Callback for pan updates.
typedef OnPanUpdate = void Function(Offset delta);

/// Callback for zoom updates.
typedef OnZoomUpdate = void Function(double scale, Offset focalPoint);

/// Callback for long press start.
typedef OnLongPressStart = void Function(Offset position);

/// Callback for long press end.
typedef OnLongPressEnd = void Function();

/// Callback for tap.
typedef OnTap = void Function(Offset position);

/// Internal state for the [GestureArbiter].
enum _GestureState { idle, possibleLongPress, longPress, panning, zooming }

/// Arbitrates raw [PointerEvent]s into high-level gestures.
///
/// This class implements a state machine to differentiate between
/// Pan, Zoom, and Long Press gestures without using GestureDetector.
/// It supports Mouse, Touch, and Trackpad inputs.
class GestureArbiter {
  /// Callback when a pan gesture updates.
  final OnPanUpdate? onPanUpdate;

  /// Callback when a zoom gesture updates.
  final OnZoomUpdate? onZoomUpdate;

  /// Callback when a long press starts.
  final OnLongPressStart? onLongPressStart;

  /// Callback when a long press ends.
  final OnLongPressEnd? onLongPressEnd;

  /// Callback when a tap occurs.
  final OnTap? onTap;

  /// Duration before a press is considered a long press.
  final Duration longPressTimeout;

  _GestureState _state = _GestureState.idle;
  Timer? _longPressTimer;
  Offset? _initialPosition;
  final Map<int, PointerDownEvent> _pointers = {};
  final Map<int, Offset> _pointerLocalPositions = {};
  double _lastTrackpadScale = 1.0;

  /// Creates a [GestureArbiter] with the given callbacks.
  GestureArbiter({
    this.onPanUpdate,
    this.onZoomUpdate,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.onTap,
    this.longPressTimeout = const Duration(milliseconds: 500),
  });

  /// Processes a [PointerEvent] and updates the gesture state.
  void handleEvent(PointerEvent event) {
    // If a pointer was already down but we didn't see the start (e.g. event was consumed elsewhere)
    // We should be careful. But here we assume we see everything that bubbles up.

    if (event is PointerDownEvent) {
      _handlePointerDown(event);
    } else if (event is PointerMoveEvent) {
      _handlePointerMove(event);
    } else if (event is PointerUpEvent) {
      _handlePointerUp(event);
    } else if (event is PointerCancelEvent) {
      _handlePointerCancel(event);
    } else if (event is PointerScrollEvent) {
      _handlePointerScroll(event);
    } else if (event is PointerPanZoomStartEvent) {
      _handlePanZoomStart(event);
    } else if (event is PointerPanZoomUpdateEvent) {
      _handlePanZoomUpdate(event);
    } else if (event is PointerPanZoomEndEvent) {
      _handlePanZoomEnd(event);
    }
  }

  void _handlePointerDown(PointerDownEvent event) {
    _pointers[event.pointer] = event;
    _pointerLocalPositions[event.pointer] = event.localPosition;

    if (_pointers.length == 1) {
      _state = _GestureState.possibleLongPress;
      _initialPosition = event.localPosition;
      _longPressTimer?.cancel();
      _longPressTimer = Timer(longPressTimeout, () {
        if (_state == _GestureState.possibleLongPress) {
          _state = _GestureState.longPress;
          onLongPressStart?.call(event.localPosition);
        }
      });
    } else if (_pointers.length == 2) {
      _stopLongPressTimer();
      _state = _GestureState.zooming;
      _lastDistance = null; // Reset zoom distance for new gesture
    }
  }

  void _handlePointerMove(PointerMoveEvent event) {
    // If we receive a Move event but don't have the pointer in our map,
    // it means the Down event was likely consumed by a child (e.g. DraggableDivider).
    if (!_pointers.containsKey(event.pointer)) {
      _stopLongPressTimer();
      _state = _GestureState.idle;
      return;
    }

    _pointerLocalPositions[event.pointer] = event.localPosition;

    if (_state == _GestureState.possibleLongPress) {
      final delta = (event.localPosition - _initialPosition!).distance;
      if (delta > 10.0) {
        _stopLongPressTimer();
        _state = _GestureState.panning;
      }
    }

    if (_state == _GestureState.panning) {
      onPanUpdate?.call(event.delta);
    } else if (_state == _GestureState.zooming && _pointers.length >= 2) {
      _handleMultiTouchZoom(event);
    }
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_state == _GestureState.possibleLongPress && _pointers.length == 1) {
      onTap?.call(event.localPosition);
    }

    if (_state == _GestureState.longPress && _pointers.length == 1) {
      onLongPressEnd?.call();
    }

    _pointers.remove(event.pointer);
    _pointerLocalPositions.remove(event.pointer);
    _stopLongPressTimer();

    if (_pointers.isEmpty) {
      _state = _GestureState.idle;
    } else if (_pointers.length == 1) {
      _state = _GestureState.panning;
      _lastDistance = null;
    }
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    _pointers.remove(event.pointer);
    _pointerLocalPositions.remove(event.pointer);
    _stopLongPressTimer();
    if (_pointers.isEmpty) {
      if (_state == _GestureState.longPress) {
        onLongPressEnd?.call();
      }
      _state = _GestureState.idle;
    }
    _lastDistance = null;
  }

  void _handlePointerScroll(PointerScrollEvent event) {
    if (event.scrollDelta.dy != 0) {
      final double zoomFactor = event.scrollDelta.dy > 0 ? 0.9 : 1.1;
      onZoomUpdate?.call(zoomFactor, event.localPosition);
    }
    if (event.scrollDelta.dx != 0) {
      onPanUpdate?.call(Offset(-event.scrollDelta.dx, 0));
    }
  }

  void _handlePanZoomStart(PointerPanZoomStartEvent event) {
    _stopLongPressTimer();
    _state = _GestureState.zooming;
    _lastTrackpadScale = 1.0;
  }

  void _handlePanZoomUpdate(PointerPanZoomUpdateEvent event) {
    if (event.scale != 1.0) {
      final double scaleDelta = event.scale / _lastTrackpadScale;
      onZoomUpdate?.call(scaleDelta, event.localPosition);
      _lastTrackpadScale = event.scale;
    }
    if (event.panDelta != Offset.zero) {
      onPanUpdate?.call(event.panDelta);
    }
  }

  void _handlePanZoomEnd(PointerPanZoomEndEvent event) {
    _state = _GestureState.idle;
    _lastTrackpadScale = 1.0;
  }

  void _stopLongPressTimer() {
    _longPressTimer?.cancel();
    _longPressTimer = null;
  }

  double? _lastDistance;

  void _handleMultiTouchZoom(PointerMoveEvent event) {
    if (_pointers.length < 2) return;

    final ids = _pointers.keys.toList();
    final p1 = _pointerLocalPositions[ids[0]];
    final p2 = _pointerLocalPositions[ids[1]];

    if (p1 == null || p2 == null) return;

    final distance = (p1 - p2).distance;

    if (_lastDistance != null && _lastDistance! > 0) {
      final scale = distance / _lastDistance!;
      final focalPoint = (p1 + p2) / 2;
      onZoomUpdate?.call(scale, focalPoint);
    }
    _lastDistance = distance;
  }

  /// Resets the internal state of the arbiter and cancels any active timers.
  void dispose() {
    _stopLongPressTimer();
    _pointers.clear();
    _pointerLocalPositions.clear();
    _state = _GestureState.idle;
    _lastDistance = null;
  }

  /// Alias for [dispose] to match previous naming if needed, but [dispose] is more standard.
  void reset() => dispose();
}
