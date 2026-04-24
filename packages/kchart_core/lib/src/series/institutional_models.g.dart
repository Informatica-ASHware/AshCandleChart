// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institutional_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VolumeProfileBinImpl _$$VolumeProfileBinImplFromJson(
        Map<String, dynamic> json) =>
    _$VolumeProfileBinImpl(
      price: (json['price'] as num).toDouble(),
      volume: (json['volume'] as num).toDouble(),
      buyVolume: (json['buyVolume'] as num?)?.toDouble() ?? 0.0,
      sellVolume: (json['sellVolume'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$VolumeProfileBinImplToJson(
        _$VolumeProfileBinImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'volume': instance.volume,
      'buyVolume': instance.buyVolume,
      'sellVolume': instance.sellVolume,
    };

_$VolumeProfileImpl _$$VolumeProfileImplFromJson(Map<String, dynamic> json) =>
    _$VolumeProfileImpl(
      bins: (json['bins'] as List<dynamic>)
          .map((e) => VolumeProfileBin.fromJson(e as Map<String, dynamic>))
          .toList(),
      pocPrice: (json['pocPrice'] as num).toDouble(),
      maxVolume: (json['maxVolume'] as num).toDouble(),
    );

Map<String, dynamic> _$$VolumeProfileImplToJson(_$VolumeProfileImpl instance) =>
    <String, dynamic>{
      'bins': instance.bins,
      'pocPrice': instance.pocPrice,
      'maxVolume': instance.maxVolume,
    };

_$OrderBookEntryImpl _$$OrderBookEntryImplFromJson(Map<String, dynamic> json) =>
    _$OrderBookEntryImpl(
      price: (json['price'] as num).toDouble(),
      size: (json['size'] as num).toDouble(),
      cumulativeSize: (json['cumulativeSize'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$OrderBookEntryImplToJson(
        _$OrderBookEntryImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'size': instance.size,
      'cumulativeSize': instance.cumulativeSize,
    };

_$OrderBookImpl _$$OrderBookImplFromJson(Map<String, dynamic> json) =>
    _$OrderBookImpl(
      bids: (json['bids'] as List<dynamic>)
          .map((e) => OrderBookEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      asks: (json['asks'] as List<dynamic>)
          .map((e) => OrderBookEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: (json['timestamp'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderBookImplToJson(_$OrderBookImpl instance) =>
    <String, dynamic>{
      'bids': instance.bids,
      'asks': instance.asks,
      'timestamp': instance.timestamp,
    };

_$LiquidationAreaImpl _$$LiquidationAreaImplFromJson(
        Map<String, dynamic> json) =>
    _$LiquidationAreaImpl(
      price: (json['price'] as num).toDouble(),
      size: (json['size'] as num).toDouble(),
      intensity: (json['intensity'] as num).toDouble(),
    );

Map<String, dynamic> _$$LiquidationAreaImplToJson(
        _$LiquidationAreaImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'size': instance.size,
      'intensity': instance.intensity,
    };
