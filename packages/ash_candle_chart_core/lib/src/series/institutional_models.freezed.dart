// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'institutional_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolumeProfileBin {

/// The center price of this bin.
 double get price;/// Total volume traded at this price level.
 double get volume;/// Volume from buy orders (if available).
 double get buyVolume;/// Volume from sell orders (if available).
 double get sellVolume;
/// Create a copy of VolumeProfileBin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolumeProfileBinCopyWith<VolumeProfileBin> get copyWith => _$VolumeProfileBinCopyWithImpl<VolumeProfileBin>(this as VolumeProfileBin, _$identity);

  /// Serializes this VolumeProfileBin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolumeProfileBin&&(identical(other.price, price) || other.price == price)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.buyVolume, buyVolume) || other.buyVolume == buyVolume)&&(identical(other.sellVolume, sellVolume) || other.sellVolume == sellVolume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,volume,buyVolume,sellVolume);

@override
String toString() {
  return 'VolumeProfileBin(price: $price, volume: $volume, buyVolume: $buyVolume, sellVolume: $sellVolume)';
}


}

/// @nodoc
abstract mixin class $VolumeProfileBinCopyWith<$Res>  {
  factory $VolumeProfileBinCopyWith(VolumeProfileBin value, $Res Function(VolumeProfileBin) _then) = _$VolumeProfileBinCopyWithImpl;
@useResult
$Res call({
 double price, double volume, double buyVolume, double sellVolume
});




}
/// @nodoc
class _$VolumeProfileBinCopyWithImpl<$Res>
    implements $VolumeProfileBinCopyWith<$Res> {
  _$VolumeProfileBinCopyWithImpl(this._self, this._then);

  final VolumeProfileBin _self;
  final $Res Function(VolumeProfileBin) _then;

/// Create a copy of VolumeProfileBin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? volume = null,Object? buyVolume = null,Object? sellVolume = null,}) {
  return _then(_self.copyWith(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,buyVolume: null == buyVolume ? _self.buyVolume : buyVolume // ignore: cast_nullable_to_non_nullable
as double,sellVolume: null == sellVolume ? _self.sellVolume : sellVolume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [VolumeProfileBin].
extension VolumeProfileBinPatterns on VolumeProfileBin {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VolumeProfileBin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VolumeProfileBin() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VolumeProfileBin value)  $default,){
final _that = this;
switch (_that) {
case _VolumeProfileBin():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VolumeProfileBin value)?  $default,){
final _that = this;
switch (_that) {
case _VolumeProfileBin() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double price,  double volume,  double buyVolume,  double sellVolume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VolumeProfileBin() when $default != null:
return $default(_that.price,_that.volume,_that.buyVolume,_that.sellVolume);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double price,  double volume,  double buyVolume,  double sellVolume)  $default,) {final _that = this;
switch (_that) {
case _VolumeProfileBin():
return $default(_that.price,_that.volume,_that.buyVolume,_that.sellVolume);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double price,  double volume,  double buyVolume,  double sellVolume)?  $default,) {final _that = this;
switch (_that) {
case _VolumeProfileBin() when $default != null:
return $default(_that.price,_that.volume,_that.buyVolume,_that.sellVolume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VolumeProfileBin implements VolumeProfileBin {
  const _VolumeProfileBin({required this.price, required this.volume, this.buyVolume = 0.0, this.sellVolume = 0.0});
  factory _VolumeProfileBin.fromJson(Map<String, dynamic> json) => _$VolumeProfileBinFromJson(json);

/// The center price of this bin.
@override final  double price;
/// Total volume traded at this price level.
@override final  double volume;
/// Volume from buy orders (if available).
@override@JsonKey() final  double buyVolume;
/// Volume from sell orders (if available).
@override@JsonKey() final  double sellVolume;

/// Create a copy of VolumeProfileBin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolumeProfileBinCopyWith<_VolumeProfileBin> get copyWith => __$VolumeProfileBinCopyWithImpl<_VolumeProfileBin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolumeProfileBinToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolumeProfileBin&&(identical(other.price, price) || other.price == price)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.buyVolume, buyVolume) || other.buyVolume == buyVolume)&&(identical(other.sellVolume, sellVolume) || other.sellVolume == sellVolume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,volume,buyVolume,sellVolume);

@override
String toString() {
  return 'VolumeProfileBin(price: $price, volume: $volume, buyVolume: $buyVolume, sellVolume: $sellVolume)';
}


}

/// @nodoc
abstract mixin class _$VolumeProfileBinCopyWith<$Res> implements $VolumeProfileBinCopyWith<$Res> {
  factory _$VolumeProfileBinCopyWith(_VolumeProfileBin value, $Res Function(_VolumeProfileBin) _then) = __$VolumeProfileBinCopyWithImpl;
@override @useResult
$Res call({
 double price, double volume, double buyVolume, double sellVolume
});




}
/// @nodoc
class __$VolumeProfileBinCopyWithImpl<$Res>
    implements _$VolumeProfileBinCopyWith<$Res> {
  __$VolumeProfileBinCopyWithImpl(this._self, this._then);

  final _VolumeProfileBin _self;
  final $Res Function(_VolumeProfileBin) _then;

/// Create a copy of VolumeProfileBin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? volume = null,Object? buyVolume = null,Object? sellVolume = null,}) {
  return _then(_VolumeProfileBin(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,buyVolume: null == buyVolume ? _self.buyVolume : buyVolume // ignore: cast_nullable_to_non_nullable
as double,sellVolume: null == sellVolume ? _self.sellVolume : sellVolume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$VolumeProfile {

/// List of bins ordered by price.
 List<VolumeProfileBin> get bins;/// The price level with the highest volume (Point of Control).
 double get pocPrice;/// Maximum volume in a single bin (for scaling).
 double get maxVolume;
/// Create a copy of VolumeProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolumeProfileCopyWith<VolumeProfile> get copyWith => _$VolumeProfileCopyWithImpl<VolumeProfile>(this as VolumeProfile, _$identity);

  /// Serializes this VolumeProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolumeProfile&&const DeepCollectionEquality().equals(other.bins, bins)&&(identical(other.pocPrice, pocPrice) || other.pocPrice == pocPrice)&&(identical(other.maxVolume, maxVolume) || other.maxVolume == maxVolume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bins),pocPrice,maxVolume);

@override
String toString() {
  return 'VolumeProfile(bins: $bins, pocPrice: $pocPrice, maxVolume: $maxVolume)';
}


}

/// @nodoc
abstract mixin class $VolumeProfileCopyWith<$Res>  {
  factory $VolumeProfileCopyWith(VolumeProfile value, $Res Function(VolumeProfile) _then) = _$VolumeProfileCopyWithImpl;
@useResult
$Res call({
 List<VolumeProfileBin> bins, double pocPrice, double maxVolume
});




}
/// @nodoc
class _$VolumeProfileCopyWithImpl<$Res>
    implements $VolumeProfileCopyWith<$Res> {
  _$VolumeProfileCopyWithImpl(this._self, this._then);

  final VolumeProfile _self;
  final $Res Function(VolumeProfile) _then;

/// Create a copy of VolumeProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bins = null,Object? pocPrice = null,Object? maxVolume = null,}) {
  return _then(_self.copyWith(
bins: null == bins ? _self.bins : bins // ignore: cast_nullable_to_non_nullable
as List<VolumeProfileBin>,pocPrice: null == pocPrice ? _self.pocPrice : pocPrice // ignore: cast_nullable_to_non_nullable
as double,maxVolume: null == maxVolume ? _self.maxVolume : maxVolume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [VolumeProfile].
extension VolumeProfilePatterns on VolumeProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VolumeProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VolumeProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VolumeProfile value)  $default,){
final _that = this;
switch (_that) {
case _VolumeProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VolumeProfile value)?  $default,){
final _that = this;
switch (_that) {
case _VolumeProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VolumeProfileBin> bins,  double pocPrice,  double maxVolume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VolumeProfile() when $default != null:
return $default(_that.bins,_that.pocPrice,_that.maxVolume);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VolumeProfileBin> bins,  double pocPrice,  double maxVolume)  $default,) {final _that = this;
switch (_that) {
case _VolumeProfile():
return $default(_that.bins,_that.pocPrice,_that.maxVolume);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VolumeProfileBin> bins,  double pocPrice,  double maxVolume)?  $default,) {final _that = this;
switch (_that) {
case _VolumeProfile() when $default != null:
return $default(_that.bins,_that.pocPrice,_that.maxVolume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VolumeProfile implements VolumeProfile {
  const _VolumeProfile({required final  List<VolumeProfileBin> bins, required this.pocPrice, required this.maxVolume}): _bins = bins;
  factory _VolumeProfile.fromJson(Map<String, dynamic> json) => _$VolumeProfileFromJson(json);

/// List of bins ordered by price.
 final  List<VolumeProfileBin> _bins;
/// List of bins ordered by price.
@override List<VolumeProfileBin> get bins {
  if (_bins is EqualUnmodifiableListView) return _bins;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bins);
}

/// The price level with the highest volume (Point of Control).
@override final  double pocPrice;
/// Maximum volume in a single bin (for scaling).
@override final  double maxVolume;

/// Create a copy of VolumeProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolumeProfileCopyWith<_VolumeProfile> get copyWith => __$VolumeProfileCopyWithImpl<_VolumeProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolumeProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolumeProfile&&const DeepCollectionEquality().equals(other._bins, _bins)&&(identical(other.pocPrice, pocPrice) || other.pocPrice == pocPrice)&&(identical(other.maxVolume, maxVolume) || other.maxVolume == maxVolume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bins),pocPrice,maxVolume);

@override
String toString() {
  return 'VolumeProfile(bins: $bins, pocPrice: $pocPrice, maxVolume: $maxVolume)';
}


}

/// @nodoc
abstract mixin class _$VolumeProfileCopyWith<$Res> implements $VolumeProfileCopyWith<$Res> {
  factory _$VolumeProfileCopyWith(_VolumeProfile value, $Res Function(_VolumeProfile) _then) = __$VolumeProfileCopyWithImpl;
@override @useResult
$Res call({
 List<VolumeProfileBin> bins, double pocPrice, double maxVolume
});




}
/// @nodoc
class __$VolumeProfileCopyWithImpl<$Res>
    implements _$VolumeProfileCopyWith<$Res> {
  __$VolumeProfileCopyWithImpl(this._self, this._then);

  final _VolumeProfile _self;
  final $Res Function(_VolumeProfile) _then;

/// Create a copy of VolumeProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bins = null,Object? pocPrice = null,Object? maxVolume = null,}) {
  return _then(_VolumeProfile(
bins: null == bins ? _self._bins : bins // ignore: cast_nullable_to_non_nullable
as List<VolumeProfileBin>,pocPrice: null == pocPrice ? _self.pocPrice : pocPrice // ignore: cast_nullable_to_non_nullable
as double,maxVolume: null == maxVolume ? _self.maxVolume : maxVolume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$OrderBookEntry {

/// The price of the order.
 double get price;/// The amount/size at this price.
 double get size;/// Cumulative size up to this price level.
 double get cumulativeSize;
/// Create a copy of OrderBookEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderBookEntryCopyWith<OrderBookEntry> get copyWith => _$OrderBookEntryCopyWithImpl<OrderBookEntry>(this as OrderBookEntry, _$identity);

  /// Serializes this OrderBookEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderBookEntry&&(identical(other.price, price) || other.price == price)&&(identical(other.size, size) || other.size == size)&&(identical(other.cumulativeSize, cumulativeSize) || other.cumulativeSize == cumulativeSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,size,cumulativeSize);

@override
String toString() {
  return 'OrderBookEntry(price: $price, size: $size, cumulativeSize: $cumulativeSize)';
}


}

/// @nodoc
abstract mixin class $OrderBookEntryCopyWith<$Res>  {
  factory $OrderBookEntryCopyWith(OrderBookEntry value, $Res Function(OrderBookEntry) _then) = _$OrderBookEntryCopyWithImpl;
@useResult
$Res call({
 double price, double size, double cumulativeSize
});




}
/// @nodoc
class _$OrderBookEntryCopyWithImpl<$Res>
    implements $OrderBookEntryCopyWith<$Res> {
  _$OrderBookEntryCopyWithImpl(this._self, this._then);

  final OrderBookEntry _self;
  final $Res Function(OrderBookEntry) _then;

/// Create a copy of OrderBookEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? size = null,Object? cumulativeSize = null,}) {
  return _then(_self.copyWith(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,cumulativeSize: null == cumulativeSize ? _self.cumulativeSize : cumulativeSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderBookEntry].
extension OrderBookEntryPatterns on OrderBookEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderBookEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderBookEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderBookEntry value)  $default,){
final _that = this;
switch (_that) {
case _OrderBookEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderBookEntry value)?  $default,){
final _that = this;
switch (_that) {
case _OrderBookEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double price,  double size,  double cumulativeSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderBookEntry() when $default != null:
return $default(_that.price,_that.size,_that.cumulativeSize);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double price,  double size,  double cumulativeSize)  $default,) {final _that = this;
switch (_that) {
case _OrderBookEntry():
return $default(_that.price,_that.size,_that.cumulativeSize);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double price,  double size,  double cumulativeSize)?  $default,) {final _that = this;
switch (_that) {
case _OrderBookEntry() when $default != null:
return $default(_that.price,_that.size,_that.cumulativeSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderBookEntry implements OrderBookEntry {
  const _OrderBookEntry({required this.price, required this.size, this.cumulativeSize = 0.0});
  factory _OrderBookEntry.fromJson(Map<String, dynamic> json) => _$OrderBookEntryFromJson(json);

/// The price of the order.
@override final  double price;
/// The amount/size at this price.
@override final  double size;
/// Cumulative size up to this price level.
@override@JsonKey() final  double cumulativeSize;

/// Create a copy of OrderBookEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderBookEntryCopyWith<_OrderBookEntry> get copyWith => __$OrderBookEntryCopyWithImpl<_OrderBookEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderBookEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderBookEntry&&(identical(other.price, price) || other.price == price)&&(identical(other.size, size) || other.size == size)&&(identical(other.cumulativeSize, cumulativeSize) || other.cumulativeSize == cumulativeSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,size,cumulativeSize);

@override
String toString() {
  return 'OrderBookEntry(price: $price, size: $size, cumulativeSize: $cumulativeSize)';
}


}

/// @nodoc
abstract mixin class _$OrderBookEntryCopyWith<$Res> implements $OrderBookEntryCopyWith<$Res> {
  factory _$OrderBookEntryCopyWith(_OrderBookEntry value, $Res Function(_OrderBookEntry) _then) = __$OrderBookEntryCopyWithImpl;
@override @useResult
$Res call({
 double price, double size, double cumulativeSize
});




}
/// @nodoc
class __$OrderBookEntryCopyWithImpl<$Res>
    implements _$OrderBookEntryCopyWith<$Res> {
  __$OrderBookEntryCopyWithImpl(this._self, this._then);

  final _OrderBookEntry _self;
  final $Res Function(_OrderBookEntry) _then;

/// Create a copy of OrderBookEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? size = null,Object? cumulativeSize = null,}) {
  return _then(_OrderBookEntry(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,cumulativeSize: null == cumulativeSize ? _self.cumulativeSize : cumulativeSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$OrderBook {

/// List of buy orders (bids), sorted by price descending.
 List<OrderBookEntry> get bids;/// List of sell orders (asks), sorted by price ascending.
 List<OrderBookEntry> get asks;/// Timestamp of the last update.
 int get timestamp;
/// Create a copy of OrderBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderBookCopyWith<OrderBook> get copyWith => _$OrderBookCopyWithImpl<OrderBook>(this as OrderBook, _$identity);

  /// Serializes this OrderBook to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderBook&&const DeepCollectionEquality().equals(other.bids, bids)&&const DeepCollectionEquality().equals(other.asks, asks)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bids),const DeepCollectionEquality().hash(asks),timestamp);

@override
String toString() {
  return 'OrderBook(bids: $bids, asks: $asks, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $OrderBookCopyWith<$Res>  {
  factory $OrderBookCopyWith(OrderBook value, $Res Function(OrderBook) _then) = _$OrderBookCopyWithImpl;
@useResult
$Res call({
 List<OrderBookEntry> bids, List<OrderBookEntry> asks, int timestamp
});




}
/// @nodoc
class _$OrderBookCopyWithImpl<$Res>
    implements $OrderBookCopyWith<$Res> {
  _$OrderBookCopyWithImpl(this._self, this._then);

  final OrderBook _self;
  final $Res Function(OrderBook) _then;

/// Create a copy of OrderBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bids = null,Object? asks = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
bids: null == bids ? _self.bids : bids // ignore: cast_nullable_to_non_nullable
as List<OrderBookEntry>,asks: null == asks ? _self.asks : asks // ignore: cast_nullable_to_non_nullable
as List<OrderBookEntry>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderBook].
extension OrderBookPatterns on OrderBook {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderBook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderBook() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderBook value)  $default,){
final _that = this;
switch (_that) {
case _OrderBook():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderBook value)?  $default,){
final _that = this;
switch (_that) {
case _OrderBook() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OrderBookEntry> bids,  List<OrderBookEntry> asks,  int timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderBook() when $default != null:
return $default(_that.bids,_that.asks,_that.timestamp);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OrderBookEntry> bids,  List<OrderBookEntry> asks,  int timestamp)  $default,) {final _that = this;
switch (_that) {
case _OrderBook():
return $default(_that.bids,_that.asks,_that.timestamp);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OrderBookEntry> bids,  List<OrderBookEntry> asks,  int timestamp)?  $default,) {final _that = this;
switch (_that) {
case _OrderBook() when $default != null:
return $default(_that.bids,_that.asks,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderBook implements OrderBook {
  const _OrderBook({required final  List<OrderBookEntry> bids, required final  List<OrderBookEntry> asks, required this.timestamp}): _bids = bids,_asks = asks;
  factory _OrderBook.fromJson(Map<String, dynamic> json) => _$OrderBookFromJson(json);

/// List of buy orders (bids), sorted by price descending.
 final  List<OrderBookEntry> _bids;
/// List of buy orders (bids), sorted by price descending.
@override List<OrderBookEntry> get bids {
  if (_bids is EqualUnmodifiableListView) return _bids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bids);
}

/// List of sell orders (asks), sorted by price ascending.
 final  List<OrderBookEntry> _asks;
/// List of sell orders (asks), sorted by price ascending.
@override List<OrderBookEntry> get asks {
  if (_asks is EqualUnmodifiableListView) return _asks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_asks);
}

/// Timestamp of the last update.
@override final  int timestamp;

/// Create a copy of OrderBook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderBookCopyWith<_OrderBook> get copyWith => __$OrderBookCopyWithImpl<_OrderBook>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderBookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderBook&&const DeepCollectionEquality().equals(other._bids, _bids)&&const DeepCollectionEquality().equals(other._asks, _asks)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bids),const DeepCollectionEquality().hash(_asks),timestamp);

@override
String toString() {
  return 'OrderBook(bids: $bids, asks: $asks, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$OrderBookCopyWith<$Res> implements $OrderBookCopyWith<$Res> {
  factory _$OrderBookCopyWith(_OrderBook value, $Res Function(_OrderBook) _then) = __$OrderBookCopyWithImpl;
@override @useResult
$Res call({
 List<OrderBookEntry> bids, List<OrderBookEntry> asks, int timestamp
});




}
/// @nodoc
class __$OrderBookCopyWithImpl<$Res>
    implements _$OrderBookCopyWith<$Res> {
  __$OrderBookCopyWithImpl(this._self, this._then);

  final _OrderBook _self;
  final $Res Function(_OrderBook) _then;

/// Create a copy of OrderBook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bids = null,Object? asks = null,Object? timestamp = null,}) {
  return _then(_OrderBook(
bids: null == bids ? _self._bids : bids // ignore: cast_nullable_to_non_nullable
as List<OrderBookEntry>,asks: null == asks ? _self._asks : asks // ignore: cast_nullable_to_non_nullable
as List<OrderBookEntry>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$LiquidationArea {

/// The price level of the liquidation.
 double get price;/// Total estimated value of liquidations at this level.
 double get size;/// Intensity or probability (0.0 to 1.0) for heatmap rendering.
 double get intensity;
/// Create a copy of LiquidationArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiquidationAreaCopyWith<LiquidationArea> get copyWith => _$LiquidationAreaCopyWithImpl<LiquidationArea>(this as LiquidationArea, _$identity);

  /// Serializes this LiquidationArea to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiquidationArea&&(identical(other.price, price) || other.price == price)&&(identical(other.size, size) || other.size == size)&&(identical(other.intensity, intensity) || other.intensity == intensity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,size,intensity);

@override
String toString() {
  return 'LiquidationArea(price: $price, size: $size, intensity: $intensity)';
}


}

/// @nodoc
abstract mixin class $LiquidationAreaCopyWith<$Res>  {
  factory $LiquidationAreaCopyWith(LiquidationArea value, $Res Function(LiquidationArea) _then) = _$LiquidationAreaCopyWithImpl;
@useResult
$Res call({
 double price, double size, double intensity
});




}
/// @nodoc
class _$LiquidationAreaCopyWithImpl<$Res>
    implements $LiquidationAreaCopyWith<$Res> {
  _$LiquidationAreaCopyWithImpl(this._self, this._then);

  final LiquidationArea _self;
  final $Res Function(LiquidationArea) _then;

/// Create a copy of LiquidationArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? size = null,Object? intensity = null,}) {
  return _then(_self.copyWith(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,intensity: null == intensity ? _self.intensity : intensity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LiquidationArea].
extension LiquidationAreaPatterns on LiquidationArea {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiquidationArea value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiquidationArea() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiquidationArea value)  $default,){
final _that = this;
switch (_that) {
case _LiquidationArea():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiquidationArea value)?  $default,){
final _that = this;
switch (_that) {
case _LiquidationArea() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double price,  double size,  double intensity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiquidationArea() when $default != null:
return $default(_that.price,_that.size,_that.intensity);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double price,  double size,  double intensity)  $default,) {final _that = this;
switch (_that) {
case _LiquidationArea():
return $default(_that.price,_that.size,_that.intensity);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double price,  double size,  double intensity)?  $default,) {final _that = this;
switch (_that) {
case _LiquidationArea() when $default != null:
return $default(_that.price,_that.size,_that.intensity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiquidationArea implements LiquidationArea {
  const _LiquidationArea({required this.price, required this.size, required this.intensity});
  factory _LiquidationArea.fromJson(Map<String, dynamic> json) => _$LiquidationAreaFromJson(json);

/// The price level of the liquidation.
@override final  double price;
/// Total estimated value of liquidations at this level.
@override final  double size;
/// Intensity or probability (0.0 to 1.0) for heatmap rendering.
@override final  double intensity;

/// Create a copy of LiquidationArea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiquidationAreaCopyWith<_LiquidationArea> get copyWith => __$LiquidationAreaCopyWithImpl<_LiquidationArea>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiquidationAreaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiquidationArea&&(identical(other.price, price) || other.price == price)&&(identical(other.size, size) || other.size == size)&&(identical(other.intensity, intensity) || other.intensity == intensity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,size,intensity);

@override
String toString() {
  return 'LiquidationArea(price: $price, size: $size, intensity: $intensity)';
}


}

/// @nodoc
abstract mixin class _$LiquidationAreaCopyWith<$Res> implements $LiquidationAreaCopyWith<$Res> {
  factory _$LiquidationAreaCopyWith(_LiquidationArea value, $Res Function(_LiquidationArea) _then) = __$LiquidationAreaCopyWithImpl;
@override @useResult
$Res call({
 double price, double size, double intensity
});




}
/// @nodoc
class __$LiquidationAreaCopyWithImpl<$Res>
    implements _$LiquidationAreaCopyWith<$Res> {
  __$LiquidationAreaCopyWithImpl(this._self, this._then);

  final _LiquidationArea _self;
  final $Res Function(_LiquidationArea) _then;

/// Create a copy of LiquidationArea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? size = null,Object? intensity = null,}) {
  return _then(_LiquidationArea(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,intensity: null == intensity ? _self.intensity : intensity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
