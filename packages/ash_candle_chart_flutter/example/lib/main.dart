// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart' hide Viewport;
import 'package:ash_candle_chart_flutter/ash_candle_chart_flutter.dart';
import 'package:ash_candle_chart_core/ash_candle_chart_core.dart';
import 'package:ash_candle_chart_core/src/indicators/ema.dart';

void main() {
  runApp(const MyApp());
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

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late KChartController controller;

  @override
  void initState() {
    super.initState();

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

    final mainSeries = Series.fromCandles(candles);
    
    // Demonstrate real indicator usage
    final ema20 = EMAIndicator(const EMAConfig(id: 'ema20', period: 20))
        .compute(mainSeries, {});

    controller = KChartController(
      frame: ChartFrame(
        series: mainSeries,
        viewport: Viewport(
            startIdx: 0, endIdx: candles.length - 1, scale: 1.0, scrollX: 0.0),
        indicators: {
          'ema20': Series.fromData(timestamps: mainSeries.timestamps, values: ema20),
        },
        overlays: [],
        sequenceNumber: 0,
        panelSequenceNumbers: {'main': 0, 'volume': 0, 'ema20': 0},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KChart Minimal Example')),
      body: KChart(controller: controller),
    );
  }
}
