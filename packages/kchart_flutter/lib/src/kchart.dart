import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'controller.dart';
import 'gestures/gesture_arbiter.dart';
import 'panels/panel_stack.dart';

/// The main KChart widget.
///
/// Displays financial charts using a [KChartController].
/// Supports multiple panels (Main, Volume, RSI) with draggable dividers.
class KChart extends StatefulWidget {
  /// The controller for this chart.
  final KChartController controller;

  /// Creates a [KChart] with the given [controller].
  const KChart({
    super.key,
    required this.controller,
  });

  @override
  State<KChart> createState() => _KChartState();
}

class _KChartState extends State<KChart> {
  late final GestureArbiter _arbiter;

  @override
  void initState() {
    super.initState();
    _arbiter = GestureArbiter(
      onPanUpdate: (delta) {
        widget.controller.pan(delta.dx, context.size?.width ?? 0.0);
      },
      onZoomUpdate: (scale, focalPoint) {
        widget.controller.zoom(
          scale,
          focalPoint.dx,
          context.size?.width ?? 0.0,
        );
      },
      onLongPressStart: (position) {
        // Handle long press (e.g., show tooltip/crosshair)
      },
      onLongPressEnd: () {
        // Hide tooltip/crosshair
      },
      onTap: (position) {
        // Handle tap
      },
    );
  }

  @override
  void dispose() {
    _arbiter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListenableBuilder(
          listenable: widget.controller,
          builder: (context, child) {
            return Listener(
              onPointerDown: _arbiter.handleEvent,
              onPointerMove: _arbiter.handleEvent,
              onPointerUp: _arbiter.handleEvent,
              onPointerCancel: _arbiter.handleEvent,
              onPointerSignal: (event) {
                if (event is PointerScrollEvent) {
                  _arbiter.handleEvent(event);
                }
              },
              onPointerPanZoomStart: _arbiter.handleEvent,
              onPointerPanZoomUpdate: _arbiter.handleEvent,
              onPointerPanZoomEnd: _arbiter.handleEvent,
              child: MouseRegion(
                cursor: SystemMouseCursors.precise,
                child: PanelStack(
                  panels: widget.controller.panels,
                  onResize: (index, delta) {
                    widget.controller.resizePanels(
                      index,
                      delta,
                      constraints.maxHeight,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
