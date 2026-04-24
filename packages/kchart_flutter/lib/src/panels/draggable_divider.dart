import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

/// A divider that can be dragged to resize adjacent panels.
class DraggableDivider extends StatelessWidget {
  /// Callback when the divider is dragged.
  final void Function(DragUpdateDetails) onDragUpdate;

  /// Creates a [DraggableDivider].
  const DraggableDivider({
    super.key,
    required this.onDragUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      debugLabel: 'DraggableDivider',
      child: Semantics(
        label: 'Dividir paneles',
        container: true,
        slider: true, // It acts like a one-dimensional slider for resize
        child: Listener(
          behavior: HitTestBehavior.opaque,
          onPointerMove: (event) {
            if (event.buttons & kPrimaryButton != 0) {
              onDragUpdate(DragUpdateDetails(
                delta: event.delta,
                primaryDelta: event.delta.dy,
                globalPosition: event.position,
                localPosition: event.localPosition,
              ));
            }
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.resizeUpDown,
            child: Container(
              height: 8.0,
              color: Colors.transparent,
              child: Center(
                child: Container(
                  height: 1.0,
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
