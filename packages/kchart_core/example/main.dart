import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_core/src/indicators/indicator_registry.dart';
import 'package:kchart_core/src/indicators/sma.dart';

void main() async {
  // 1. Setup Data
  final candles = [
    Candle(timestamp: 1600000000000, open: 100, high: 110, low: 90, close: 105, volume: 1000),
    Candle(timestamp: 1600000060000, open: 105, high: 115, low: 100, close: 110, volume: 1200),
  ];
  final series = Series.fromCandles(candles);

  // 2. Initialize IsolatePool
  final pool = IsolatePool(workerCount: 1);

  // Use a top-level or static function for registry provider
  await pool.initialize(_dummyHandler, registryProvider: _createRegistry);

  // 3. Compute Indicators in background
  final configs = [
    const SMAConfig(id: 'sma20', period: 20),
  ];

  final results = await pool.computeIndicatorBatch(configs, series);
  print('Computed SMA: ${results['sma20']}');

  await pool.dispose();
}

Future<Object?> _dummyHandler(String method, Object? payload) async => null;

IndicatorRegistry _createRegistry() {
  final registry = IndicatorRegistry();
  registry.registerBuiltIns();
  return registry;
}
