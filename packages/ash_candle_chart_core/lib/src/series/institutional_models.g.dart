// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institutional_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolumeProfileBin _$VolumeProfileBinFromJson(Map<String, dynamic> json) =>
    _VolumeProfileBin(
      price: (json['price'] as num).toDouble(),
      volume: (json['volume'] as num).toDouble(),
      buyVolume: (json['buyVolume'] as num?)?.toDouble() ?? 0.0,
      sellVolume: (json['sellVolume'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$VolumeProfileBinToJson(_VolumeProfileBin instance) =>
    <String, dynamic>{
      'price': instance.price,
      'volume': instance.volume,
      'buyVolume': instance.buyVolume,
      'sellVolume': instance.sellVolume,
    };

_VolumeProfile _$VolumeProfileFromJson(Map<String, dynamic> json) =>
    _VolumeProfile(
      bins: (json['bins'] as List<dynamic>)
          .map((e) => VolumeProfileBin.fromJson(e as Map<String, dynamic>))
          .toList(),
      pocPrice: (json['pocPrice'] as num).toDouble(),
      maxVolume: (json['maxVolume'] as num).toDouble(),
    );

Map<String, dynamic> _$VolumeProfileToJson(_VolumeProfile instance) =>
    <String, dynamic>{
      'bins': instance.bins,
      'pocPrice': instance.pocPrice,
      'maxVolume': instance.maxVolume,
    };

_OrderBookEntry _$OrderBookEntryFromJson(Map<String, dynamic> json) =>
    _OrderBookEntry(
      price: (json['price'] as num).toDouble(),
      size: (json['size'] as num).toDouble(),
      cumulativeSize: (json['cumulativeSize'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$OrderBookEntryToJson(_OrderBookEntry instance) =>
    <String, dynamic>{
      'price': instance.price,
      'size': instance.size,
      'cumulativeSize': instance.cumulativeSize,
    };

_OrderBook _$OrderBookFromJson(Map<String, dynamic> json) => _OrderBook(
  bids: (json['bids'] as List<dynamic>)
      .map((e) => OrderBookEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  asks: (json['asks'] as List<dynamic>)
      .map((e) => OrderBookEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  timestamp: (json['timestamp'] as num).toInt(),
);

Map<String, dynamic> _$OrderBookToJson(_OrderBook instance) =>
    <String, dynamic>{
      'bids': instance.bids,
      'asks': instance.asks,
      'timestamp': instance.timestamp,
    };

_LiquidationArea _$LiquidationAreaFromJson(Map<String, dynamic> json) =>
    _LiquidationArea(
      price: (json['price'] as num).toDouble(),
      size: (json['size'] as num).toDouble(),
      intensity: (json['intensity'] as num).toDouble(),
    );

Map<String, dynamic> _$LiquidationAreaToJson(_LiquidationArea instance) =>
    <String, dynamic>{
      'price': instance.price,
      'size': instance.size,
      'intensity': instance.intensity,
    };
