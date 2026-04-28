import 'package:flutter_test/flutter_test.dart';
import 'package:ash_candle_chart_flutter/src/i18n/number_formatters.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('en_US', null);
    await initializeDateFormatting('es_ES', null);
    await initializeDateFormatting('pt_BR', null);
  });

  group('ChartNumberFormatters', () {
    test('formats price and volume for en_US', () {
      final formatters = ChartNumberFormatters('en_US');
      expect(formatters.formatPrice(1234.56), '1,234.56');
      expect(formatters.formatVolume(1000000), '1M');
    });

    test('formats price and volume for es_ES', () {
      final formatters = ChartNumberFormatters('es_ES');
      // Note: NumberFormat behavior can vary by environment,
      // but typically es_ES uses dot for thousands and comma for decimals.
      // Compact format might also differ.
      expect(formatters.formatPrice(1234.56), contains('1.234,56'));
      expect(formatters.formatVolume(1000000), anyOf('1 M', '1M'));
    });

    test('formats price and volume for pt_BR', () {
      final formatters = ChartNumberFormatters('pt_BR');
      expect(formatters.formatPrice(1234.56), contains('1.234,56'));
      expect(formatters.formatVolume(1000000), anyOf('1 mi', '1M', '1 M'));
    });
  });
}
