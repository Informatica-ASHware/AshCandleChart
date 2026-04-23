// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart' hide Viewport;
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:kchart_core/kchart_core.dart';

/// Example application class.
void main() {
  runApp(const MyApp());
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
class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

/// Example application class.
class _ChartScreenState extends State<ChartScreen> {
  late KChartController controller;

  @override
  void initState() {
    super.initState();

    // Generate some mock data
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

    controller = KChartController(
      frame: ChartFrame(
        series: Series.fromCandles(candles),
        viewport: Viewport(
            startIdx: 0, endIdx: candles.length - 1, scale: 1.0, scrollX: 0.0),
        indicators: {},
        overlays: [],
        sequenceNumber: 0,
        panelSequenceNumbers: {'main': 0, 'volume': 0},
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
