## 0.1.0-dev.2

# Changelog

## [0.1.0-dev.1] - 2026-04-27

### Added
- Institutional panels: `VolumeProfilePanel`, `DepthPanel`, and `LiquidationHeatmapPanel`.
- High-performance rendering for Volume Profile using `ui.Vertices`.
- Real-time Order Book visualization with crosshair synchronization.
- Liquidation heatmap visualization using price-level gradients.
- Updated `KChartController` to manage and toggle institutional panels.
- Updated `ChartTheme` with institutional color schemes.
- AI Annotations Plugin Contract: `AiAnnotationProvider`, `AiInsight` models, and `AiInsightsPanel`.
- Range selection support via Shift+Drag gesture.
- Native Accessibility (a11y) support with virtual semantics nodes and keyboard navigation.
- Automatic announcements of candle data for screen readers.
- Support for `MediaQuery.disableAnimations` to respect system preferences.
- Dynamic Y-Axis (Price Scale) and X-Axis (Timeline) rendering with high-performance `LayerCache`.
- Automatic calculation of human-readable price and time intervals.
- Interactive Crosshair with dashed lines and synchronized labels across panels.
- Enhanced coordinate mapping in `KChartController` with robust boundary guards.
