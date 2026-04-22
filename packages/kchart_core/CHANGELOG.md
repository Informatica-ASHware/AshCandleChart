## [Unreleased]

- Initial setup of `kchart_core` package.
- US 1.02: Implementation of immutable primitive models (`Candle`, `Viewport`, `ChartFrame`) and columnar `Series` for high-performance data storage.
- US 2.01: Implementation of `IsolatePool` and Zero-Copy Transfer Protocol for high-performance background computations.
- US 2.02: Implementation of Indicator Dependency Graph (DAG) and Batching system.
    - Added `Indicator`, `IndicatorConfig`, and `IndicatorRegistry` for modular indicator management.
    - Added `IndicatorPipeline` with topological sort for dependency resolution.
    - Enhanced `IsolatePool` to support batch execution of indicators, minimizing IPC overhead.
