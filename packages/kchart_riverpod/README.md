# kchart_riverpod

Riverpod 3 integration for KChart.

## Features

- **Reactive State**: Seamlessly bind `KChartController` to Riverpod providers.
- **Lifecycle Management**: Automatic disposal and resource optimization.

## Usage

```dart
import 'package:kchart_riverpod/kchart_riverpod.dart';

final chartProvider = kchartControllerProvider(initialSeries);

// In your Widget
final controller = ref.watch(chartProvider);
KChart(controller: controller);
```
