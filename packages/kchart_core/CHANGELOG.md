# Changelog

## [Unreleased]

### Added
- Property-based testing for `Viewport` invariants using `glados`.
- Binary serialization and reconstruction for `Series` and `ChartFrame` for improved resilience.
- Fuzz testing for binary reconstructors with 1000+ random iterations.
- `Viewport.normalize` method to ensure indices remain within valid bounds.

## [0.1.0-dev.1] - 2026-04-23

### Added
- Institutional data models: `VolumeProfile`, `OrderBook`, and `LiquidationArea`.
- `VolumeProfileCalculator` extension to calculate volume profile from price series.
- Updated `ChartFrame` to support institutional data.
- `Series.slice` method to extract sub-ranges of data.
