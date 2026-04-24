import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme.freezed.dart';

/// Defines the visual appearance of the KChart.
///
/// Contains all color and text style configurations used by the chart
/// painters and UI components.
@freezed
class ChartTheme with _$ChartTheme {
  /// Creates a [ChartTheme] with the specified colors and styles.
  const factory ChartTheme({
    /// Color for the grid lines.
    required Color gridColor,

    /// Color for bullish candles (close >= open).
    required Color bullColor,

    /// Color for bearish candles (close < open).
    required Color bearColor,

    /// Color for the crosshair lines.
    required Color crosshairColor,

    /// Text style for labels on the axes.
    required TextStyle axisTextStyle,

    /// Text style for crosshair labels.
    required TextStyle crosshairTextStyle,

    /// Color for trade overlay lines (e.g., entry price).
    required Color tradeLineColor,

    /// Color for the chart background.
    required Color backgroundColor,

    /// Color for Volume Profile buy bars.
    required Color vpBuyColor,

    /// Color for Volume Profile sell bars.
    required Color vpSellColor,

    /// Color for the Point of Control line in Volume Profile.
    required Color vpPocColor,

    /// Color for Order Book bids.
    required Color bidColor,

    /// Color for Order Book asks.
    required Color askColor,

    /// Primary color for Liquidation Heatmap.
    required Color liquidationColor,
  }) = _ChartTheme;

  /// Default light theme for [KChart].
  factory ChartTheme.light() => ChartTheme(
        gridColor: const Color(0xFFE0E0E0),
        bullColor: const Color(0xFF4CAF50),
        bearColor: const Color(0xFFE91E63),
        crosshairColor: Colors.grey.shade600,
        axisTextStyle: const TextStyle(fontSize: 10, color: Color(0xFF757575)),
        crosshairTextStyle: const TextStyle(fontSize: 10, color: Colors.white),
        tradeLineColor: Colors.blue,
        backgroundColor: Colors.white,
        vpBuyColor: const Color(0x804CAF50),
        vpSellColor: const Color(0x80E91E63),
        vpPocColor: Colors.orange,
        bidColor: const Color(0xFF4CAF50),
        askColor: const Color(0xFFE91E63),
        liquidationColor: Colors.yellow,
      );

  /// Default dark theme for [KChart].
  factory ChartTheme.dark() => ChartTheme(
        gridColor: const Color(0xFF303030),
        bullColor: const Color(0xFF26A69A),
        bearColor: const Color(0xFFEF5350),
        crosshairColor: Colors.grey.shade400,
        axisTextStyle: const TextStyle(fontSize: 10, color: Color(0xFFB0B0B0)),
        crosshairTextStyle: const TextStyle(fontSize: 10, color: Colors.black),
        tradeLineColor: Colors.blueAccent,
        backgroundColor: const Color(0xFF121212),
        vpBuyColor: const Color(0x8026A69A),
        vpSellColor: const Color(0x80EF5350),
        vpPocColor: Colors.orangeAccent,
        bidColor: const Color(0xFF26A69A),
        askColor: const Color(0xFFEF5350),
        liquidationColor: Colors.yellowAccent,
      );
}
