# kchart_core

Core logic and compute engine for KChart.

## Features

- **Columnar Data Storage**: Optimized memory layout using `Float64List` and `Int64List`.
- **Isolate Pool**: Zero-copy memory transfers for heavy calculations.
- **Indicator Pipeline**: Topological dependency resolution for technical indicators.
- **Immutable Models**: Powered by `freezed`.

## Usage

```dart
import 'package:kchart_core/kchart_core.dart';

final series = Series(
  timestamps: Int64List.fromList([...]),
  open: Float64List.fromList([...]),
  high: Float64List.fromList([...]),
  low: Float64List.fromList([...]),
  close: Float64List.fromList([...]),
  volume: Float64List.fromList([...]),
);
```
