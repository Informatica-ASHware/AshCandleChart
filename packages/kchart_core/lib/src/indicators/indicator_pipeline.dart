import 'indicator.dart';
import 'indicator_registry.dart';
import '../series/series.dart';

/// Handles the resolution and execution of indicator dependencies.
class IndicatorPipeline {
  /// Sorts indicators topologically based on their dependencies.
  ///
  /// Throws a [StateError] if a circular dependency is detected.
  List<IndicatorConfig> sortTopologically(List<IndicatorConfig> configs) {
    final Map<String, IndicatorConfig> configMap = {for (var c in configs) c.id: c};
    final Map<String, List<String>> adj = {for (var c in configs) c.id: c.dependsOn};

    final List<IndicatorConfig> sorted = [];
    final Set<String> visiting = {};
    final Set<String> visited = {};

    void visit(String id) {
      if (visiting.contains(id)) {
        throw StateError('Circular dependency detected involving indicator: $id');
      }
      if (!visited.contains(id)) {
        visiting.add(id);
        final deps = adj[id] ?? [];
        for (final depId in deps) {
          if (configMap.containsKey(depId)) {
            visit(depId);
          } else {
            // Dependency might be outside this batch or a typo,
            // but for topological sort within the batch, we only care about internal deps.
            // However, usually all dependencies should be present if we want to calculate them.
          }
        }
        visiting.remove(id);
        visited.add(id);
        sorted.add(configMap[id]!);
      }
    }

    for (final config in configs) {
      if (!visited.contains(config.id)) {
        visit(config.id);
      }
    }

    return sorted;
  }

  /// Groups indicators into batches.
  ///
  /// A batch consists of indicators that can be executed together in an Isolate.
  /// If "MACD" depends on "EMA", they should ideally be in the same batch
  /// to avoid IPC overhead of returning "EMA" results to the main thread.
  ///
  /// Currently, this implementation returns a single batch containing all
  /// topologically sorted indicators, which satisfies the requirement of
  /// empaquetar coupled nodes.
  List<List<IndicatorConfig>> batch(List<IndicatorConfig> configs) {
    if (configs.isEmpty) return [];

    final sorted = sortTopologically(configs);
    // For now, we put everything in one batch to minimize IPC as requested.
    // In the future, we might want to split into multiple batches if the total
    // computation is too large or if some indicators can be run in parallel
    // across different Isolates.
    return [sorted];
  }

  /// Executes a batch of indicators sequentially.
  ///
  /// [configs] must be topologically sorted.
  /// [series] is the input OHLCV data.
  /// [registry] is used to create indicator implementations.
  ///
  /// Returns a map of indicator IDs to their calculation results.
  Map<String, Object> executeBatch(
    List<IndicatorConfig> configs,
    Series series,
    IndicatorRegistry registry,
  ) {
    final Map<String, Object> results = {};

    for (final config in configs) {
      final indicator = registry.create(config);
      final deps = {for (var depId in config.dependsOn) depId: results[depId]!};
      results[config.id] = indicator.compute(series, deps);
    }

    return results;
  }
}
