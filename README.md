# KChart Workspace

A high-performance financial charting library for Flutter, optimized for Desktop and Mobile.

## Packages

- [kchart_core](./packages/kchart_core): Core logic, data structures, and compute engine.
- [kchart_flutter](./packages/kchart_flutter): Flutter implementation and UI components.
- [kchart_riverpod](./packages/kchart_riverpod): Riverpod 3 integration for KChart.

## Status

[![CI](https://github.com/Informatica-ASHware/KChart2/actions/workflows/ci.yml/badge.svg)](https://github.com/Informatica-ASHware/KChart2/actions/workflows/ci.yml)

## Quick Start (3 Minutes)

1. **Add dependencies**:
   ```yaml
   dependencies:
     kchart_flutter: ^0.1.0
     kchart_core: ^0.1.0
   ```

2. **Initialize Controller**:
   ```dart
   final controller = KChartController(
     frame: ChartFrame(
       series: mySeries,
       viewport: Viewport(startIdx: 0, endIdx: 100, scale: 1.0, scrollX: 0.0),
       indicators: {},
       overlays: [],
       sequenceNumber: 0,
       panelSequenceNumbers: {'main': 0, 'volume': 0},
     ),
   );
   ```

3. **Display Chart**:
   ```dart
   KChart(controller: controller)
   ```

## Key Features

- **High Performance**: Renders 100k+ candles at 60fps using `canvas.drawVertices`.
- **Multithreading**: Offloads heavy indicator calculations to a pool of Isolates.
- **Interactive**: Smooth zooming, panning, and inertial scrolling with Snap-to-Candle logic.
- **Customizable**: Flexible theme system and modular panel architecture.
- **Advanced Overlays**: Support for trades, positions, and custom drawings.

## Screenshots / GIFs

![KChart Demo](https://raw.githubusercontent.com/Informatica-ASHware/KChart2/main/docs/assets/demo.gif)

## Examples

- [Minimal Flutter Example](./packages/kchart_flutter/example)
- [Crypto Dashboard (Complex)](./examples/crypto_dashboard) - Shows multi-chart setup, indicators, and trade overlays.

## Development

This project uses [Melos](https://melos.invertase.dev/) to manage the monorepo.

```bash
dart pub get
dart run melos bootstrap
dart run melos run test
```
