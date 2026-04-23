# KChart Workspace

A high-performance financial charting library for Flutter, optimized for Desktop and Mobile.

## Packages

- [kchart_core](./packages/kchart_core): Core logic, data structures, and compute engine.
- [kchart_flutter](./packages/kchart_flutter): Flutter implementation and UI components.
- [kchart_riverpod](./packages/kchart_riverpod): Riverpod 3 integration for KChart.

## Status

[![CI](https://github.com/your-repo/kchart/actions/workflows/ci.yml/badge.svg)](https://github.com/your-repo/kchart/actions/workflows/ci.yml)

## Quick Start (3 Minutes)

1. **Add dependencies**:
   ```yaml
   dependencies:
     kchart_flutter: ^0.1.0
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

## Key Features

- **High Performance**: Renders 100k+ candles at 60fps using `canvas.drawVertices`.
- **Multithreading**: Offloads heavy indicator calculations to a pool of Isolates.
- **Interactive**: Smooth zooming, panning, and inertial scrolling.
- **Customizable**: Flexible theme system and modular panel architecture.

## Screenshots / GIFs

![KChart Demo](https://raw.githubusercontent.com/your-repo/kchart/main/docs/assets/demo.gif)

## Development

This project uses [Melos](https://melos.invertase.dev/) to manage the monorepo.

```bash
dart pub get
dart run melos bootstrap
```
