import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kchart_core/kchart_core.dart';
import '../widgets/kchart_scope.dart';

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
    final scope = KChartScope.of(context);
    if (currentState == null || currentState.dy == null || scope == null) {
      return const SizedBox.shrink();
    }

    return _CrosshairRenderWidget(
      state: currentState,
      chartKey: scope.chartKey,
    );
  }
}

class _CrosshairRenderWidget extends LeafRenderObjectWidget {
  final CrosshairState state;
  final GlobalKey chartKey;

  const _CrosshairRenderWidget({
    required this.state,
    required this.chartKey,
  });

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderCrosshair(state, chartKey);

  @override
  void updateRenderObject(BuildContext context, _RenderCrosshair renderObject) {
    renderObject.state = state;
    renderObject.chartKey = chartKey;
  }
}

class _RenderCrosshair extends RenderBox {
  CrosshairState _state;
  GlobalKey _chartKey;

  _RenderCrosshair(this._state, this._chartKey);

  CrosshairState get state => _state;
  set state(CrosshairState value) {
    if (_state == value) return;
    _state = value;
    markNeedsPaint();
  }

  GlobalKey get chartKey => _chartKey;
  set chartKey(GlobalKey value) {
    if (_chartKey == value) return;
    _chartKey = value;
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

    if (_state.dy != null) {
      try {
        final rootBox =
            _chartKey.currentContext?.findRenderObject() as RenderBox?;

        if (rootBox != null && rootBox.attached) {
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
}
