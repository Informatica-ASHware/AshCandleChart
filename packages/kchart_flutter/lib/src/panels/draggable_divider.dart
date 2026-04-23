import 'package:flutter/material.dart';

/// A divider that can be dragged to resize adjacent panels.
class DraggableDivider extends StatelessWidget {
  /// Callback when the divider is dragged.
  final ValueChanged<DragUpdateDetails> onDragUpdate;

  /// Creates a [DraggableDivider].
  const DraggableDivider({
    super.key,
    required this.onDragUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: onDragUpdate,
      child: MouseRegion(
        cursor: SystemMouseCursors.resizeUpDown,
        child: Container(
          height: 8.0,
          color: Colors.transparent,
          child: Center(
            child: Container(
              height: 1.0,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
