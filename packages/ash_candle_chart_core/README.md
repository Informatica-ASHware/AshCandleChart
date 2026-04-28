# Ash Candle Chart Core

Core logic, data structures, and compute engine for Ash Candle Chart.

## Features

- **Columnar Storage**: Optimized `Series` using `Float64List` and `Int64List` for high performance.
- **Multithreading**: `IsolatePool` for offloading heavy computations.
- **Indicator Engine**: Flexible DAG-based indicator pipeline with topological sorting.
- **Incremental Updates**: Support for `computeAppend` to handle real-time data efficiently.

## Getting Started

```dart
import 'package:ash_candle_chart_core/ash_candle_chart_core.dart';

final candles = [
  Candle(timestamp: 1600000000000, open: 100, high: 110, low: 90, close: 105, volume: 1000),
];
final series = Series.fromCandles(candles);
```

## Documentation

See the [API Reference](https://pub.dev/documentation/ash_candle_chart_core/latest/) for detailed documentation.
