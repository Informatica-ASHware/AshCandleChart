# Ash Candle Chart State

Riverpod 3 integration for Ash Candle Chart.

## Features

- **Reactive State Management**: Synchronize chart state across your app with ease.
- **Auto-Pausing**: Optimized stream providers that pause when not in use.
- **Provider-based Architecture**: Clean separation of concerns.

## Quick Start (3 Minutes)

1. **Add dependencies**:
   ```yaml
   dependencies:
     ash_candle_chart_state: ^0.1.0-dev.1
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
