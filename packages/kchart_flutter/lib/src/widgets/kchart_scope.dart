import 'package:flutter/material.dart';
import '../theme.dart';
import '../i18n/number_formatters.dart';

/// Internal scope to share the chart root key, theme, and formatters with panels.
class KChartScope extends InheritedWidget {
  /// The global key of the chart root (MouseRegion).
  final GlobalKey chartKey;

  /// The current chart theme.
  final ChartTheme theme;

  /// The current number formatters.
  final ChartNumberFormatters formatters;

  /// Creates a [KChartScope].
  const KChartScope({
    super.key,
    required this.chartKey,
    required this.theme,
    required this.formatters,
    required super.child,
  });

  /// Finds the nearest [KChartScope] in the widget tree.
  static KChartScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KChartScope>();
  }

  @override
  bool updateShouldNotify(KChartScope oldWidget) {
    return chartKey != oldWidget.chartKey ||
        theme != oldWidget.theme ||
        formatters != oldWidget.formatters;
  }
}
