import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:kchart_core/kchart_core.dart';
import '../controller.dart';
import '../painting/main_panel_painter.dart';
import 'crosshair_overlay.dart';
import 'ohlcv_overlay.dart';
import '../painting/paint_pool.dart';
import '../painting/layer_cache.dart';
import '../widgets/kchart_scope.dart';
import 'chart_panel.dart';

/// The main price panel that displays candles and the grid.
class MainPanel extends ChartPanel {
  @override
  final String id = 'main';

  @override
  final double flex;

  /// The controller providing data for this panel.
  final KChartController controller;

  /// Creates a [MainPanel] with the given [controller] and [flex].
  MainPanel({
    required this.controller,
    this.flex = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return _MainPanelWidget(controller: controller);
  }
}

class _MainPanelWidget extends StatefulWidget {
  final KChartController controller;

  const _MainPanelWidget({required this.controller});

  @override
  State<_MainPanelWidget> createState() => _MainPanelWidgetState();
}

class _MainPanelWidgetState extends State<_MainPanelWidget> {
  late final PaintPool _paintPool;
  late final LayerCache _gridCache;
  late final LayerCache _candleCache;
  late final LayerCache _yAxisCache;

  final Float32List _bullishBuffer = Float32List(1000 * 24);
  final Float32List _bearishBuffer = Float32List(1000 * 24);

  @override
  void initState() {
    super.initState();
    _paintPool = PaintPool();
    _gridCache = LayerCache();
    _candleCache = LayerCache();
    _yAxisCache = LayerCache();
  }

  @override
  void dispose() {
    _gridCache.dispose();
    _candleCache.dispose();
    _yAxisCache.dispose();
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
              painter: MainPanelPainter(
                frame: widget.controller.frame,
                paintPool: _paintPool,
                gridCache: _gridCache,
                candleCache: _candleCache,
                yAxisCache: _yAxisCache,
                theme: theme,
                bullishBuffer: _bullishBuffer,
                bearishBuffer: _bearishBuffer,
                selectionRange: widget.controller.selectionRange,
                formatters: scope?.formatters,
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
            );
          },
        ),
        OhlcvOverlay(controller: widget.controller),
      ],
    );
  }
}
