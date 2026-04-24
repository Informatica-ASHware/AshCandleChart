// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'institutional_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VolumeProfileBin _$VolumeProfileBinFromJson(Map<String, dynamic> json) {
  return _VolumeProfileBin.fromJson(json);
}

/// @nodoc
mixin _$VolumeProfileBin {
  /// The center price of this bin.
  double get price => throw _privateConstructorUsedError;

  /// Total volume traded at this price level.
  double get volume => throw _privateConstructorUsedError;

  /// Volume from buy orders (if available).
  double get buyVolume => throw _privateConstructorUsedError;

  /// Volume from sell orders (if available).
  double get sellVolume => throw _privateConstructorUsedError;

  /// Serializes this VolumeProfileBin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VolumeProfileBin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VolumeProfileBinCopyWith<VolumeProfileBin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolumeProfileBinCopyWith<$Res> {
  factory $VolumeProfileBinCopyWith(
          VolumeProfileBin value, $Res Function(VolumeProfileBin) then) =
      _$VolumeProfileBinCopyWithImpl<$Res, VolumeProfileBin>;
  @useResult
  $Res call({double price, double volume, double buyVolume, double sellVolume});
}

/// @nodoc
class _$VolumeProfileBinCopyWithImpl<$Res, $Val extends VolumeProfileBin>
    implements $VolumeProfileBinCopyWith<$Res> {
  _$VolumeProfileBinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VolumeProfileBin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? volume = null,
    Object? buyVolume = null,
    Object? sellVolume = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      buyVolume: null == buyVolume
          ? _value.buyVolume
          : buyVolume // ignore: cast_nullable_to_non_nullable
              as double,
      sellVolume: null == sellVolume
          ? _value.sellVolume
          : sellVolume // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VolumeProfileBinImplCopyWith<$Res>
    implements $VolumeProfileBinCopyWith<$Res> {
  factory _$$VolumeProfileBinImplCopyWith(_$VolumeProfileBinImpl value,
          $Res Function(_$VolumeProfileBinImpl) then) =
      __$$VolumeProfileBinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double price, double volume, double buyVolume, double sellVolume});
}

