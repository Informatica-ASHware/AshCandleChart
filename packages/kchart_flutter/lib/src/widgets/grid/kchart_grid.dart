import 'package:flutter/material.dart';
import '../../kchart.dart';
import 'sync_engine.dart';

/// Layout configuration for [KChartGrid].
enum KChartGridLayout {
  /// Regular grid layout (MxN).
  grid,

  /// One large chart on the left/top, and others in a side column/row.
  mainAndOthers,
}

/// A widget that arranges multiple [KChart]s in a grid or custom layout.
class KChartGrid extends StatefulWidget {
  /// The list of [KChart] widgets to display.
  final List<KChart> charts;

  /// The layout strategy to use.
  final KChartGridLayout layout;

  /// Number of columns for [KChartGridLayout.grid].
  final int columns;

  /// Optional [SyncEngine] to coordinate all charts.
  final SyncEngine? syncEngine;

  /// Creates a [KChartGrid].
  const KChartGrid({
    super.key,
    required this.charts,
    this.layout = KChartGridLayout.grid,
    this.columns = 2,
    this.syncEngine,
  });

  @override
  State<KChartGrid> createState() => _KChartGridState();
}

class _KChartGridState extends State<KChartGrid> {
  @override
  void initState() {
    super.initState();
    _registerControllers();
  }

  @override
  void didUpdateWidget(KChartGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.syncEngine != widget.syncEngine ||
        oldWidget.charts != widget.charts) {
      _unregisterControllers(oldWidget.syncEngine);
      _registerControllers();
    }
  }

  void _registerControllers() {
    final engine = widget.syncEngine;
    if (engine != null) {
      for (final chart in widget.charts) {
        engine.addController(chart.controller);
      }
    }
  }

  void _unregisterControllers(SyncEngine? engine) {
    if (engine != null) {
      for (final chart in widget.charts) {
        engine.removeController(chart.controller);
      }
    }
  }

  @override
  void dispose() {
    _unregisterControllers(widget.syncEngine);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.charts.isEmpty) return const SizedBox.shrink();

    switch (widget.layout) {
      case KChartGridLayout.grid:
        return _buildGrid();
      case KChartGridLayout.mainAndOthers:
        return _buildMainAndOthers();
    }
  }

  Widget _buildGrid() {
    final rows = (widget.charts.length / widget.columns).ceil();
    return Column(
      children: List.generate(rows, (r) {
        return Expanded(
          child: Row(
            children: List.generate(widget.columns, (c) {
              final index = r * widget.columns + c;
              if (index >= widget.charts.length) {
                return const Expanded(child: SizedBox.shrink());
              }
              return Expanded(child: widget.charts[index]);
            }),
          ),
        );
      }),
    );
  }

  Widget _buildMainAndOthers() {
    if (widget.charts.length <= 1) return widget.charts.first;

    return Row(
      children: [
        Expanded(flex: 3, child: widget.charts.first),
        Expanded(
          flex: 1,
          child: Column(
            children: widget.charts.skip(1).map((c) => Expanded(child: c)).toList(),
          ),
        ),
      ],
    );
  }
}
