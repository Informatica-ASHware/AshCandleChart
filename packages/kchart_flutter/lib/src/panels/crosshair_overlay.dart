import 'package:flutter/material.dart';
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
      color: scope.theme.crosshairColor,
    );
  }
}

class _CrosshairRenderWidget extends LeafRenderObjectWidget {
  final CrosshairState state;
  final GlobalKey chartKey;
  final Color color;

  const _CrosshairRenderWidget({
    required this.state,
    required this.chartKey,
    required this.color,
  });

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderCrosshair(state, chartKey, color);

  @override
  void updateRenderObject(BuildContext context, _RenderCrosshair renderObject) {
    renderObject.state = state;
    renderObject.chartKey = chartKey;
    renderObject.color = color;
  }
}

class _RenderCrosshair extends RenderBox {
  CrosshairState _state;
  GlobalKey _chartKey;
  Color _color;

  _RenderCrosshair(this._state, this._chartKey, this._color);

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

  Color get color => _color;
  set color(Color value) {
    if (_color == value) return;
    _color = value;
    markNeedsPaint();
  }

  @override
  bool get sizedByParent => true;

  @override
  Size computePreferredSize(BoxConstraints constraints) => constraints.biggest;

  @override
  void performResize() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    final paint = Paint()
      ..color = _color
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
