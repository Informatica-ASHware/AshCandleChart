import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kchart_riverpod/kchart_riverpod.dart';
import 'package:kchart_core/kchart_core.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const ChartScreen(),
    );
  }
}

class ChartScreen extends ConsumerWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Usually you would initialize data in a real provider
    final candles = List.generate(100, (i) {
      return Candle(
        timestamp: 1600000000000 + (i * 60000),
        open: 100.0 + i,
        high: 105.0 + i,
        low: 95.0 + i,
        close: 102.0 + i,
        volume: 1000.0,
      );
    });

    final controller = ref.watch(kchartControllerProvider(
      initialSeries: Series.fromCandles(candles),
    ));

    return Scaffold(
      appBar: AppBar(title: const Text('KChart Riverpod Example')),
      body: KChart(controller: controller),
    );
  }
}
