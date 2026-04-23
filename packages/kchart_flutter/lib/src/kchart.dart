import 'package:flutter/material.dart';
import 'controller.dart';
import 'painting/main_panel_painter.dart';

/// The main KChart widget.
///
/// Displays financial charts using a [KChartController].
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
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: MainPanelPainter(
            frame: controller.frame,
          ),
        );
      },
    );
  }
}
