// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:kchart_riverpod/kchart_riverpod.dart';
import 'package:kchart_core/src/indicators/sma.dart';
import 'package:kchart_core/src/indicators/rsi.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

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
    // Mock data generation
    final candles = List.generate(1000, (i) {
      final basePrice = 50000.0 + (i * 10.0);
      return Candle(
        timestamp: 1600000000000 + (i * 60000),
        open: basePrice,
        high: basePrice + 100,
        low: basePrice - 100,
        close: basePrice + 50,
        volume: 1000.0 + (i % 100),
      );
    });

    final series = Series.fromCandles(candles);

    final controller = ref.watch(kchartControllerProvider(
      ChartFrame(
        series: series,
        viewport: Viewport(startIdx: series.length - 100, endIdx: series.length - 1, scale: 1.0, scrollX: 0.0),
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
          IconButton(
            icon: const Icon(Icons.add_chart),
            onPressed: () {
              controller.addIndicator(const SMAConfig(id: 'sma20', period: 20));
              controller.addIndicator(const SMAConfig(id: 'sma50', period: 50));
            },
          ),
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: () {
               controller.addSecondaryPanel('rsi', const RSIConfig(id: 'rsi14', period: 14));
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              controller.addTradeOverlay(TradeOverlay.position(
                id: 'long_pos',
                entryPrice: 55000,
                stopLoss: 54000,
                takeProfit: 58000,
              ));
            },
          ),
        ],
      ),
      body: KChart(controller: controller),
    );
  }
}
