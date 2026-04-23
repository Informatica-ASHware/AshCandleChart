import 'package:intl/intl.dart';

/// Provides locale-aware numeric formatting for chart data.
class ChartNumberFormatters {
  /// The locale used for formatting.
  final String locale;

  /// Number format for prices.
  final NumberFormat priceFormat;

  /// Number format for volumes.
  final NumberFormat volumeFormat;

  /// Creates [ChartNumberFormatters] for the given [locale].
  ChartNumberFormatters(this.locale)
      : priceFormat = NumberFormat.decimalPattern(locale),
        volumeFormat = NumberFormat.compact(locale: locale);

  /// Formats a price value.
  String formatPrice(double price) => priceFormat.format(price);

  /// Formats a volume value.
  String formatVolume(double volume) => volumeFormat.format(volume);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChartNumberFormatters &&
          runtimeType == other.runtimeType &&
          locale == other.locale;

  @override
  int get hashCode => locale.hashCode;
}
