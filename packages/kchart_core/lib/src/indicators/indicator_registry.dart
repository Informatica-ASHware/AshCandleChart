import 'indicator.dart';
import 'sma.dart';
import 'ema.dart';
import 'macd.dart';
import 'bollinger_bands.dart';
import 'rsi.dart';

/// A function that creates an [Indicator] from an [IndicatorConfig].
typedef IndicatorFactory<T extends IndicatorConfig> = Indicator<T> Function(T config);

/// Registry for managing indicator implementations.
///
/// It allows registering [IndicatorFactory]s for specific [IndicatorConfig] types.
class IndicatorRegistry {
  final Map<Type, IndicatorFactory<IndicatorConfig>> _factories = {};

  /// Registers a factory for a given configuration type [T].
  void register<T extends IndicatorConfig>(IndicatorFactory<T> factory) {
    _factories[T] = (config) => factory(config as T);
  }

  /// Registers all built-in indicators.
  void registerBuiltIns() {
    register<SMAConfig>((config) => SMAIndicator(config));
    register<EMAConfig>((config) => EMAIndicator(config));
    register<MACDConfig>((config) => MACDIndicator(config));
    register<BollingerBandsConfig>((config) => BollingerBandsIndicator(config));
    register<RSIConfig>((config) => RSIIndicator(config));
  }

  /// Creates an [Indicator] from the given [config].
  ///
  /// Throws an [ArgumentError] if no factory is registered for the type of [config].
  Indicator create(IndicatorConfig config) {
    final factory = _factories[config.runtimeType];
    if (factory == null) {
      throw ArgumentError('No indicator factory registered for config type: ${config.runtimeType}');
    }
    return factory(config);
  }
}
