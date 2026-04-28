// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnotationPoint _$AnnotationPointFromJson(Map<String, dynamic> json) =>
    _AnnotationPoint(
      timestamp: (json['timestamp'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$AnnotationPointToJson(_AnnotationPoint instance) =>
    <String, dynamic>{'timestamp': instance.timestamp, 'price': instance.price};
