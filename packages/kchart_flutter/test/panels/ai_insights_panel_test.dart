import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:kchart_flutter/src/panels/ai/ai_insights_panel.dart';
import 'package:kchart_flutter/src/panels/ai/ai_models.dart';
import 'package:kchart_flutter/src/panels/ai/ai_provider.dart';
import 'package:kchart_flutter/src/widgets/kchart_scope.dart';

void main() {
  late KChartController controller;
  late Series series;

  setUp(() {
    series = Series.fromCandles(List.generate(
      20,
      (i) => Candle(
        timestamp: i * 1000,
        open: 100,
        high: 110,
        low: 90,
        close: 105,
        volume: 100,
      ),
    ));

    controller = KChartController(
      frame: ChartFrame(
        series: series,
        indicators: {},
        viewport: const Viewport(
          startIdx: 0,
          endIdx: 19,
          scale: 1.0,
          scrollX: 0.0,
        ),
        overlays: [],
        sequenceNumber: 1,
        panelSequenceNumbers: {'main': 1},
      ),
    );
  });

  testWidgets('AiInsightsPanel shows nothing when no selection', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: KChartScope(
          chartKey: GlobalKey(),
          theme: ChartTheme.dark(),
          formatters: ChartNumberFormatters('en_US'),
          child: Scaffold(
            body: AiInsightsPanel(controller: controller),
          ),
        ),
      ),
    );

    expect(find.text('AI INSIGHTS'), findsNothing);
  });

  testWidgets('AiInsightsPanel shows loading state', (tester) async {
    controller.aiProvider = MockAiAnnotationProvider();

    // Trigger selection (async)
    controller.setSelection(0, 5000);

    await tester.pumpWidget(
      MaterialApp(
        home: KChartScope(
          chartKey: GlobalKey(),
          theme: ChartTheme.dark(),
          formatters: ChartNumberFormatters('en_US'),
          child: Scaffold(
            body: AiInsightsPanel(controller: controller),
          ),
        ),
      ),
    );

    // Wait for debounce timer (300ms)
    await tester.pump(const Duration(milliseconds: 301));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for mock provider delay (800ms)
    await tester.pumpAndSettle();
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text('AI INSIGHTS'), findsOneWidget);
  });

  testWidgets('AiInsightsPanel shows insights from provider', (tester) async {
    final mockProvider = _ManualMockProvider([
      const AiInsight(
        text: 'Pattern detected',
        patternType: 'Test Pattern',
        severity: InsightSeverity.danger,
      ),
    ]);
    controller.aiProvider = mockProvider;

    controller.setSelection(0, 15000);

    await tester.pumpWidget(
      MaterialApp(
        home: KChartScope(
          chartKey: GlobalKey(),
          theme: ChartTheme.dark(),
          formatters: ChartNumberFormatters('en_US'),
          child: Scaffold(
            body: AiInsightsPanel(controller: controller),
          ),
        ),
      ),
    );

    // Wait for debounce timer (300ms)
    await tester.pump(const Duration(milliseconds: 301));
    await tester.pumpAndSettle();

    expect(find.text('PATTERN DETECTED'), findsNothing); // It's upper-cased in UI
    expect(find.text('TEST PATTERN'), findsOneWidget);
    expect(find.text('Pattern detected'), findsOneWidget);
  });
}

class _ManualMockProvider implements AiAnnotationProvider {
  final List<AiInsight> results;
  _ManualMockProvider(this.results);

  @override
  Future<List<AiInsight>> getInsights(Series data) async {
    return results;
  }
}
