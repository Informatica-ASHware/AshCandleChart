import 'package:flutter/material.dart';
import '../controller.dart';
import '../painting/layer_cache.dart';
import '../painting/time_axis_painter.dart';
import 'kchart_scope.dart';

/// A widget that renders the X-axis (timeline) for the KChart.
class TimeAxisPanel extends StatefulWidget {
  /// The controller providing data and viewport state.
  final KChartController controller;

  /// Creates a [TimeAxisPanel].
  const TimeAxisPanel({super.key, required this.controller});

  @override
  State<TimeAxisPanel> createState() => _TimeAxisPanelState();
}

class _TimeAxisPanelState extends State<TimeAxisPanel> {
  late final LayerCache _cache;

  @override
  void initState() {
    super.initState();
    _cache = LayerCache();
  }

  @override
  void dispose() {
    _cache.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scope = KChartScope.of(context);
    final theme = scope?.theme;
    final formatters = scope?.formatters;

    if (theme == null || formatters == null) return const SizedBox.shrink();

    return SizedBox(
      height: theme.xAxisHeight,
      child: ListenableBuilder(
        listenable: widget.controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size.infinite,
            painter: TimeAxisPainter(
              frame: widget.controller.frame,
              theme: theme,
              formatters: formatters,
              cache: _cache,
            ),
          );
        },
      ),
    );
  }
}
