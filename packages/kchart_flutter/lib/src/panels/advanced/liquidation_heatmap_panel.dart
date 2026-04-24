import 'dart:ui' as ui;
import 'package:flutter/widgets.dart' hide Viewport;
import 'package:kchart_core/kchart_core.dart';
import 'package:flutter/material.dart' show CustomPainter, Canvas, Size, Offset, Rect;
import '../../controller.dart';
import '../../painting/paint_pool.dart';
import '../../theme.dart';
import '../chart_panel.dart';
import '../../widgets/kchart_scope.dart';

/// Panel that renders the Liquidation Heatmap as a dense layer.
class LiquidationHeatmapPanel extends ChartPanel {
  @override
  final String id = 'liquidation_heatmap';

  @override
  final double flex;

  /// The controller providing data for this panel.
  final KChartController controller;

  /// Creates a [LiquidationHeatmapPanel].
  LiquidationHeatmapPanel({
    required this.controller,
    this.flex = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return _LiquidationHeatmapWidget(controller: controller);
  }
}

class _LiquidationHeatmapWidget extends StatefulWidget {
  final KChartController controller;

  const _LiquidationHeatmapWidget({required this.controller});

  @override
  State<_LiquidationHeatmapWidget> createState() => _LiquidationHeatmapWidgetState();
}

class _LiquidationHeatmapWidgetState extends State<_LiquidationHeatmapWidget> {
  final PaintPool _paintPool = PaintPool();

  @override
  Widget build(BuildContext context) {
    final scope = KChartScope.of(context);
    final theme = scope?.theme;

    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, child) {
        if (theme == null) return const SizedBox.shrink();

        final frame = widget.controller.frame;

        return CustomPaint(
          size: Size.infinite,
          painter: LiquidationHeatmapPainter(
            liquidations: frame.liquidations,
            viewport: frame.viewport,
            series: frame.series,
            theme: theme,
            paintPool: _paintPool,
          ),
        );
      },
    );
  }
}

/// Painter for the [LiquidationHeatmapPanel].
class LiquidationHeatmapPainter extends CustomPainter {
  /// The list of liquidation areas.
  final List<LiquidationArea> liquidations;
  /// The current viewport.
  final Viewport viewport;
  /// The main series to calculate Y scaling.
  final Series series;
  /// The theme.
  final ChartTheme theme;
  /// Paint pool for reuse.
  final PaintPool paintPool;

  /// Creates a [LiquidationHeatmapPainter].
  LiquidationHeatmapPainter({
    required this.liquidations,
    required this.viewport,
    required this.series,
    required this.theme,
    required this.paintPool,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (liquidations.isEmpty) return;

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);

    double minPrice = double.infinity;
    double maxPrice = double.negativeInfinity;
    for (int i = startIdx; i <= endIdx; i++) {
      if (series.low[i] < minPrice) minPrice = series.low[i];
      if (series.high[i] > maxPrice) maxPrice = series.high[i];
    }
    if (minPrice == maxPrice) {
      minPrice -= 1.0;
      maxPrice += 1.0;
    }

    final double priceRange = maxPrice - minPrice;
    final double viewHeight = size.height;
    final double viewWidth = size.width;

    double priceToY(double price) {
      return viewHeight - ((price - minPrice) / priceRange * viewHeight);
    }

    // Render each liquidation area as a horizontal gradient glow
    for (final liq in liquidations) {
      final double y = priceToY(liq.price);
      if (y < 0 || y > viewHeight) continue;

      final double height = (liq.size / 100.0).clamp(2.0, 20.0); // Size-based height

      final paint = paintPool.borrow()
        ..shader = ui.Gradient.linear(
          Offset(0, y - height / 2),
          Offset(0, y + height / 2),
          [
            theme.liquidationColor.withOpacity(0.0),
            theme.liquidationColor.withOpacity(liq.intensity),
            theme.liquidationColor.withOpacity(0.0),
          ],
        );

      canvas.drawRect(Rect.fromLTWH(0, y - height / 2, viewWidth, height), paint);
    }

    paintPool.releaseAll();
  }

  @override
  bool shouldRepaint(covariant LiquidationHeatmapPainter oldDelegate) {
    return oldDelegate.liquidations != liquidations ||
        oldDelegate.viewport != viewport;
  }
}
