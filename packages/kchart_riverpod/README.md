# KChart Riverpod

Riverpod 3 integration for KChart.

## Features

- **Reactive State Management**: Synchronize chart state across your app with ease.
- **Auto-Pausing**: Optimized stream providers that pause when not in use.
- **Provider-based Architecture**: Clean separation of concerns.

## Quick Start (3 Minutes)

1. **Add dependencies**:
   ```yaml
   dependencies:
     kchart_riverpod: ^0.1.0
   ```

2. **Wrap your app**:
   ```dart
   void main() {
     runApp(const ProviderScope(child: MyApp()));
   }
   ```

3. **Use providers**:
   ```dart
   final controller = ref.watch(kchartControllerProvider(myInitialFrame));
   KChart(controller: controller)
   ```

## Example

Check out the [example directory](./example) for a basic implementation.
