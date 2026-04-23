## [Unreleased]

## 0.1.0-dev.1

- Initial setup of `kchart_core` package.
- US 1.02: Implementation of immutable primitive models (`Candle`, `Viewport`, `ChartFrame`) and columnar `Series` for high-performance data storage.
- US 2.01: Implementation of `IsolatePool` and Zero-Copy Transfer Protocol for high-performance background computations.
- US 2.02: Implementation of Indicator Dependency Graph (DAG) and Batching system.
    - Added `Indicator`, `IndicatorConfig`, and `IndicatorRegistry` for modular indicator management.
    - Added `IndicatorPipeline` with topological sort for dependency resolution.
    - Enhanced `IsolatePool` to support batch execution of indicators, minimizing IPC overhead.
- US 4.01: Implementation of Base Indicator Catalog.
    - Added SMA, EMA, MACD, Bollinger Bands, and RSI indicators.
    - Implemented incremental computation (`computeAppend`) for all built-in indicators.
    - All calculations optimized using `double` and `Float64List`.
    - Added `registerBuiltIns` to `IndicatorRegistry` for easy setup.
- [US 7.02] Implementation of Trade and Position Overlays domain models.
    - Added `TradeMarker` for point events (Time X, Price Y).
    - Added `PositionOverlay` for zone ranges (Entry, SL, TP) with infinite horizontal extension.
