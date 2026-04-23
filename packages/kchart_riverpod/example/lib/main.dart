// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kchart_riverpod/kchart_riverpod.dart';

/// Example application class.
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// Example application class.
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

/// Example application class.
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
      ChartFrame(
        series: Series.fromCandles(candles),
        viewport: Viewport(
            startIdx: 0, endIdx: candles.length - 1, scale: 1.0, scrollX: 0.0),
        indicators: {},
        overlays: [],
        sequenceNumber: 0,
        panelSequenceNumbers: {'main': 0, 'volume': 0},
      ),
    ));

    return Scaffold(
      appBar: AppBar(title: const Text('KChart Riverpod Example')),
      body: KChart(controller: controller),
    );
  }
}
