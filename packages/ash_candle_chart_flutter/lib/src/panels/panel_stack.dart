import 'package:flutter/material.dart';
import 'chart_panel.dart';
import 'draggable_divider.dart';

/// A vertical stack of chart panels separated by draggable dividers.
class PanelStack extends StatefulWidget {
  /// The list of panels to display.
  final List<ChartPanel> panels;

  /// Callback when a divider is dragged to resize panels.
  final void Function(int index, double delta) onResize;

  /// Creates a [PanelStack] with the given [panels] and [onResize] callback.
  const PanelStack({
    super.key,
    required this.panels,
    required this.onResize,
  });

  @override
  State<PanelStack> createState() => _PanelStackState();
}

class _PanelStackState extends State<PanelStack> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < widget.panels.length; i++) {
      final panel = widget.panels[i];

      children.add(
        Expanded(
          flex: (panel.flex * 1000).toInt(),
          child: RepaintBoundary(
            child: panel.build(context),
          ),
        ),
      );

      if (i < widget.panels.length - 1) {
        children.add(
          DraggableDivider(
            onDragUpdate: (details) {
              widget.onResize(i, details.primaryDelta ?? 0.0);
            },
          ),
        );
      }
    }

    return Column(
      children: children,
    );
  }
}
