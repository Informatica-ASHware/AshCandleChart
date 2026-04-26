# Changelog

## [0.1.0-dev.1] - 2024-05-20

### Added
- Institutional panels: `VolumeProfilePanel`, `DepthPanel`, and `LiquidationHeatmapPanel`.
- High-performance rendering for Volume Profile using `ui.Vertices`.
- Real-time Order Book visualization with crosshair synchronization.
- Liquidation heatmap visualization using price-level gradients.
- Updated `KChartController` to manage and toggle institutional panels.
- Updated `ChartTheme` with institutional color schemes.
- AI Annotations Plugin Contract: `AiAnnotationProvider`, `AiInsight` models, and `AiInsightsPanel`.
- Range selection support via Shift+Drag gesture.

## [0.1.0-dev.2] - 2024-05-21

### Added
- Native Accessibility (a11y) support:
    - Virtual semantics nodes for chart candles allowing screen reader navigation.
    - Automatic announcements of candle data ("Date, Open, Close, Trend") on focus/tap.
    - Keyboard navigation support (Arrow keys) for precise crosshair movement.
- Support for `MediaQuery.disableAnimations` to respect system-level animation preferences.
- Enhanced accessibility for UI controls including draggable dividers and AI panels.

## [0.1.0-dev.3] - 2024-05-22

### Added
- Dynamic Y-Axis (Price Scale) rendering in the main panel.
- Automatic calculation of human-readable price intervals (ticks).
- Horizontal grid lines aligned with price labels.
- Synchronized Y-axis margin across all chart components (candles, grid, annotations, and crosshair).
- Updated `ChartTheme` with `yAxisWidth` configuration.

## [0.1.0-dev.4] - 2024-05-23

### Added
- X-Axis (Timeline) rendering at the bottom of the chart.
- Dynamic time labels ("HH:mm" or "dd/MM") distributed equitably across the visible range.
- High-performance timeline rendering with `LayerCache`.
- Updated `ChartTheme` with `xAxisHeight` configuration.

## [0.1.0-dev.5] - 2024-05-24

### Added
- Interactive Crosshair with dashed vertical and horizontal lines.
- Real-time X-axis and Y-axis labels highlighting values under the cursor.
- Multi-panel crosshair support: Y-axis label automatically adapts to Price, Volume, or Indicator values depending on the active panel.
- Enhanced coordinate mapping in `KChartController` with robust boundary guards.