/// @nodoc
class __$$VolumeProfileBinImplCopyWithImpl<$Res>
    extends _$VolumeProfileBinCopyWithImpl<$Res, _$VolumeProfileBinImpl>
    implements _$$VolumeProfileBinImplCopyWith<$Res> {
  __$$VolumeProfileBinImplCopyWithImpl(_$VolumeProfileBinImpl _value,
      $Res Function(_$VolumeProfileBinImpl) _then)
      : super(_value, _then);

  /// Create a copy of VolumeProfileBin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? volume = null,
    Object? buyVolume = null,
    Object? sellVolume = null,
  }) {
    return _then(_$VolumeProfileBinImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      buyVolume: null == buyVolume
          ? _value.buyVolume
          : buyVolume // ignore: cast_nullable_to_non_nullable
              as double,
      sellVolume: null == sellVolume
          ? _value.sellVolume
          : sellVolume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VolumeProfileBinImpl implements _VolumeProfileBin {
  const _$VolumeProfileBinImpl(
      {required this.price,
      required this.volume,
      this.buyVolume = 0.0,
      this.sellVolume = 0.0});

  factory _$VolumeProfileBinImpl.fromJson(Map<String, dynamic> json) =>
      _$$VolumeProfileBinImplFromJson(json);

  /// The center price of this bin.
  @override
  final double price;

  /// Total volume traded at this price level.
  @override
  final double volume;

  /// Volume from buy orders (if available).
  @override
  @JsonKey()
  final double buyVolume;

  /// Volume from sell orders (if available).
  @override
  @JsonKey()
  final double sellVolume;

  @override
  String toString() {
    return 'VolumeProfileBin(price: $price, volume: $volume, buyVolume: $buyVolume, sellVolume: $sellVolume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VolumeProfileBinImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.buyVolume, buyVolume) ||
                other.buyVolume == buyVolume) &&
            (identical(other.sellVolume, sellVolume) ||
                other.sellVolume == sellVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, price, volume, buyVolume, sellVolume);

  /// Create a copy of VolumeProfileBin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VolumeProfileBinImplCopyWith<_$VolumeProfileBinImpl> get copyWith =>
      __$$VolumeProfileBinImplCopyWithImpl<_$VolumeProfileBinImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VolumeProfileBinImplToJson(
      this,
    );
  }
}

abstract class _VolumeProfileBin implements VolumeProfileBin {
  const factory _VolumeProfileBin(
      {required final double price,
      required final double volume,
      final double buyVolume,
      final double sellVolume}) = _$VolumeProfileBinImpl;

  factory _VolumeProfileBin.fromJson(Map<String, dynamic> json) =
      _$VolumeProfileBinImpl.fromJson;

  /// The center price of this bin.
  @override
  double get price;

  /// Total volume traded at this price level.
  @override
  double get volume;

  /// Volume from buy orders (if available).
  @override
  double get buyVolume;

  /// Volume from sell orders (if available).
  @override
  double get sellVolume;

  /// Create a copy of VolumeProfileBin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VolumeProfileBinImplCopyWith<_$VolumeProfileBinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VolumeProfile _$VolumeProfileFromJson(Map<String, dynamic> json) {
  return _VolumeProfile.fromJson(json);
}

/// @nodoc
mixin _$VolumeProfile {
  /// List of bins ordered by price.
  List<VolumeProfileBin> get bins => throw _privateConstructorUsedError;

  /// The price level with the highest volume (Point of Control).
  double get pocPrice => throw _privateConstructorUsedError;

  /// Maximum volume in a single bin (for scaling).
  double get maxVolume => throw _privateConstructorUsedError;

  /// Serializes this VolumeProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VolumeProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VolumeProfileCopyWith<VolumeProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolumeProfileCopyWith<$Res> {
  factory $VolumeProfileCopyWith(
          VolumeProfile value, $Res Function(VolumeProfile) then) =
      _$VolumeProfileCopyWithImpl<$Res, VolumeProfile>;
  @useResult
  $Res call({List<VolumeProfileBin> bins, double pocPrice, double maxVolume});
}

/// @nodoc
class _$VolumeProfileCopyWithImpl<$Res, $Val extends VolumeProfile>
    implements $VolumeProfileCopyWith<$Res> {
  _$VolumeProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VolumeProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bins = null,
    Object? pocPrice = null,
    Object? maxVolume = null,
  }) {
    return _then(_value.copyWith(
      bins: null == bins
          ? _value.bins
          : bins // ignore: cast_nullable_to_non_nullable
              as List<VolumeProfileBin>,
      pocPrice: null == pocPrice
          ? _value.pocPrice
          : pocPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxVolume: null == maxVolume
          ? _value.maxVolume
          : maxVolume // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VolumeProfileImplCopyWith<$Res>
    implements $VolumeProfileCopyWith<$Res> {
  factory _$$VolumeProfileImplCopyWith(
          _$VolumeProfileImpl value, $Res Function(_$VolumeProfileImpl) then) =
      __$$VolumeProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VolumeProfileBin> bins, double pocPrice, double maxVolume});
}

/// @nodoc
class __$$VolumeProfileImplCopyWithImpl<$Res>
    extends _$VolumeProfileCopyWithImpl<$Res, _$VolumeProfileImpl>
    implements _$$VolumeProfileImplCopyWith<$Res> {
  __$$VolumeProfileImplCopyWithImpl(
      _$VolumeProfileImpl _value, $Res Function(_$VolumeProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of VolumeProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bins = null,
    Object? pocPrice = null,
    Object? maxVolume = null,
  }) {
    return _then(_$VolumeProfileImpl(
      bins: null == bins
          ? _value._bins
          : bins // ignore: cast_nullable_to_non_nullable
              as List<VolumeProfileBin>,
      pocPrice: null == pocPrice
          ? _value.pocPrice
          : pocPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxVolume: null == maxVolume
          ? _value.maxVolume
          : maxVolume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VolumeProfileImpl implements _VolumeProfile {
  const _$VolumeProfileImpl(
      {required final List<VolumeProfileBin> bins,
      required this.pocPrice,
      required this.maxVolume})
      : _bins = bins;

  factory _$VolumeProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$VolumeProfileImplFromJson(json);

  /// List of bins ordered by price.
  final List<VolumeProfileBin> _bins;

  /// List of bins ordered by price.
  @override
  List<VolumeProfileBin> get bins {
    if (_bins is EqualUnmodifiableListView) return _bins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bins);
  }

  /// The price level with the highest volume (Point of Control).
  @override
  final double pocPrice;

  /// Maximum volume in a single bin (for scaling).
  @override
  final double maxVolume;

  @override
  String toString() {
    return 'VolumeProfile(bins: $bins, pocPrice: $pocPrice, maxVolume: $maxVolume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VolumeProfileImpl &&
            const DeepCollectionEquality().equals(other._bins, _bins) &&
            (identical(other.pocPrice, pocPrice) ||
                other.pocPrice == pocPrice) &&
            (identical(other.maxVolume, maxVolume) ||
                other.maxVolume == maxVolume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_bins), pocPrice, maxVolume);

  /// Create a copy of VolumeProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VolumeProfileImplCopyWith<_$VolumeProfileImpl> get copyWith =>
      __$$VolumeProfileImplCopyWithImpl<_$VolumeProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VolumeProfileImplToJson(
      this,
    );
  }
}

abstract class _VolumeProfile implements VolumeProfile {
  const factory _VolumeProfile(
      {required final List<VolumeProfileBin> bins,
      required final double pocPrice,
      required final double maxVolume}) = _$VolumeProfileImpl;

  factory _VolumeProfile.fromJson(Map<String, dynamic> json) =
      _$VolumeProfileImpl.fromJson;

  /// List of bins ordered by price.
  @override
  List<VolumeProfileBin> get bins;

  /// The price level with the highest volume (Point of Control).
  @override
  double get pocPrice;

  /// Maximum volume in a single bin (for scaling).
  @override
  double get maxVolume;

  /// Create a copy of VolumeProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VolumeProfileImplCopyWith<_$VolumeProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderBookEntry _$OrderBookEntryFromJson(Map<String, dynamic> json) {
  return _OrderBookEntry.fromJson(json);
}

/// @nodoc
mixin _$OrderBookEntry {
  /// The price of the order.
  double get price => throw _privateConstructorUsedError;

  /// The amount/size at this price.
  double get size => throw _privateConstructorUsedError;

  /// Cumulative size up to this price level.
  double get cumulativeSize => throw _privateConstructorUsedError;

  /// Serializes this OrderBookEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderBookEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderBookEntryCopyWith<OrderBookEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderBookEntryCopyWith<$Res> {
  factory $OrderBookEntryCopyWith(
          OrderBookEntry value, $Res Function(OrderBookEntry) then) =
      _$OrderBookEntryCopyWithImpl<$Res, OrderBookEntry>;
  @useResult
  $Res call({double price, double size, double cumulativeSize});
}

/// @nodoc
class _$OrderBookEntryCopyWithImpl<$Res, $Val extends OrderBookEntry>
    implements $OrderBookEntryCopyWith<$Res> {
  _$OrderBookEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderBookEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? size = null,
    Object? cumulativeSize = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      cumulativeSize: null == cumulativeSize
          ? _value.cumulativeSize
          : cumulativeSize // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderBookEntryImplCopyWith<$Res>
    implements $OrderBookEntryCopyWith<$Res> {
  factory _$$OrderBookEntryImplCopyWith(_$OrderBookEntryImpl value,
          $Res Function(_$OrderBookEntryImpl) then) =
      __$$OrderBookEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double price, double size, double cumulativeSize});
}

/// @nodoc
class __$$OrderBookEntryImplCopyWithImpl<$Res>
    extends _$OrderBookEntryCopyWithImpl<$Res, _$OrderBookEntryImpl>
    implements _$$OrderBookEntryImplCopyWith<$Res> {
  __$$OrderBookEntryImplCopyWithImpl(
      _$OrderBookEntryImpl _value, $Res Function(_$OrderBookEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderBookEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? size = null,
    Object? cumulativeSize = null,
  }) {
    return _then(_$OrderBookEntryImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      cumulativeSize: null == cumulativeSize
          ? _value.cumulativeSize
          : cumulativeSize // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderBookEntryImpl implements _OrderBookEntry {
  const _$OrderBookEntryImpl(
      {required this.price, required this.size, this.cumulativeSize = 0.0});

  factory _$OrderBookEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderBookEntryImplFromJson(json);

  /// The price of the order.
  @override
  final double price;

  /// The amount/size at this price.
  @override
  final double size;

  /// Cumulative size up to this price level.
  @override
  @JsonKey()
  final double cumulativeSize;

  @override
  String toString() {
    return 'OrderBookEntry(price: $price, size: $size, cumulativeSize: $cumulativeSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderBookEntryImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.cumulativeSize, cumulativeSize) ||
                other.cumulativeSize == cumulativeSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, price, size, cumulativeSize);

  /// Create a copy of OrderBookEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderBookEntryImplCopyWith<_$OrderBookEntryImpl> get copyWith =>
      __$$OrderBookEntryImplCopyWithImpl<_$OrderBookEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderBookEntryImplToJson(
      this,
    );
  }
}

abstract class _OrderBookEntry implements OrderBookEntry {
  const factory _OrderBookEntry(
      {required final double price,
      required final double size,
      final double cumulativeSize}) = _$OrderBookEntryImpl;

  factory _OrderBookEntry.fromJson(Map<String, dynamic> json) =
      _$OrderBookEntryImpl.fromJson;

  /// The price of the order.
  @override
  double get price;

  /// The amount/size at this price.
  @override
  double get size;

  /// Cumulative size up to this price level.
  @override
  double get cumulativeSize;

  /// Create a copy of OrderBookEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderBookEntryImplCopyWith<_$OrderBookEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderBook _$OrderBookFromJson(Map<String, dynamic> json) {
  return _OrderBook.fromJson(json);
}

/// @nodoc
mixin _$OrderBook {
  /// List of buy orders (bids), sorted by price descending.
  List<OrderBookEntry> get bids => throw _privateConstructorUsedError;

  /// List of sell orders (asks), sorted by price ascending.
  List<OrderBookEntry> get asks => throw _privateConstructorUsedError;

  /// Timestamp of the last update.
  int get timestamp => throw _privateConstructorUsedError;

  /// Serializes this OrderBook to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderBookCopyWith<OrderBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderBookCopyWith<$Res> {
  factory $OrderBookCopyWith(OrderBook value, $Res Function(OrderBook) then) =
      _$OrderBookCopyWithImpl<$Res, OrderBook>;
  @useResult
  $Res call(
      {List<OrderBookEntry> bids, List<OrderBookEntry> asks, int timestamp});
}

/// @nodoc
class _$OrderBookCopyWithImpl<$Res, $Val extends OrderBook>
    implements $OrderBookCopyWith<$Res> {
  _$OrderBookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bids = null,
    Object? asks = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      bids: null == bids
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<OrderBookEntry>,
      asks: null == asks
          ? _value.asks
          : asks // ignore: cast_nullable_to_non_nullable
              as List<OrderBookEntry>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderBookImplCopyWith<$Res>
    implements $OrderBookCopyWith<$Res> {
  factory _$$OrderBookImplCopyWith(
          _$OrderBookImpl value, $Res Function(_$OrderBookImpl) then) =
      __$$OrderBookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OrderBookEntry> bids, List<OrderBookEntry> asks, int timestamp});
}

/// @nodoc
class __$$OrderBookImplCopyWithImpl<$Res>
    extends _$OrderBookCopyWithImpl<$Res, _$OrderBookImpl>
    implements _$$OrderBookImplCopyWith<$Res> {
  __$$OrderBookImplCopyWithImpl(
      _$OrderBookImpl _value, $Res Function(_$OrderBookImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderBook
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bids = null,
    Object? asks = null,
    Object? timestamp = null,
  }) {
    return _then(_$OrderBookImpl(
      bids: null == bids
          ? _value._bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<OrderBookEntry>,
      asks: null == asks
          ? _value._asks
          : asks // ignore: cast_nullable_to_non_nullable
              as List<OrderBookEntry>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderBookImpl implements _OrderBook {
  const _$OrderBookImpl(
      {required final List<OrderBookEntry> bids,
      required final List<OrderBookEntry> asks,
      required this.timestamp})
      : _bids = bids,
        _asks = asks;

  factory _$OrderBookImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderBookImplFromJson(json);

  /// List of buy orders (bids), sorted by price descending.
  final List<OrderBookEntry> _bids;

  /// List of buy orders (bids), sorted by price descending.
  @override
  List<OrderBookEntry> get bids {
    if (_bids is EqualUnmodifiableListView) return _bids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bids);
  }

  /// List of sell orders (asks), sorted by price ascending.
  final List<OrderBookEntry> _asks;

  /// List of sell orders (asks), sorted by price ascending.
  @override
  List<OrderBookEntry> get asks {
    if (_asks is EqualUnmodifiableListView) return _asks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_asks);
  }

  /// Timestamp of the last update.
  @override
  final int timestamp;

  @override
  String toString() {
    return 'OrderBook(bids: $bids, asks: $asks, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderBookImpl &&
            const DeepCollectionEquality().equals(other._bids, _bids) &&
            const DeepCollectionEquality().equals(other._asks, _asks) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bids),
      const DeepCollectionEquality().hash(_asks),
      timestamp);

  /// Create a copy of OrderBook
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderBookImplCopyWith<_$OrderBookImpl> get copyWith =>
      __$$OrderBookImplCopyWithImpl<_$OrderBookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderBookImplToJson(
      this,
    );
  }
}

abstract class _OrderBook implements OrderBook {
  const factory _OrderBook(
      {required final List<OrderBookEntry> bids,
      required final List<OrderBookEntry> asks,
      required final int timestamp}) = _$OrderBookImpl;

  factory _OrderBook.fromJson(Map<String, dynamic> json) =
      _$OrderBookImpl.fromJson;

  /// List of buy orders (bids), sorted by price descending.
  @override
  List<OrderBookEntry> get bids;

  /// List of sell orders (asks), sorted by price ascending.
  @override
  List<OrderBookEntry> get asks;

  /// Timestamp of the last update.
  @override
  int get timestamp;

  /// Create a copy of OrderBook
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderBookImplCopyWith<_$OrderBookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LiquidationArea _$LiquidationAreaFromJson(Map<String, dynamic> json) {
  return _LiquidationArea.fromJson(json);
}

/// @nodoc
mixin _$LiquidationArea {
  /// The price level of the liquidation.
  double get price => throw _privateConstructorUsedError;

  /// Total estimated value of liquidations at this level.
  double get size => throw _privateConstructorUsedError;

  /// Intensity or probability (0.0 to 1.0) for heatmap rendering.
  double get intensity => throw _privateConstructorUsedError;

  /// Serializes this LiquidationArea to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiquidationArea
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiquidationAreaCopyWith<LiquidationArea> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiquidationAreaCopyWith<$Res> {
  factory $LiquidationAreaCopyWith(
          LiquidationArea value, $Res Function(LiquidationArea) then) =
      _$LiquidationAreaCopyWithImpl<$Res, LiquidationArea>;
  @useResult
  $Res call({double price, double size, double intensity});
}

/// @nodoc
class _$LiquidationAreaCopyWithImpl<$Res, $Val extends LiquidationArea>
    implements $LiquidationAreaCopyWith<$Res> {
  _$LiquidationAreaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiquidationArea
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? size = null,
    Object? intensity = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      intensity: null == intensity
          ? _value.intensity
          : intensity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiquidationAreaImplCopyWith<$Res>
    implements $LiquidationAreaCopyWith<$Res> {
  factory _$$LiquidationAreaImplCopyWith(_$LiquidationAreaImpl value,
          $Res Function(_$LiquidationAreaImpl) then) =
      __$$LiquidationAreaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double price, double size, double intensity});
}

/// @nodoc
class __$$LiquidationAreaImplCopyWithImpl<$Res>
    extends _$LiquidationAreaCopyWithImpl<$Res, _$LiquidationAreaImpl>
    implements _$$LiquidationAreaImplCopyWith<$Res> {
  __$$LiquidationAreaImplCopyWithImpl(
      _$LiquidationAreaImpl _value, $Res Function(_$LiquidationAreaImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiquidationArea
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? size = null,
    Object? intensity = null,
  }) {
    return _then(_$LiquidationAreaImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      intensity: null == intensity
          ? _value.intensity
          : intensity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiquidationAreaImpl implements _LiquidationArea {
  const _$LiquidationAreaImpl(
      {required this.price, required this.size, required this.intensity});

  factory _$LiquidationAreaImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiquidationAreaImplFromJson(json);

  /// The price level of the liquidation.
  @override
  final double price;

  /// Total estimated value of liquidations at this level.
  @override
  final double size;

  /// Intensity or probability (0.0 to 1.0) for heatmap rendering.
  @override
  final double intensity;

  @override
  String toString() {
    return 'LiquidationArea(price: $price, size: $size, intensity: $intensity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiquidationAreaImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, price, size, intensity);

  /// Create a copy of LiquidationArea
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiquidationAreaImplCopyWith<_$LiquidationAreaImpl> get copyWith =>
      __$$LiquidationAreaImplCopyWithImpl<_$LiquidationAreaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiquidationAreaImplToJson(
      this,
    );
  }
}

abstract class _LiquidationArea implements LiquidationArea {
  const factory _LiquidationArea(
      {required final double price,
      required final double size,
      required final double intensity}) = _$LiquidationAreaImpl;

  factory _LiquidationArea.fromJson(Map<String, dynamic> json) =
      _$LiquidationAreaImpl.fromJson;

  /// The price level of the liquidation.
  @override
  double get price;

  /// Total estimated value of liquidations at this level.
  @override
  double get size;

  /// Intensity or probability (0.0 to 1.0) for heatmap rendering.
  @override
  double get intensity;

  /// Create a copy of LiquidationArea
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiquidationAreaImplCopyWith<_$LiquidationAreaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
