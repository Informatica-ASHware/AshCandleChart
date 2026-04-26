import 'package:freezed_annotation/freezed_annotation.dart';

part 'institutional_models.freezed.dart';
part 'institutional_models.g.dart';

/// Represents a single bin in a volume profile.
@freezed
abstract class VolumeProfileBin with _$VolumeProfileBin {
  /// Creates a [VolumeProfileBin].
  const factory VolumeProfileBin({
    /// The center price of this bin.
    required double price,

    /// Total volume traded at this price level.
    required double volume,

    /// Volume from buy orders (if available).
    @Default(0.0) double buyVolume,

    /// Volume from sell orders (if available).
    @Default(0.0) double sellVolume,
  }) = _VolumeProfileBin;

  /// Creates a [VolumeProfileBin] from a JSON map.
  factory VolumeProfileBin.fromJson(Map<String, dynamic> json) =>
      _$VolumeProfileBinFromJson(json);
}

/// Represents the volume profile for a specific range.
@freezed
abstract class VolumeProfile with _$VolumeProfile {
  /// Creates a [VolumeProfile].
  const factory VolumeProfile({
    /// List of bins ordered by price.
    required List<VolumeProfileBin> bins,

    /// The price level with the highest volume (Point of Control).
    required double pocPrice,

    /// Maximum volume in a single bin (for scaling).
    required double maxVolume,
  }) = _VolumeProfile;

  /// Creates a [VolumeProfile] from a JSON map.
  factory VolumeProfile.fromJson(Map<String, dynamic> json) =>
      _$VolumeProfileFromJson(json);
}

/// Represents an entry in the order book.
@freezed
abstract class OrderBookEntry with _$OrderBookEntry {
  /// Creates an [OrderBookEntry].
  const factory OrderBookEntry({
    /// The price of the order.
    required double price,

    /// The amount/size at this price.
    required double size,

    /// Cumulative size up to this price level.
    @Default(0.0) double cumulativeSize,
  }) = _OrderBookEntry;

  /// Creates an [OrderBookEntry] from a JSON map.
  factory OrderBookEntry.fromJson(Map<String, dynamic> json) =>
      _$OrderBookEntryFromJson(json);
}

/// Represents the real-time state of an order book.
@freezed
abstract class OrderBook with _$OrderBook {
  /// Creates an [OrderBook].
  const factory OrderBook({
    /// List of buy orders (bids), sorted by price descending.
    required List<OrderBookEntry> bids,

    /// List of sell orders (asks), sorted by price ascending.
    required List<OrderBookEntry> asks,

    /// Timestamp of the last update.
    required int timestamp,
  }) = _OrderBook;

  /// Creates an [OrderBook] from a JSON map.
  factory OrderBook.fromJson(Map<String, dynamic> json) =>
      _$OrderBookFromJson(json);
}

/// Represents a liquidation zone on the chart.
@freezed
abstract class LiquidationArea with _$LiquidationArea {
  /// Creates a [LiquidationArea].
  const factory LiquidationArea({
    /// The price level of the liquidation.
    required double price,

    /// Total estimated value of liquidations at this level.
    required double size,

    /// Intensity or probability (0.0 to 1.0) for heatmap rendering.
    required double intensity,
  }) = _LiquidationArea;

  /// Creates a [LiquidationArea] from a JSON map.
  factory LiquidationArea.fromJson(Map<String, dynamic> json) =>
      _$LiquidationAreaFromJson(json);
}
