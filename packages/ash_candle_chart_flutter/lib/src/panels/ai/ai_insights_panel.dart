import 'package:flutter/material.dart';
import '../../controller.dart';
import '../../widgets/kchart_scope.dart';
import 'ai_models.dart';

/// A panel that displays AI insights for the current selection.
class AiInsightsPanel extends StatelessWidget {
  /// The controller providing data and selection state.
  final KChartController controller;

  /// Creates an [AiInsightsPanel] with the given [controller].
  const AiInsightsPanel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final selection = controller.selectionRange;
        if (selection == null) return const SizedBox.shrink();

        final theme = KChartScope.of(context)?.theme;
        final backgroundColor = theme?.backgroundColor ?? Colors.black;
        final textColor = theme?.crosshairColor ?? Colors.white;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: backgroundColor.withOpacity(0.9),
            border: Border(
              top: BorderSide(
                // ignore: deprecated_member_use
                color: theme?.gridColor ?? Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'AI INSIGHTS',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1.2,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, size: 16, color: textColor),
                    tooltip: 'Cerrar AI Insights',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: controller.clearSelection,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ValueListenableBuilder<bool>(
                valueListenable: controller.isInsightsLoading,
                builder: (context, isLoading, child) {
                  if (isLoading) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation(textColor),
                        ),
                      ),
                    );
                  }
                  return ValueListenableBuilder<List<AiInsight>>(
                    valueListenable: controller.insights,
                    builder: (context, insights, child) {
                      if (insights.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Select at least 10 candles for AI analysis.',
                            style: TextStyle(
                              // ignore: deprecated_member_use
                              color: textColor.withOpacity(0.6),
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                            ),
                          ),
                        );
                      }

                      return Column(
                        children: insights
                            .map((insight) => _InsightTile(
                                  insight: insight,
                                  textColor: textColor,
                                ))
                            .toList(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _InsightTile extends StatelessWidget {
  final AiInsight insight;
  final Color textColor;

  const _InsightTile({required this.insight, required this.textColor});

  @override
  Widget build(BuildContext context) {
    final Color severityColor = switch (insight.severity) {
      InsightSeverity.info => Colors.blue,
      InsightSeverity.warning => Colors.orange,
      InsightSeverity.danger => Colors.red,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Semantics(
        container: true,
        label: 'Insight: ${insight.patternType}. ${insight.text}',
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExcludeSemantics(
              child: Container(
                margin: const EdgeInsets.only(top: 4, right: 8),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: severityColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    insight.patternType.toUpperCase(),
                    style: TextStyle(
                      color: severityColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    insight.text,
                    style: TextStyle(
                      // ignore: deprecated_member_use
                      color: textColor.withOpacity(0.9),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
