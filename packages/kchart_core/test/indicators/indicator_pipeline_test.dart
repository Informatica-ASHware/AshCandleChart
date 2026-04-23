import 'package:test/test.dart';
import 'package:kchart_core/src/indicators/indicator.dart';
import 'package:kchart_core/src/indicators/indicator_pipeline.dart';
import 'package:kchart_core/src/indicators/indicator_registry.dart';
import 'package:kchart_core/src/series/series.dart';
import 'dart:typed_data';

class MockConfig implements IndicatorConfig {
  @override
  final String id;
  @override
  final List<String> dependsOn;

  MockConfig(this.id, [this.dependsOn = const []]);
}

class MockIndicator extends Indicator<MockConfig> {
  MockIndicator(super.config);

  @override
  Object compute(Series input, Map<String, Object> dependencies) {
    return Float64List(input.length);
  }

  @override
  Object computeAppend(Series input, Map<String, Object> dependencies, Object previousResults) {
    return Float64List(input.length);
  }
}

void main() {
  group('IndicatorPipeline', () {
    final pipeline = IndicatorPipeline();

    test('sortTopologically handles simple dependencies', () {
      final ema = MockConfig('EMA');
      final macd = MockConfig('MACD', ['EMA']);

      final sorted = pipeline.sortTopologically([macd, ema]);

      expect(sorted.map((c) => c.id).toList(), ['EMA', 'MACD']);
    });

    test('sortTopologically handles complex dependencies', () {
      final a = MockConfig('A');
      final b = MockConfig('B', ['A']);
      final c = MockConfig('C', ['A']);
      final d = MockConfig('D', ['B', 'C']);

      final sorted = pipeline.sortTopologically([d, c, b, a]);

      final ids = sorted.map((conf) => conf.id).toList();
      expect(ids.indexOf('A'), lessThan(ids.indexOf('B')));
      expect(ids.indexOf('A'), lessThan(ids.indexOf('C')));
      expect(ids.indexOf('B'), lessThan(ids.indexOf('D')));
      expect(ids.indexOf('C'), lessThan(ids.indexOf('D')));
    });

    test('sortTopologically throws on circular dependency', () {
      final a = MockConfig('A', ['B']);
      final b = MockConfig('B', ['A']);

      expect(() => pipeline.sortTopologically([a, b]), throwsStateError);
    });

    test('batch groups indicators together', () {
      final ema = MockConfig('EMA');
      final macd = MockConfig('MACD', ['EMA']);

      final batches = pipeline.batch([macd, ema]);

      expect(batches.length, 1);
      expect(batches[0].map((c) => c.id).toList(), ['EMA', 'MACD']);
    });
  });

  group('IndicatorPipeline.executeBatch', () {
    test('executes indicators in correct order and passes dependencies', () {
      final registry = IndicatorRegistry();
      registry.register<MockConfig>((config) => MockIndicator(config));

      final pipeline = IndicatorPipeline();
      final series = Series(
        timestamps: Int64List(0),
        open: Float64List(0),
        high: Float64List(0),
        low: Float64List(0),
        close: Float64List(0),
        volume: Float64List(0),
      );

      final ema = MockConfig('EMA');
      final macd = MockConfig('MACD', ['EMA']);

      final sorted = pipeline.sortTopologically([macd, ema]);
      final results = pipeline.executeBatch(sorted, series, registry);

      expect(results.containsKey('EMA'), isTrue);
      expect(results.containsKey('MACD'), isTrue);
    });
  });
}
