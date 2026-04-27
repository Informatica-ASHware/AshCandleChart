import 'package:flutter/widgets.dart';
import 'package:kchart_core/kchart_core.dart';
import '../controller.dart';
import '../painting/secondary_panel_painter.dart';
import 'crosshair_overlay.dart';
import '../painting/paint_pool.dart';
import '../painting/layer_cache.dart';
import '../widgets/kchart_scope.dart';
import 'chart_panel.dart';

/// Panel for displaying secondary indicators (e.g., RSI, MACD).
class SecondaryPanel extends ChartPanel {
  @override
  final String id;

  @override
  final double flex;

  /// The controller providing data for this panel.
  final KChartController controller;

  /// The ID of the indicator to display in this panel.
  final String indicatorId;

  /// Creates a [SecondaryPanel] with the given [controller], [indicatorId], and [flex].
  SecondaryPanel({
    required this.controller,
    required this.indicatorId,
    this.flex = 1.0,
  }) : id = 'secondary_$indicatorId';

  @override
  Widget build(BuildContext context) {
    return _SecondaryPanelWidget(
      controller: controller,
      indicatorId: indicatorId,
    );
  }
}

class _SecondaryPanelWidget extends StatefulWidget {
  final KChartController controller;
  final String indicatorId;

  const _SecondaryPanelWidget({
    required this.controller,
    required this.indicatorId,
  });

  @override
  State<_SecondaryPanelWidget> createState() => _SecondaryPanelWidgetState();
}

class _SecondaryPanelWidgetState extends State<_SecondaryPanelWidget> {
  late final PaintPool _paintPool;
  late final LayerCache _cache;

  @override
  void initState() {
    super.initState();
    _paintPool = PaintPool();
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

    return Stack(
      children: [
        ListenableBuilder(
          listenable: widget.controller,
          builder: (context, child) {
            if (theme == null) return const SizedBox.shrink();
            return CustomPaint(
              size: Size.infinite,
              painter: SecondaryPanelPainter(
                frame: widget.controller.frame,
                paintPool: _paintPool,
                cache: _cache,
                indicatorId: widget.indicatorId,
                theme: theme,
              ),
            );
          },
        ),
        ValueListenableBuilder<CrosshairState?>(
          valueListenable: widget.controller.crosshair.state,
          builder: (context, state, child) {
            return CrosshairOverlay(
              state: state,
              frame: widget.controller.frame,
              indicatorId: widget.indicatorId,
            );
          },
        ),
      ],
    );
  }
}
