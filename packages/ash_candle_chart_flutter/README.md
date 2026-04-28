# Ash Candle Chart Flutter

High-performance financial charting library for Flutter.

## Features

- **60 FPS Rendering**: Uses `canvas.drawVertices` for ultra-fast candle rendering.
- **Interactive**: Smooth pan, zoom, and inertial scrolling.
- **Customizable**: Comprehensive theming and i18n support.
- **Trade Overlays**: Built-in support for displaying trades and positions.

## Quick Start (3 Minutes)

1. **Add dependencies**:
   ```yaml
   dependencies:
     ash_candle_chart_flutter: ^0.1.0-dev.1
   ```

2. **Initialize Controller**:
   ```dart
   final controller = KChartController(
     initialSeries: mySeries,
   );
   ```

3. **Display Chart**:
   ```dart
   KChart(controller: controller)
   ```

## Example

Check out the [example directory](./example) for a minimal setup or the [crypto dashboard](../../examples/crypto_dashboard) for a complex use case.
