import 'dart:typed_data';
import 'package:meta/meta.dart';
import '../series/series.dart';

/// Base interface for indicator configurations.
///
/// Implementations of this interface should be immutable and define the parameters
/// needed for an indicator's calculation.
@immutable
abstract interface class IndicatorConfig {
  /// Unique identifier for this indicator instance.
  String get id;

  /// IDs of other indicators this one depends on.
  List<String> get dependsOn;
}

/// Abstract base class for indicator implementations.
///
/// These are responsible for the actual calculation of indicator values.
/// They are typically instantiated by an [IndicatorRegistry] based on an [IndicatorConfig].
abstract class Indicator<T extends IndicatorConfig> {
  /// The configuration for this indicator.
  final T config;

  /// Creates an [Indicator] with the given [config].
  Indicator(this.config);

  /// Computes the indicator results.
  ///
  /// [input] is the OHLCV series data.
  /// [dependencies] contains the results of indicators listed in [IndicatorConfig.dependsOn].
  ///
  /// The returned value should be a [TypedData] (e.g., [Float64List]) or a container
  /// (like a Map or List) of [TypedData] to ensure efficient memory usage and transfer.
  Object compute(Series input, Map<String, Object> dependencies);

  /// Computes the indicator results incrementally when a new data point is added.
  ///
  /// [input] is the OHLCV series data, including the new point at the end.
  /// [dependencies] contains the updated results of indicators listed in [IndicatorConfig.dependsOn].
  /// [previousResults] is the result of the previous call to [compute] or [computeAppend].
  ///
  /// This method is intended to optimize performance for real-time updates.
  Object computeAppend(
      Series input, Map<String, Object> dependencies, Object previousResults);
}
