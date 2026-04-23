import 'package:flutter/widgets.dart';
import '../controller.dart';
import '../painting/secondary_panel_painter.dart';
import '../painting/paint_pool.dart';
import '../painting/layer_cache.dart';
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
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: SecondaryPanelPainter(
            frame: widget.controller.frame,
            paintPool: _paintPool,
            cache: _cache,
            indicatorId: 'volume',
          ),
        );
      },
    );
  }
}
