import 'package:freezed_annotation/freezed_annotation.dart';
import 'annotation.dart';

part 'trade_overlay.freezed.dart';

/// Represents a trade-related overlay on the chart.
@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.snake,
)
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
  factory TradeOverlay.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String?;
    if (type == 'marker') {
      return TradeOverlay.marker(
        id: json['id'] as String,
        point: AnnotationPoint.fromJson(json['point'] as Map<String, dynamic>),
        color: json['color'] as int? ?? 0xFF4CAF50,
        size: (json['size'] as num?)?.toDouble() ?? 8.0,
        label: json['label'] as String?,
      );
    } else if (type == 'position') {
      return TradeOverlay.position(
        id: json['id'] as String,
        entryPrice: (json['entryPrice'] as num).toDouble(),
        stopLoss: (json['stopLoss'] as num?)?.toDouble(),
        takeProfit: (json['takeProfit'] as num?)?.toDouble(),
        profitColor: json['profitColor'] as int? ?? 0x334CAF50,
        lossColor: json['lossColor'] as int? ?? 0x33F44336,
        entryColor: json['entryColor'] as int? ?? 0xFFFFFFFF,
      );
    }
    throw UnimplementedError('Unknown TradeOverlay type: $type');
  }

  /// Converts the overlay to a JSON object.
  Map<String, dynamic> toJson() {
    final self = this;
    if (self is TradeMarker) {
      return {
        'type': 'marker',
        'id': self.id,
        'point': self.point.toJson(),
        'color': self.color,
        'size': self.size,
        'label': self.label,
      };
    } else if (self is PositionOverlay) {
      return {
        'type': 'position',
        'id': self.id,
        'entryPrice': self.entryPrice,
        'stopLoss': self.stopLoss,
        'takeProfit': self.takeProfit,
        'profitColor': self.profitColor,
        'lossColor': self.lossColor,
        'entryColor': self.entryColor,
      };
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
  factory TradeOverlayDocument.fromJson(Map<String, dynamic> json) {
    return TradeOverlayDocument(
      overlays: (json['overlays'] as List<dynamic>?)
              ?.map((e) => TradeOverlay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  /// Converts the document to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'overlays': overlays.map((o) => o.toJson()).toList(),
    };
  }
}
