import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart' hide Viewport;
import 'package:kchart_core/kchart_core.dart';
import '../../controller.dart';
import '../../painting/paint_pool.dart';
import '../../theme.dart';
import '../chart_panel.dart';
import '../../widgets/kchart_scope.dart';

/// Panel that renders the Volume Profile histogram horizontally over the Y-axis.
class VolumeProfilePanel extends ChartPanel {
  @override
  final String id = 'volume_profile';

  @override
  final double flex;

  @override
  double get minHeight => 50.0;

  /// The controller providing data for this panel.
  final KChartController controller;

  /// Creates a [VolumeProfilePanel].
  VolumeProfilePanel({
    required this.controller,
    this.flex = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return _VolumeProfileWidget(controller: controller);
  }
}

class _VolumeProfileWidget extends StatefulWidget {
  final KChartController controller;

  const _VolumeProfileWidget({required this.controller});

  @override
  State<_VolumeProfileWidget> createState() => _VolumeProfileWidgetState();
}

class _VolumeProfileWidgetState extends State<_VolumeProfileWidget> {
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
        final vp = frame.volumeProfile ??
            frame.series.calculateVolumeProfile(
              startIdx: frame.viewport.startIdx,
              endIdx: frame.viewport.endIdx,
            );

        return CustomPaint(
          size: Size.infinite,
          painter: VolumeProfilePainter(
            volumeProfile: vp,
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

/// Painter for the [VolumeProfilePanel].
class VolumeProfilePainter extends CustomPainter {
  /// The volume profile data.
  final VolumeProfile volumeProfile;
  /// The current viewport.
  final Viewport viewport;
  /// The main series to calculate Y scaling.
  final Series series;
  /// The theme.
  final ChartTheme theme;
  /// Paint pool for reuse.
  final PaintPool paintPool;

  /// Creates a [VolumeProfilePainter].
  VolumeProfilePainter({
    required this.volumeProfile,
    required this.viewport,
    required this.series,
    required this.theme,
    required this.paintPool,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (volumeProfile.bins.isEmpty) return;

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
    final double maxWidth = size.width * 0.3; // Max width for the histogram

    double priceToY(double price) {
      return viewHeight - ((price - minPrice) / priceRange * viewHeight);
    }

    final int binCount = volumeProfile.bins.length;
    final double binHeight = viewHeight / binCount;

    // Use Vertices for high performance rendering of the histogram
    final int vertexCount = binCount * 12; // 2 triangles (6 vertices) per buy/sell side
    final Float32List buyVertices = Float32List(vertexCount * 2);
    final Float32List sellVertices = Float32List(vertexCount * 2);

    int bOffset = 0;
    int sOffset = 0;

    for (int i = 0; i < binCount; i++) {
      final bin = volumeProfile.bins[i];
      final double yCenter = priceToY(bin.price);
      final double yTop = yCenter - binHeight / 2;
      final double yBottom = yCenter + binHeight / 2;

      final double totalVolWidth = (bin.volume / volumeProfile.maxVolume) * maxWidth;
      final double buyRatio = bin.volume > 0 ? bin.buyVolume / bin.volume : 0.5;
      final double buyWidth = totalVolWidth * buyRatio;
      final double sellWidth = totalVolWidth * (1 - buyRatio);

      // Buy side (left part of the bar)
      _addRectToVertices(buyVertices, bOffset, 0, yTop, buyWidth, yBottom);
      bOffset += 12;

      // Sell side (right part of the bar)
      _addRectToVertices(sellVertices, sOffset, buyWidth, yTop, buyWidth + sellWidth, yBottom);
      sOffset += 12;
    }

    final buyPaint = paintPool.borrow()..color = theme.vpBuyColor;
    final sellPaint = paintPool.borrow()..color = theme.vpSellColor;

    canvas.drawVertices(
      ui.Vertices.raw(ui.VertexMode.triangles, buyVertices),
      ui.BlendMode.srcOver,
      buyPaint,
    );
    canvas.drawVertices(
      ui.Vertices.raw(ui.VertexMode.triangles, sellVertices),
      ui.BlendMode.srcOver,
      sellPaint,
    );

    // Draw POC line
    final pocY = priceToY(volumeProfile.pocPrice);
    final pocPaint = paintPool.borrow()
      ..color = theme.vpPocColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, pocY), Offset(size.width, pocY), pocPaint);

    paintPool.releaseAll();
  }

  void _addRectToVertices(Float32List vertices, int offset, double x1, double y1, double x2, double y2) {
    vertices[offset++] = x1; vertices[offset++] = y1;
    vertices[offset++] = x2; vertices[offset++] = y1;
    vertices[offset++] = x2; vertices[offset++] = y2;

    vertices[offset++] = x1; vertices[offset++] = y1;
    vertices[offset++] = x2; vertices[offset++] = y2;
    vertices[offset++] = x1; vertices[offset++] = y2;
  }

  @override
  bool shouldRepaint(covariant VolumeProfilePainter oldDelegate) {
    return oldDelegate.volumeProfile != volumeProfile ||
        oldDelegate.viewport != viewport;
  }
}
