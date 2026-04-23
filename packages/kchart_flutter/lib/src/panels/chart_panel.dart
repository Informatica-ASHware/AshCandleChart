import 'package:flutter/widgets.dart';

/// Base class for all chart panels in the KChart.
///
/// Panels are stacked vertically in a `PanelStack`.
abstract class ChartPanel {
  /// Unique identifier for this panel.
  String get id;

  /// The flex factor for the panel's height.
  double get flex;

  /// The minimum height of the panel.
  double get minHeight => 50.0;

  /// Creates the widget that renders this panel.
  Widget build(BuildContext context);
}
