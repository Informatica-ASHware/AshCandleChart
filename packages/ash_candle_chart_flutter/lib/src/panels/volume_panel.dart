import 'package:flutter/widgets.dart';
import 'package:ash_candle_chart_core/ash_candle_chart_core.dart';
import '../controller.dart';
import '../painting/secondary_panel_painter.dart';
import 'crosshair_overlay.dart';
import '../painting/paint_pool.dart';
import '../painting/layer_cache.dart';
import '../widgets/kchart_scope.dart';
import 'chart_panel.dart';

/// Panel for displaying trading volume.
class VolumePanel extends ChartPanel {
  @override
  final String id = 'volume';

  @override
  final double flex;

  /// The controller providing data for this panel.
  final KChartController controller;

  /// Creates a [VolumePanel] with the given [controller] and [flex].
  VolumePanel({
    required this.controller,
    this.flex = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return _VolumePanelWidget(controller: controller);
  }
}

class _VolumePanelWidget extends StatefulWidget {
  final KChartController controller;

  const _VolumePanelWidget({required this.controller});

  @override
  State<_VolumePanelWidget> createState() => _VolumePanelWidgetState();
}

class _VolumePanelWidgetState extends State<_VolumePanelWidget> {
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
                indicatorId: 'volume',
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
              indicatorId: 'volume',
            );
          },
        ),
      ],
    );
  }
}
