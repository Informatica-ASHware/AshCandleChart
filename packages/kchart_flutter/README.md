# kchart_flutter

High-performance Flutter UI for KChart.

## Features

- **Vertex-based Rendering**: Uses `drawVertices` for maximum performance.
- **Gesture Arbiter**: Handles complex gestures including inertial movement and snap-to-candle.
- **Theming**: Fully customizable look and feel.
- **i18n**: Built-in support for numeric formatting based on locale.

## Usage

```dart
import 'package:kchart_flutter/kchart_flutter.dart';

KChart(
  controller: myController,
  theme: ChartTheme.dark(),
  locale: 'en_US',
)
```
