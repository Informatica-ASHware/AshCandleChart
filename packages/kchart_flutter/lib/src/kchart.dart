import 'package:flutter/material.dart';
import 'controller.dart';
import 'panels/panel_stack.dart';

/// The main KChart widget.
///
/// Displays financial charts using a [KChartController].
/// Supports multiple panels (Main, Volume, RSI) with draggable dividers.
class KChart extends StatelessWidget {
  /// The controller for this chart.
  final KChartController controller;

  /// Creates a [KChart] with the given [controller].
  const KChart({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListenableBuilder(
          listenable: controller,
          builder: (context, child) {
            return PanelStack(
              panels: controller.panels,
              onResize: (index, delta) {
                controller.resizePanels(
                  index,
                  delta,
                  constraints.maxHeight,
                );
              },
            );
          },
        );
      },
    );
  }
}
