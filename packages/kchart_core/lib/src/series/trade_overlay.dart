import 'package:freezed_annotation/freezed_annotation.dart';
import 'annotation.dart';

part 'trade_overlay.freezed.dart';
part 'trade_overlay.g.dart';

/// Represents a trade-related overlay on the chart.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
class TradeOverlay with _$TradeOverlay {
  const TradeOverlay._();

  /// A marker representing a single trade event (e.g., execution).
  const factory TradeOverlay.marker({
    /// Unique identifier for the overlay.
    required String id,

    /// The point in time and price where the marker is placed.
    required AnnotationPoint point,

    /// Hex color of the marker.
    @Default(0xFF4CAF50) int color,

    /// Size of the marker in pixels.
    @Default(8.0) double size,

    /// Optional label to display next to the marker.
    String? label,
  }) = TradeMarker;

  /// An overlay representing an open position with entry, SL, and TP.
  const factory TradeOverlay.position({
    /// Unique identifier for the overlay.
    required String id,

    /// The entry price of the position.
    required double entryPrice,

    /// Optional stop loss price.
    double? stopLoss,

    /// Optional take profit price.
    double? takeProfit,

    /// Hex color for the profit zone (entry to TP).
    @Default(0x334CAF50) int profitColor,

    /// Hex color for the loss zone (entry to SL).
    @Default(0x33F44336) int lossColor,

    /// Hex color for the entry line.
    @Default(0xFFFFFFFF) int entryColor,
  }) = PositionOverlay;

  /// Creates a [TradeOverlay] from a JSON object.
  factory TradeOverlay.fromJson(Map<String, dynamic> json) =>
      _$TradeOverlayFromJson(json);

  /// Converts the overlay to a JSON object.
  Map<String, dynamic> toJson() {
    final self = this;
    if (self is TradeMarker) {
      return _$$TradeMarkerImplToJson(self as _$TradeMarkerImpl);
    } else if (self is PositionOverlay) {
      return _$$PositionOverlayImplToJson(self as _$PositionOverlayImpl);
    }
    throw UnimplementedError();
  }
}

/// A collection of trade overlays.
@freezed
class TradeOverlayDocument with _$TradeOverlayDocument {
  const TradeOverlayDocument._();

  /// Creates a [TradeOverlayDocument] with a list of [overlays].
  const factory TradeOverlayDocument({
    /// List of trade overlays in the document.
    @Default([]) List<TradeOverlay> overlays,
  }) = _TradeOverlayDocument;

  /// Creates a [TradeOverlayDocument] from a JSON object.
  factory TradeOverlayDocument.fromJson(Map<String, dynamic> json) =>
      _$TradeOverlayDocumentFromJson(json);

  /// Converts the document to a JSON object.
  Map<String, dynamic> toJson() => _$$TradeOverlayDocumentImplToJson(this as _$TradeOverlayDocumentImpl);
}
