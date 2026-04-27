import 'package:flutter/material.dart';
import 'package:kchart_core/kchart_core.dart';
import '../controller.dart';
import '../widgets/kchart_scope.dart';

/// Overlay that displays OHLCV data for the selected candle.
class OhlcvOverlay extends StatelessWidget {
  /// The controller providing chart data.
  final KChartController controller;

  /// Creates an [OhlcvOverlay].
  const OhlcvOverlay({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final scope = KChartScope.of(context);
    if (scope == null) return const SizedBox.shrink();

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return ValueListenableBuilder<CrosshairState?>(
          valueListenable: controller.crosshair.state,
          builder: (context, state, _) {
            final series = controller.frame.series;
            if (series.length == 0) return const SizedBox.shrink();

            int index;
            if (state?.timestamp != null) {
              index = controller.findTimestampIndex(state!.timestamp!);
            } else {
              index = series.length - 1;
            }

            if (index == -1) return const SizedBox.shrink();

            final open = series.open[index];
            final high = series.high[index];
            final low = series.low[index];
            final close = series.close[index];
            final volume = series.volume[index];

            final bool isBullish = close >= open;
            final Color color =
                isBullish ? scope.theme.bullColor : scope.theme.bearColor;
            final textStyle = scope.theme.axisTextStyle.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            );
            final labelStyle = scope.theme.axisTextStyle;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8,
                children: [
                  _buildItem('O', scope.formatters.formatPrice(open), labelStyle,
                      textStyle),
                  _buildItem('H', scope.formatters.formatPrice(high), labelStyle,
                      textStyle),
                  _buildItem('L', scope.formatters.formatPrice(low), labelStyle,
                      textStyle),
                  _buildItem('C', scope.formatters.formatPrice(close),
                      labelStyle, textStyle),
                  _buildItem('Vol', scope.formatters.formatVolume(volume),
                      labelStyle, textStyle),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildItem(
      String label, String value, TextStyle labelStyle, TextStyle valueStyle) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: '$label: ', style: labelStyle),
          TextSpan(text: value, style: valueStyle),
        ],
      ),
    );
  }
}
