// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ash_candle_chart_state/ash_candle_chart_state.dart';
import 'package:ash_candle_chart_core/src/indicators/sma.dart';
import 'package:ash_candle_chart_core/src/indicators/rsi.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// Provider that loads candle data from a CSV asset.
final csvDataProvider = FutureProvider<List<Candle>>((ref) async {
  final csvString = await rootBundle.loadString('assets/CME_MINI_DL_ES1!, 1_d2151.csv');
  final lines = csvString.split('\n');
  final candles = <Candle>[];

  // CSV format: timestamp/date, open, high, low, close, volume
  for (var i = 1; i < lines.length; i++) {
    final line = lines[i].trim();
    if (line.isEmpty) continue;

    final parts = line.split(',');
    try {
      candles.add(Candle(
        timestamp: int.tryParse(parts[0]) ?? DateTime.parse(parts[0]).millisecondsSinceEpoch,
        open: double.parse(parts[1]),
        high: double.parse(parts[2]),
        low: double.parse(parts[3]),
        close: double.parse(parts[4]),
        volume: double.parse(parts[5]),
      ));
    } catch (e) {
      // Skip malformed lines
    }
  }
  return candles;
});

/// Notifier to manage active indicators in the dashboard.
class IndicatorState extends Notifier<Set<String>> {
  @override
  Set<String> build() => {};

  void toggle(String id) {
    if (state.contains(id)) {
      state = {...state}..remove(id);
    } else {
      state = {...state}..add(id);
    }
  }
}

final activeIndicatorsProvider =
    NotifierProvider<IndicatorState, Set<String>>(IndicatorState.new);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Dashboard',
      debugShowCheckedModeBanner: false,
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
    final activeIndicators = ref.watch(activeIndicatorsProvider);

    return csvData.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Error loading CSV: $err'))),
      data: (candles) {
        if (candles.isEmpty) return const Scaffold(body: Center(child: Text('Empty CSV')));

        final series = Series.fromCandles(candles);
        
        // Calculate real indicators based on active state
        final indicators = <String, Series>{};
        if (activeIndicators.contains('sma20')) {
          final values = SMAIndicator(const SMAConfig(id: 'sma20', period: 20))
              .compute(series, {});
          indicators['sma20'] = Series.fromData(
            timestamps: series.timestamps,
            values: values,
          );
        }
        if (activeIndicators.contains('sma50')) {
          final values = SMAIndicator(const SMAConfig(id: 'sma50', period: 50))
              .compute(series, {});
          indicators['sma50'] = Series.fromData(
            timestamps: series.timestamps,
            values: values,
          );
        }
        if (activeIndicators.contains('rsi14')) {
          final values = RSIIndicator(const RSIConfig(id: 'rsi14', period: 14))
              .compute(series, {});
          indicators['rsi14'] = Series.fromData(
            timestamps: series.timestamps,
            values: values,
          );
        }

        final startIdx = series.length > 100 ? series.length - 100 : 0;
        final endIdx = series.length - 1;

        final controller = ref.watch(kchartControllerProvider(
          ChartFrame(
            series: series,
            viewport: Viewport(startIdx: startIdx, endIdx: endIdx, scale: 1.0, scrollX: 0.0),
            indicators: indicators,
            overlays: [],
            sequenceNumber: 0,
            panelSequenceNumbers: {
              'main': 0, 
              'volume': 0,
              ...Map.fromEntries(indicators.keys.map((k) => MapEntry(k, 0))),
            },
          ),
        ));

        // Sync controller frame if indicators changed
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (controller.frame.indicators.length != indicators.length) {
            controller.frame = controller.frame.copyWith(
              indicators: indicators,
              panelSequenceNumbers: {
                ...controller.frame.panelSequenceNumbers,
                ...Map.fromEntries(indicators.keys.map((k) => MapEntry(k, 0))),
              },
            );
          }
        });

        return Scaffold(
          appBar: AppBar(
            title: const Text('ASHware Crypto Dashboard'),
            actions: [
              _IndicatorButton(
                label: 'SMA 20',
                active: activeIndicators.contains('sma20'),
                onPressed: () => ref.read(activeIndicatorsProvider.notifier).toggle('sma20'),
              ),
              _IndicatorButton(
                label: 'SMA 50',
                active: activeIndicators.contains('sma50'),
                onPressed: () => ref.read(activeIndicatorsProvider.notifier).toggle('sma50'),
              ),
              _IndicatorButton(
                label: 'RSI 14',
                active: activeIndicators.contains('rsi14'),
                onPressed: () => ref.read(activeIndicatorsProvider.notifier).toggle('rsi14'),
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: KChart(controller: controller),
        );
      },
    );
  }
}

class _IndicatorButton extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onPressed;

  const _IndicatorButton({
    required this.label,
    required this.active,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        label: Text(label),
        selected: active,
        onSelected: (_) => onPressed(),
        selectedColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}
