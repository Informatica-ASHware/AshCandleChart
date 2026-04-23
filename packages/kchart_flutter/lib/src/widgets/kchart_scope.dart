import 'package:flutter/material.dart';

/// Internal scope to share the chart root key with panels.
class KChartScope extends InheritedWidget {
  /// The global key of the chart root (MouseRegion).
  final GlobalKey chartKey;

  /// Creates a [KChartScope].
  const KChartScope({
    super.key,
    required this.chartKey,
    required super.child,
  });

  /// Finds the nearest [KChartScope] in the widget tree.
  static KChartScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KChartScope>();
  }

  @override
  bool updateShouldNotify(KChartScope oldWidget) {
    return chartKey != oldWidget.chartKey;
  }
}
