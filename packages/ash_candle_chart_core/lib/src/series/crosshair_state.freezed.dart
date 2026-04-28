// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crosshair_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CrosshairState {

/// Horizontal position in local pixels.
 double? get dx;/// Vertical position in local pixels.
 double? get dy;/// The timestamp at the current horizontal position.
 int? get timestamp;/// The price (or value) at the current vertical position.
 double? get price;
/// Create a copy of CrosshairState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrosshairStateCopyWith<CrosshairState> get copyWith => _$CrosshairStateCopyWithImpl<CrosshairState>(this as CrosshairState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrosshairState&&(identical(other.dx, dx) || other.dx == dx)&&(identical(other.dy, dy) || other.dy == dy)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,dx,dy,timestamp,price);

@override
String toString() {
  return 'CrosshairState(dx: $dx, dy: $dy, timestamp: $timestamp, price: $price)';
}


}

/// @nodoc
abstract mixin class $CrosshairStateCopyWith<$Res>  {
  factory $CrosshairStateCopyWith(CrosshairState value, $Res Function(CrosshairState) _then) = _$CrosshairStateCopyWithImpl;
@useResult
$Res call({
 double? dx, double? dy, int? timestamp, double? price
});




}
/// @nodoc
class _$CrosshairStateCopyWithImpl<$Res>
    implements $CrosshairStateCopyWith<$Res> {
  _$CrosshairStateCopyWithImpl(this._self, this._then);

  final CrosshairState _self;
  final $Res Function(CrosshairState) _then;

/// Create a copy of CrosshairState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dx = freezed,Object? dy = freezed,Object? timestamp = freezed,Object? price = freezed,}) {
  return _then(_self.copyWith(
dx: freezed == dx ? _self.dx : dx // ignore: cast_nullable_to_non_nullable
as double?,dy: freezed == dy ? _self.dy : dy // ignore: cast_nullable_to_non_nullable
as double?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CrosshairState].
extension CrosshairStatePatterns on CrosshairState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CrosshairState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CrosshairState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CrosshairState value)  $default,){
final _that = this;
switch (_that) {
case _CrosshairState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CrosshairState value)?  $default,){
final _that = this;
switch (_that) {
case _CrosshairState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? dx,  double? dy,  int? timestamp,  double? price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CrosshairState() when $default != null:
return $default(_that.dx,_that.dy,_that.timestamp,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? dx,  double? dy,  int? timestamp,  double? price)  $default,) {final _that = this;
switch (_that) {
case _CrosshairState():
return $default(_that.dx,_that.dy,_that.timestamp,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? dx,  double? dy,  int? timestamp,  double? price)?  $default,) {final _that = this;
switch (_that) {
case _CrosshairState() when $default != null:
return $default(_that.dx,_that.dy,_that.timestamp,_that.price);case _:
  return null;

}
}

}

/// @nodoc


class _CrosshairState implements CrosshairState {
  const _CrosshairState({this.dx, this.dy, this.timestamp, this.price});
  

/// Horizontal position in local pixels.
@override final  double? dx;
/// Vertical position in local pixels.
@override final  double? dy;
/// The timestamp at the current horizontal position.
@override final  int? timestamp;
/// The price (or value) at the current vertical position.
@override final  double? price;

/// Create a copy of CrosshairState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CrosshairStateCopyWith<_CrosshairState> get copyWith => __$CrosshairStateCopyWithImpl<_CrosshairState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CrosshairState&&(identical(other.dx, dx) || other.dx == dx)&&(identical(other.dy, dy) || other.dy == dy)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,dx,dy,timestamp,price);

@override
String toString() {
  return 'CrosshairState(dx: $dx, dy: $dy, timestamp: $timestamp, price: $price)';
}


}

/// @nodoc
abstract mixin class _$CrosshairStateCopyWith<$Res> implements $CrosshairStateCopyWith<$Res> {
  factory _$CrosshairStateCopyWith(_CrosshairState value, $Res Function(_CrosshairState) _then) = __$CrosshairStateCopyWithImpl;
@override @useResult
$Res call({
 double? dx, double? dy, int? timestamp, double? price
});




}
/// @nodoc
class __$CrosshairStateCopyWithImpl<$Res>
    implements _$CrosshairStateCopyWith<$Res> {
  __$CrosshairStateCopyWithImpl(this._self, this._then);

  final _CrosshairState _self;
  final $Res Function(_CrosshairState) _then;

/// Create a copy of CrosshairState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dx = freezed,Object? dy = freezed,Object? timestamp = freezed,Object? price = freezed,}) {
  return _then(_CrosshairState(
dx: freezed == dx ? _self.dx : dx // ignore: cast_nullable_to_non_nullable
as double?,dy: freezed == dy ? _self.dy : dy // ignore: cast_nullable_to_non_nullable
as double?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
