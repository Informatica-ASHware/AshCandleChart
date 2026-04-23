import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'controller.dart';
import 'painting/layer_cache.dart';
import 'painting/main_panel_painter.dart';
import 'painting/paint_pool.dart';

/// The main KChart widget.
///
/// Displays financial charts using a [KChartController].
/// Optimizes performance using [PaintPool] and [LayerCache].
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
  late final PaintPool _paintPool;
  late final LayerCache _gridCache;
  late final LayerCache _candleCache;

  // Pre-allocated buffers for vertices to reduce GC pressure.
  // Assuming a maximum of 1000 visible candles, each needing 24 vertices.
  final Float32List _bullishBuffer = Float32List(1000 * 24);
  final Float32List _bearishBuffer = Float32List(1000 * 24);

  @override
  void initState() {
    super.initState();
    _paintPool = PaintPool();
    _gridCache = LayerCache();
    _candleCache = LayerCache();
  }

  @override
  void dispose() {
    _gridCache.dispose();
    _candleCache.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: MainPanelPainter(
            frame: widget.controller.frame,
            paintPool: _paintPool,
            gridCache: _gridCache,
            candleCache: _candleCache,
            bullishBuffer: _bullishBuffer,
            bearishBuffer: _bearishBuffer,
          ),
        );
      },
    );
  }
}
