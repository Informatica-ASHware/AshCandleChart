// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ash_candle_chart_state/ash_candle_chart_state.dart';
import 'package:ash_candle_chart_core/src/indicators/bollinger_bands.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ChartScreen(),
    );
  }
}

class ChartScreen extends ConsumerWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final candles = List.generate(100, (i) {
      final basePrice = 100.0 + i;
      return Candle(
        timestamp: 1600000000000 + (i * 60000),
        open: basePrice,
        high: basePrice + 5,
        low: basePrice - 5,
        close: basePrice + 2,
        volume: 1000.0,
      );
    });

    final series = Series.fromCandles(candles);
    
    // Add Bollinger Bands to demonstrate state-managed indicator logic
    final bb = BollingerBandsIndicator(const BollingerBandsConfig(id: 'bb', period: 20, stdDev: 2.0))
        .compute(series, {});

    final controller = ref.watch(kchartControllerProvider(
      ChartFrame(
        series: series,
        viewport: Viewport(
            startIdx: 0, endIdx: candles.length - 1, scale: 1.0, scrollX: 0.0),
        indicators: {
          'bb_upper': Series.fromData(timestamps: series.timestamps, values: bb.upper),
          'bb_lower': Series.fromData(timestamps: series.timestamps, values: bb.lower),
        },
        overlays: [],
        sequenceNumber: 0,
        panelSequenceNumbers: {'main': 0, 'volume': 0, 'bb_upper': 0, 'bb_lower': 0},
      ),
    ));

    return Scaffold(
      appBar: AppBar(title: const Text('State Managed Chart Example')),
      body: KChart(controller: controller),
    );
  }
}
