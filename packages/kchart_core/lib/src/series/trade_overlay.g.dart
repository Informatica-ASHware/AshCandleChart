// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_overlay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TradeMarkerImpl _$$TradeMarkerImplFromJson(Map<String, dynamic> json) =>
    _$TradeMarkerImpl(
      id: json['id'] as String,
      point: AnnotationPoint.fromJson(json['point'] as Map<String, dynamic>),
      color: (json['color'] as num?)?.toInt() ?? 0xFF4CAF50,
      size: (json['size'] as num?)?.toDouble() ?? 8.0,
      label: json['label'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$TradeMarkerImplToJson(_$TradeMarkerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'color': instance.color,
      'size': instance.size,
      'label': instance.label,
      'type': instance.$type,
    };

_$PositionOverlayImpl _$$PositionOverlayImplFromJson(
        Map<String, dynamic> json) =>
    _$PositionOverlayImpl(
      id: json['id'] as String,
      entryPrice: (json['entryPrice'] as num).toDouble(),
      stopLoss: (json['stopLoss'] as num?)?.toDouble(),
      takeProfit: (json['takeProfit'] as num?)?.toDouble(),
      profitColor: (json['profitColor'] as num?)?.toInt() ?? 0x334CAF50,
      lossColor: (json['lossColor'] as num?)?.toInt() ?? 0x33F44336,
      entryColor: (json['entryColor'] as num?)?.toInt() ?? 0xFFFFFFFF,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$PositionOverlayImplToJson(
        _$PositionOverlayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entryPrice': instance.entryPrice,
      'stopLoss': instance.stopLoss,
      'takeProfit': instance.takeProfit,
      'profitColor': instance.profitColor,
      'lossColor': instance.lossColor,
      'entryColor': instance.entryColor,
      'type': instance.$type,
    };

_$TradeOverlayDocumentImpl _$$TradeOverlayDocumentImplFromJson(
        Map<String, dynamic> json) =>
    _$TradeOverlayDocumentImpl(
      overlays: (json['overlays'] as List<dynamic>?)
              ?.map((e) => TradeOverlay.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TradeOverlayDocumentImplToJson(
        _$TradeOverlayDocumentImpl instance) =>
    <String, dynamic>{
      'overlays': instance.overlays,
    };
