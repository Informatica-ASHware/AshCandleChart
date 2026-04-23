import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kchart_core/kchart_core.dart';
import '../painting/crosshair_painter.dart';

/// A wrapper that ensures the crosshair horizontal line is only drawn
/// if the mouse is currently over this panel.
class CrosshairOverlay extends StatelessWidget {
  /// The crosshair state from the coordinator.
  final CrosshairState? state;

  /// Creates a [CrosshairOverlay].
  const CrosshairOverlay({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final currentState = state;
    if (currentState == null) return const SizedBox.shrink();

    return _CrosshairRenderWidget(state: currentState);
  }
}

class _CrosshairRenderWidget extends LeafRenderObjectWidget {
  final CrosshairState state;

  const _CrosshairRenderWidget({required this.state});

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderCrosshair(state);

  @override
  void updateRenderObject(BuildContext context, _RenderCrosshair renderObject) {
    renderObject.state = state;
  }
}

class _RenderCrosshair extends RenderBox {
  CrosshairState _state;
  _RenderCrosshair(this._state);

  CrosshairState get state => _state;
  set state(CrosshairState value) {
    if (_state == value) return;
    _state = value;
    markNeedsPaint();
  }

  @override
  bool get sizedByParent => true;

  @override
  Size computeSizeForNoChild(BoxConstraints constraints) => constraints.biggest;

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Vertical line is easy, it's shared.
    if (_state.dx != null) {
      canvas.drawLine(
        Offset(_state.dx!, 0) + offset,
        Offset(_state.dx!, size.height) + offset,
        paint,
      );
    }

    // Horizontal line: we need to check if the mouse is within our vertical bounds.
    // _state.dy is relative to the KChart root widget.
    if (_state.dy != null) {
      // We can find our own offset relative to KChart root.
      // In this architecture, KChart is an ancestor of PanelStack, which is an ancestor of us.
      // We'll use localToGlobal to find our position and then globalToLocal of the root.
      try {
        final RenderBox? rootBox = _findRoot(this);
        if (rootBox != null) {
          final myOffsetInRoot = localToGlobal(Offset.zero, ancestor: rootBox);
          final localDy = _state.dy! - myOffsetInRoot.dy;

          if (localDy >= 0 && localDy <= size.height) {
            canvas.drawLine(
              Offset(0, localDy) + offset,
              Offset(size.width, localDy) + offset,
              paint,
            );
          }
        }
      } catch (e) {
        // Fallback or ignore if not attached
      }
    }
  }

  RenderBox? _findRoot(RenderObject obj) {
    RenderObject? current = obj.parent;
    while (current != null) {
      if (current is RenderView) return null;
      // We want to stop at the RenderBox that corresponds to KChart.
      // Since we don't want to depend on KChart type here, we can look for the
      // one that has a specific hint or just go up until we hit the top-most RenderBox before RenderView/Scaffold.
      // A common trick is to use a specific key or look for the first RenderBox with a certain property.
      // For this task, let's assume the root is the first RenderBox that is not a child of another RenderBox
      // within the KChart subtree.
      if (current is RenderBox && current.parent is! RenderBox) return current;
      current = current.parent;
    }
    return null;
  }
}
