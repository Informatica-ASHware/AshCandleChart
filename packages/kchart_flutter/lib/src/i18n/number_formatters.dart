import 'package:intl/intl.dart';

/// Provides locale-aware numeric formatting for chart data.
class ChartNumberFormatters {
  /// The locale used for formatting.
  final String locale;

  /// Number format for prices.
  final NumberFormat priceFormat;

  /// Number format for volumes.
  final NumberFormat volumeFormat;

  /// Date format for timestamps.
  final DateFormat dateFormat;

  /// Creates [ChartNumberFormatters] for the given [locale].
  ChartNumberFormatters(this.locale)
      : priceFormat = NumberFormat.decimalPattern(locale),
        volumeFormat = NumberFormat.compact(locale: locale),
        dateFormat = DateFormat.yMMMd(locale).add_Hm();

  /// Formats a price value.
  String formatPrice(double price) => priceFormat.format(price);

  /// Formats a volume value.
  String formatVolume(double volume) => volumeFormat.format(volume);

  /// Formats a timestamp.
  String formatTimestamp(int timestamp) => dateFormat
      .format(DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true));

  /// Formats a timestamp for the X-axis.
  ///
  /// Uses HH:mm if it's the same day, otherwise DD/MM.
  String formatXAxisLabel(int timestamp, {bool isSameDay = true}) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);
    if (isSameDay) {
      return DateFormat.Hm(locale).format(date);
    } else {
      // We use a custom pattern for DD/MM as requested,
      // but intl handles the locale-specific separator if we used Md().
      // For strict DD/MM:
      return DateFormat('dd/MM', locale).format(date);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChartNumberFormatters &&
          runtimeType == other.runtimeType &&
          locale == other.locale;

  @override
  int get hashCode => locale.hashCode;
}
