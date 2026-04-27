import 'package:flutter/material.dart';
import 'package:kchart_core/kchart_core.dart';
import '../controller.dart';
import '../widgets/kchart_scope.dart';

/// An overlay that displays the Open, High, Low, Close, and Volume (OHLCV)
/// details for the selected or last candle.
class OhlcvOverlay extends StatelessWidget {
  /// The controller providing chart data and crosshair state.
  final KChartController controller;

  /// Creates an [OhlcvOverlay] with the given [controller].
  const OhlcvOverlay({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final scope = KChartScope.of(context);
    if (scope == null) return const SizedBox.shrink();

    final theme = scope.theme;
    final formatters = scope.formatters;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return ValueListenableBuilder<CrosshairState?>(
            valueListenable: controller.crosshair.state,
            builder: (context, crosshairState, _) {
              final frame = controller.frame;
              final series = frame.series;
              if (series.isEmpty) return const SizedBox.shrink();

              int index;
              if (crosshairState != null && crosshairState.timestamp != null) {
                index = controller.findTimestampIndex(crosshairState.timestamp!,
                    nearest: true);
              } else {
                index = series.length - 1;
              }

              if (index < 0 || index >= series.length) {
                return const SizedBox.shrink();
              }

              final open = series.open[index];
              final high = series.high[index];
              final low = series.low[index];
              final close = series.close[index];
              final volume = series.volume[index];

              final isBullish = close >= open;
              final valueColor = isBullish ? theme.bullColor : theme.bearColor;
              final labelStyle =
                  theme.axisTextStyle.copyWith(fontWeight: FontWeight.bold);
              final valueStyle = theme.axisTextStyle.copyWith(color: valueColor);

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _InfoItem(
                      label: 'O:',
                      value: formatters.formatPrice(open),
                      labelStyle: labelStyle,
                      valueStyle: valueStyle),
                  const SizedBox(width: 8),
                  _InfoItem(
                      label: 'H:',
                      value: formatters.formatPrice(high),
                      labelStyle: labelStyle,
                      valueStyle: valueStyle),
                  const SizedBox(width: 8),
                  _InfoItem(
                      label: 'L:',
                      value: formatters.formatPrice(low),
                      labelStyle: labelStyle,
                      valueStyle: valueStyle),
                  const SizedBox(width: 8),
                  _InfoItem(
                      label: 'C:',
                      value: formatters.formatPrice(close),
                      labelStyle: labelStyle,
                      valueStyle: valueStyle),
                  const SizedBox(width: 8),
                  _InfoItem(
                      label: 'Vol:',
                      value: formatters.formatVolume(volume),
                      labelStyle: labelStyle,
                      valueStyle: valueStyle),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  const _InfoItem({
    required this.label,
    required this.value,
    required this.labelStyle,
    required this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(width: 2),
        Text(value, style: valueStyle),
      ],
    );
  }
}
