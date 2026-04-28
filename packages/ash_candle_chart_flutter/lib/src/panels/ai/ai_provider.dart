import 'package:ash_candle_chart_core/ash_candle_chart_core.dart';
import 'ai_models.dart';

/// Abstract interface for providing AI annotations and insights.
///
/// Implementations can wrap LLM APIs (OpenAI, Anthropic, etc.) to
/// analyze chart data and return structured insights.
abstract class AiAnnotationProvider {
  /// Analyzes the provided [Series] data and returns a list of insights.
  Future<List<AiInsight>> getInsights(Series data);
}

/// A mock implementation of [AiAnnotationProvider] for testing and demonstration.
class MockAiAnnotationProvider implements AiAnnotationProvider {
  @override
  Future<List<AiInsight>> getInsights(Series data) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    if (data.length < 10) {
      return [];
    }

    // Mock logic: check if the range is generally bullish or bearish
    final firstClose = data.close.first;
    final lastClose = data.close.last;
    final isBullish = lastClose > firstClose;

    if (isBullish) {
      return [
        const AiInsight(
          text:
              'The selected range shows a strong bullish momentum with increasing volume.',
          patternType: 'Bullish Trend',
          severity: InsightSeverity.info,
        ),
        const AiInsight(
          text: 'Potential resistance approaching near the recent high.',
          patternType: 'Resistance',
          severity: InsightSeverity.warning,
        ),
      ];
    } else {
      return [
        const AiInsight(
          text: 'Bearish pressure detected. Prices are making lower highs.',
          patternType: 'Bearish Trend',
          severity: InsightSeverity.danger,
        ),
        const AiInsight(
          text:
              'Volume is decreasing, suggesting exhaustion of the current move.',
          patternType: 'Volume Exhaustion',
          severity: InsightSeverity.info,
        ),
      ];
    }
  }
}
