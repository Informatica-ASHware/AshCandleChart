import '../i18n/number_formatters.dart';

/// Utility to build semantic descriptions for chart data.
class ChartSemanticsBuilder {
  /// Builds a semantic description for a candle.
  static String buildCandleDescription({
    required int timestamp,
    required double open,
    required double high,
    required double low,
    required double close,
    required ChartNumberFormatters formatters,
  }) {
    final dateStr = formatters.formatTimestamp(timestamp);
    final openStr = formatters.formatPrice(open);
    final closeStr = formatters.formatPrice(close);
    final isBullish = close >= open;
    final trend = isBullish ? 'alcista' : 'bajista';

    return '$dateStr, apertura $openStr, cierre $closeStr, $trend';
  }
}
