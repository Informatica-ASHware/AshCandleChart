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
