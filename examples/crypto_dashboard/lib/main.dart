// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ash_candle_chart_state/ash_candle_chart_state.dart';
// import 'package:ash_candle_chart_core/src/indicators/sma.dart';
// import 'package:ash_candle_chart_core/src/indicators/rsi.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final csvDataProvider = FutureProvider<List<Candle>>((ref) async {
  // Asegúrate de tener el archivo CSV registrado en tu pubspec.yaml
  // final csvString = await rootBundle.loadString('assets/CME_MINI_DL_ES1!, 1_d2151.csv');
  final csvString = await rootBundle.loadString('assets/CME_MINI_DL_ES1!, 1_d2151.csv');
  final lines = csvString.split('\n');
  final candles = <Candle>[];

  // Asumiendo que tiene cabecera y el orden es: timestamp/date, open, high, low, close, volume
  for (var i = 1; i < lines.length; i++) {
    final line = lines[i].trim();
    if (line.isEmpty) continue;

    final parts = line.split(',');
    candles.add(Candle(
      timestamp: int.tryParse(parts[0]) ?? DateTime.parse(parts[0]).millisecondsSinceEpoch,
      open: double.parse(parts[1]),
      high: double.parse(parts[2]),
      low: double.parse(parts[3]),
      close: double.parse(parts[4]),
      volume: double.parse(parts[5]),
    ));
  }
  debugPrint('Candles: ${candles.length}');
  return candles;
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Dashboard',
      theme: ThemeData.dark(useMaterial3: true),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final csvData = ref.watch(csvDataProvider);

    return csvData.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Error al cargar CSV: $err'))),
      data: (candles) {
        if (candles.isEmpty) return const Scaffold(body: Center(child: Text('CSV vacío')));

        final series = Series.fromCandles(candles);

        final startIdx = series.length > 100 ? series.length - 100 : 0;
        final endIdx = series.length - 1;

        final controller = ref.watch(kchartControllerProvider(
          ChartFrame(
            series: series,
            viewport: Viewport(startIdx: startIdx, endIdx: endIdx, scale: 1.0, scrollX: 0.0),
            indicators: {},
            overlays: [],
            sequenceNumber: 0,
            panelSequenceNumbers: {'main': 0, 'volume': 0},
          ),
        ));

        return Scaffold(
          appBar: AppBar(
            title: const Text('KChart Crypto Dashboard'),
            actions: [
              IconButton(icon: const Icon(Icons.add_chart), onPressed: () {}),
              IconButton(icon: const Icon(Icons.analytics), onPressed: () {}),
              IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
            ],
          ),
          body: KChart(controller: controller),
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   // Mock data generation
  //   final candles = List.generate(1000, (i) {
  //     final basePrice = 50000.0 + (i * 10.0);
  //     return Candle(
  //       timestamp: 1600000000000 + (i * 60000),
  //       open: basePrice,
  //       high: basePrice + 100,
  //       low: basePrice - 100,
  //       close: basePrice + 50,
  //       volume: 1000.0 + (i % 100),
  //     );
  //   });
  //
  //   final series = Series.fromCandles(candles);
  //
  //   final controller = ref.watch(kchartControllerProvider(
  //     ChartFrame(
  //       series: series,
  //       viewport: Viewport(startIdx: series.length - 100, endIdx: series.length - 1, scale: 1.0, scrollX: 0.0),
  //       indicators: {},
  //       overlays: [],
  //       sequenceNumber: 0,
  //       panelSequenceNumbers: {'main': 0, 'volume': 0},
  //     ),
  //   ));
  //
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('KChart Crypto Dashboard'),
  //       actions: [
  //         IconButton(
  //           icon: const Icon(Icons.add_chart),
  //           onPressed: () {
  //             // controller.addIndicator(const SMAConfig(id: 'sma20', period: 20));
  //             // controller.addIndicator(const SMAConfig(id: 'sma50', period: 50));
  //           },
  //         ),
  //         IconButton(
  //           icon: const Icon(Icons.analytics),
  //           onPressed: () {
  //              // controller.addSecondaryPanel('rsi', const RSIConfig(id: 'rsi14', period: 14));
  //           },
  //         ),
  //         IconButton(
  //           icon: const Icon(Icons.shopping_cart),
  //           onPressed: () {
  //             // controller.addTradeOverlay(TradeOverlay.position(
  //             //   id: 'long_pos',
  //             //   entryPrice: 55000,
  //             //   stopLoss: 54000,
  //             //   takeProfit: 58000,
  //             // ));
  //           },
  //         ),
  //       ],
  //     ),
  //     body: KChart(controller: controller),
  //   );
  // }
}
