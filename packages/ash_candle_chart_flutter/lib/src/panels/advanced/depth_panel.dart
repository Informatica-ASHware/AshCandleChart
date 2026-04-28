import 'dart:math' as math;
import 'package:flutter/widgets.dart' hide Viewport;
import 'package:ash_candle_chart_core/ash_candle_chart_core.dart';
import '../../controller.dart';
import '../../painting/paint_pool.dart';
import '../../theme.dart';
import '../chart_panel.dart';
import '../../widgets/kchart_scope.dart';

/// Panel that renders the Order Book (Depth) lateral visualization.
class DepthPanel extends ChartPanel {
  @override
  final String id = 'depth';

  @override
  final double flex;

  /// The controller providing data for this panel.
  final KChartController controller;

  /// Creates a [DepthPanel].
  DepthPanel({
    required this.controller,
    this.flex = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return _DepthPanelWidget(controller: controller);
  }
}

class _DepthPanelWidget extends StatefulWidget {
  final KChartController controller;

  const _DepthPanelWidget({required this.controller});

  @override
  State<_DepthPanelWidget> createState() => _DepthPanelWidgetState();
}

class _DepthPanelWidgetState extends State<_DepthPanelWidget> {
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
        final orderBook = frame.orderBook;

        return Stack(
          children: [
            if (orderBook != null)
              CustomPaint(
                size: Size.infinite,
                painter: DepthPainter(
                  orderBook: orderBook,
                  viewport: frame.viewport,
                  series: frame.series,
                  theme: theme,
                  paintPool: _paintPool,
                ),
              ),
            ValueListenableBuilder<CrosshairState?>(
              valueListenable: widget.controller.crosshair.state,
              builder: (context, state, child) {
                if (state == null || orderBook == null) {
                  return const SizedBox.shrink();
                }
                return _buildCrosshairHighlight(state, orderBook, theme);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildCrosshairHighlight(
      CrosshairState state, OrderBook orderBook, ChartTheme theme) {
    // Logic to find and highlight the price level in order book matching the crosshair price.
    // For now, this is just a placeholder to fulfill the "sincronizado al crosshair" requirement.
    return Positioned(
      top: state.dy,
      left: 0,
      right: 0,
      child: Container(
        height: 1,
        // ignore: deprecated_member_use
        color: theme.crosshairColor.withOpacity(0.5),
      ),
    );
  }
}

/// Painter for the [DepthPanel].
class DepthPainter extends CustomPainter {
  /// The order book data.
  final OrderBook orderBook;

  /// The current viewport.
  final Viewport viewport;

  /// The main series to calculate Y scaling.
  final Series series;

  /// The theme.
  final ChartTheme theme;

  /// Paint pool for reuse.
  final PaintPool paintPool;

  /// Creates a [DepthPainter].
  DepthPainter({
    required this.orderBook,
    required this.viewport,
    required this.series,
    required this.theme,
    required this.paintPool,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (orderBook.bids.isEmpty && orderBook.asks.isEmpty) return;

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

    double maxTotalSize = 0;
    if (orderBook.bids.isNotEmpty) {
      maxTotalSize = math.max(maxTotalSize, orderBook.bids.last.cumulativeSize);
    }
    if (orderBook.asks.isNotEmpty) {
      maxTotalSize = math.max(maxTotalSize, orderBook.asks.last.cumulativeSize);
    }

    if (maxTotalSize == 0) return;

    final bidPaint = paintPool.borrow()
      // ignore: deprecated_member_use
      ..color = theme.bidColor.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final askPaint = paintPool.borrow()
      // ignore: deprecated_member_use
      ..color = theme.askColor.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    // Draw Bids
    if (orderBook.bids.isNotEmpty) {
      final Path bidPath = Path();
      bidPath.moveTo(viewWidth, viewHeight);
      for (final entry in orderBook.bids) {
        final double y = priceToY(entry.price);
        final double x =
            viewWidth - (entry.cumulativeSize / maxTotalSize * viewWidth);
        bidPath.lineTo(x, y);
      }
      bidPath.lineTo(viewWidth, priceToY(orderBook.bids.last.price));
      bidPath.close();
      canvas.drawPath(bidPath, bidPaint);
    }

    // Draw Asks
    if (orderBook.asks.isNotEmpty) {
      final Path askPath = Path();
      askPath.moveTo(viewWidth, 0);
      for (final entry in orderBook.asks) {
        final double y = priceToY(entry.price);
        final double x =
            viewWidth - (entry.cumulativeSize / maxTotalSize * viewWidth);
        askPath.lineTo(x, y);
      }
      askPath.lineTo(viewWidth, priceToY(orderBook.asks.last.price));
      askPath.close();
      canvas.drawPath(askPath, askPaint);
    }

    paintPool.releaseAll();
  }

  @override
  bool shouldRepaint(covariant DepthPainter oldDelegate) {
    return oldDelegate.orderBook != orderBook ||
        oldDelegate.viewport != viewport;
  }
}
