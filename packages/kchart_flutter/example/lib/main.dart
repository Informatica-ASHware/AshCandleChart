import 'package:flutter/material.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:kchart_core/kchart_core.dart';

void main() {
  runApp(const MyApp());
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
      initialSeries: Series.fromCandles(candles),
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
