// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnotationPointImpl _$$AnnotationPointImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnotationPointImpl(
      timestamp: (json['timestamp'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$AnnotationPointImplToJson(
        _$AnnotationPointImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'price': instance.price,
    };
