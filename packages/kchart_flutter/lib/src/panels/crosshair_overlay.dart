import 'package:flutter/material.dart' hide Viewport;
import 'package:kchart_core/kchart_core.dart';
import '../widgets/kchart_scope.dart';
import '../i18n/number_formatters.dart';
import '../theme.dart';
import '../utils/painting_utils.dart';

/// A wrapper that ensures the crosshair horizontal line is only drawn
/// if the mouse is currently over this panel.
class CrosshairOverlay extends StatelessWidget {
  /// The crosshair state from the coordinator.
  final CrosshairState? state;

  /// The chart frame containing the data.
  final ChartFrame frame;

  /// Optional ID of the indicator for this panel.
  final String? indicatorId;

  /// Creates a [CrosshairOverlay].
  const CrosshairOverlay({
    super.key,
    required this.state,
    required this.frame,
    this.indicatorId,
  });

  @override
  Widget build(BuildContext context) {
    final currentState = state;
    final scope = KChartScope.of(context);
    if (currentState == null || currentState.dy == null || scope == null) {
      return const SizedBox.shrink();
    }

    return _CrosshairRenderWidget(
      state: currentState,
      frame: frame,
      indicatorId: indicatorId,
      chartKey: scope.chartKey,
      theme: scope.theme,
      formatters: scope.formatters,
    );
  }
}

/// Internal widget that handles the rendering of the crosshair horizontal line and labels.
class _CrosshairRenderWidget extends LeafRenderObjectWidget {
  /// The crosshair state.
  final CrosshairState state;
  /// The current chart frame.
  final ChartFrame frame;
  /// Optional indicator ID.
  final String? indicatorId;
  /// Global key to the chart.
  final GlobalKey chartKey;
  /// The chart theme.
  final ChartTheme theme;
  /// Number formatters.
  final ChartNumberFormatters formatters;

  /// Creates a [_CrosshairRenderWidget].
  const _CrosshairRenderWidget({
    required this.state,
    required this.frame,
    this.indicatorId,
    required this.chartKey,
    required this.theme,
    required this.formatters,
  });

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderCrosshair(state, frame, indicatorId, chartKey, theme, formatters);

  @override
  void updateRenderObject(BuildContext context, covariant _RenderCrosshair renderObject) {
    renderObject.state = state;
    renderObject.frame = frame;
    renderObject.indicatorId = indicatorId;
    renderObject.chartKey = chartKey;
    renderObject.theme = theme;
    renderObject.formatters = formatters;
  }
}

/// RenderObject that performs the crosshair horizontal line and Y-axis label drawing.
class _RenderCrosshair extends RenderBox {
  CrosshairState _state;
  ChartFrame _frame;
  String? _indicatorId;
  GlobalKey _chartKey;
  ChartTheme _theme;
  ChartNumberFormatters _formatters;

  /// Creates a [_RenderCrosshair].
  _RenderCrosshair(
    this._state,
    this._frame,
    this._indicatorId,
    this._chartKey,
    this._theme,
    this._formatters,
  );

  /// Current crosshair state.
  CrosshairState get state => _state;
  set state(CrosshairState value) {
    if (_state == value) return;
    _state = value;
    markNeedsPaint();
  }

  /// Current chart frame.
  ChartFrame get frame => _frame;
  set frame(ChartFrame value) {
    if (_frame == value) return;
    _frame = value;
    markNeedsPaint();
  }

  /// Indicator ID for the current panel.
  String? get indicatorId => _indicatorId;
  set indicatorId(String? value) {
    if (_indicatorId == value) return;
    _indicatorId = value;
    markNeedsPaint();
  }

  /// Global key for coordinate conversion.
  GlobalKey get chartKey => _chartKey;
  set chartKey(GlobalKey value) {
    if (_chartKey == value) return;
    _chartKey = value;
    markNeedsPaint();
  }

  /// Visual theme.
  ChartTheme get theme => _theme;
  set theme(ChartTheme value) {
    if (_theme == value) return;
    _theme = value;
    markNeedsPaint();
  }

  /// Localized formatters.
  ChartNumberFormatters get formatters => _formatters;
  set formatters(ChartNumberFormatters value) {
    if (_formatters == value) return;
    _formatters = value;
    markNeedsPaint();
  }

  @override
  bool get sizedByParent => true;

  @override
  void performResize() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final yAxisWidth = _theme.yAxisWidth;
    final chartWidth = size.width - yAxisWidth;

    final paint = Paint()
      ..color = _theme.crosshairColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    if (_state.dy != null) {
      try {
        final rootBox =
            _chartKey.currentContext?.findRenderObject() as RenderBox?;

        if (rootBox != null && rootBox.attached) {
          final myOffsetInRoot = localToGlobal(Offset.zero, ancestor: rootBox);
          final localDy = _state.dy! - myOffsetInRoot.dy;

          if (localDy >= 0 && localDy <= size.height) {
            PaintingUtils.drawDashedLine(
              canvas,
              Offset(0, localDy) + offset,
              Offset(chartWidth, localDy) + offset,
              paint,
            );

            _drawYAxisLabel(canvas, size, localDy, offset);
          }
        }
      } catch (e) {
        // Fallback or ignore if not attached
      }
    }
  }

  void _drawYAxisLabel(Canvas canvas, Size size, double localDy, Offset offset) {
    final double? value = _calculateValueAt(localDy);
    if (value == null) return;

    final String label = _indicatorId == 'volume'
        ? _formatters.formatVolume(value)
        : _formatters.formatPrice(value);

    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: _theme.crosshairTextStyle,
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final double labelHeight = textPainter.height + 4;

    final double x = size.width - _theme.yAxisWidth;
    double y = localDy - labelHeight / 2;
    y = y.clamp(0.0, size.height - labelHeight);

    final rect = Rect.fromLTWH(x, y, _theme.yAxisWidth, labelHeight).shift(offset);
    final bgPaint = Paint()
      ..color = _theme.crosshairColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(4)), bgPaint);
    textPainter.paint(canvas, Offset(x + 4, y + 2) + offset);
  }

  double? _calculateValueAt(double localDy) {
    final viewport = _frame.viewport;
    final series = _indicatorId == null
        ? _frame.series
        : (_indicatorId == 'volume'
            ? _frame.series
            : _frame.indicators[_indicatorId]);

    if (series == null || series.length == 0) return null;

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);

    double minValue = double.infinity;
    double maxValue = double.negativeInfinity;

    if (_indicatorId == 'volume') {
      for (int i = startIdx; i <= endIdx; i++) {
        if (series.volume[i] > maxValue) maxValue = series.volume[i];
      }
      minValue = 0;
    } else {
      // Check if it's an indicator series (typically only has 'close' as value)
      // or a main series (has OHLC).
      final isIndicator = _indicatorId != null;

      for (int i = startIdx; i <= endIdx; i++) {
        if (isIndicator) {
           final val = series.close[i];
           if (val < minValue) minValue = val;
           if (val > maxValue) maxValue = val;
        } else {
           if (series.low[i] < minValue) minValue = series.low[i];
           if (series.high[i] > maxValue) maxValue = series.high[i];
        }
      }
    }

    if (minValue == maxValue) {
      minValue -= 1.0;
      maxValue += 1.0;
    }

    final double range = maxValue - minValue;
    if (range <= 0) return minValue;

    return maxValue - (localDy / size.height * range);
  }
}
