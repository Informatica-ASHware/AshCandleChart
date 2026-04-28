// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sma.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SMAConfig {

 String get id; int get period; List<String> get dependsOn;
/// Create a copy of SMAConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SMAConfigCopyWith<SMAConfig> get copyWith => _$SMAConfigCopyWithImpl<SMAConfig>(this as SMAConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SMAConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other.dependsOn, dependsOn));
}


@override
int get hashCode => Object.hash(runtimeType,id,period,const DeepCollectionEquality().hash(dependsOn));

@override
String toString() {
  return 'SMAConfig(id: $id, period: $period, dependsOn: $dependsOn)';
}


}

/// @nodoc
abstract mixin class $SMAConfigCopyWith<$Res>  {
  factory $SMAConfigCopyWith(SMAConfig value, $Res Function(SMAConfig) _then) = _$SMAConfigCopyWithImpl;
@useResult
$Res call({
 String id, int period, List<String> dependsOn
});




}
/// @nodoc
class _$SMAConfigCopyWithImpl<$Res>
    implements $SMAConfigCopyWith<$Res> {
  _$SMAConfigCopyWithImpl(this._self, this._then);

  final SMAConfig _self;
  final $Res Function(SMAConfig) _then;

/// Create a copy of SMAConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? period = null,Object? dependsOn = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as int,dependsOn: null == dependsOn ? _self.dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SMAConfig].
extension SMAConfigPatterns on SMAConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SMAConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SMAConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SMAConfig value)  $default,){
final _that = this;
switch (_that) {
case _SMAConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SMAConfig value)?  $default,){
final _that = this;
switch (_that) {
case _SMAConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int period,  List<String> dependsOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SMAConfig() when $default != null:
return $default(_that.id,_that.period,_that.dependsOn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int period,  List<String> dependsOn)  $default,) {final _that = this;
switch (_that) {
case _SMAConfig():
return $default(_that.id,_that.period,_that.dependsOn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int period,  List<String> dependsOn)?  $default,) {final _that = this;
switch (_that) {
case _SMAConfig() when $default != null:
return $default(_that.id,_that.period,_that.dependsOn);case _:
  return null;

}
}

}

/// @nodoc


class _SMAConfig implements SMAConfig {
  const _SMAConfig({required this.id, this.period = 20, final  List<String> dependsOn = const []}): _dependsOn = dependsOn;
  

@override final  String id;
@override@JsonKey() final  int period;
 final  List<String> _dependsOn;
@override@JsonKey() List<String> get dependsOn {
  if (_dependsOn is EqualUnmodifiableListView) return _dependsOn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dependsOn);
}


/// Create a copy of SMAConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SMAConfigCopyWith<_SMAConfig> get copyWith => __$SMAConfigCopyWithImpl<_SMAConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SMAConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other._dependsOn, _dependsOn));
}


@override
int get hashCode => Object.hash(runtimeType,id,period,const DeepCollectionEquality().hash(_dependsOn));

@override
String toString() {
  return 'SMAConfig(id: $id, period: $period, dependsOn: $dependsOn)';
}


}

/// @nodoc
abstract mixin class _$SMAConfigCopyWith<$Res> implements $SMAConfigCopyWith<$Res> {
  factory _$SMAConfigCopyWith(_SMAConfig value, $Res Function(_SMAConfig) _then) = __$SMAConfigCopyWithImpl;
@override @useResult
$Res call({
 String id, int period, List<String> dependsOn
});




}
/// @nodoc
class __$SMAConfigCopyWithImpl<$Res>
    implements _$SMAConfigCopyWith<$Res> {
  __$SMAConfigCopyWithImpl(this._self, this._then);

  final _SMAConfig _self;
  final $Res Function(_SMAConfig) _then;

/// Create a copy of SMAConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? period = null,Object? dependsOn = null,}) {
  return _then(_SMAConfig(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as int,dependsOn: null == dependsOn ? _self._dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
