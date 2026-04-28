// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiInsight {

/// The descriptive text of the insight.
 String get text;/// The type of pattern identified (e.g., "Bullish Engulfing").
 String get patternType;/// The severity of the insight.
 InsightSeverity get severity;
/// Create a copy of AiInsight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiInsightCopyWith<AiInsight> get copyWith => _$AiInsightCopyWithImpl<AiInsight>(this as AiInsight, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiInsight&&(identical(other.text, text) || other.text == text)&&(identical(other.patternType, patternType) || other.patternType == patternType)&&(identical(other.severity, severity) || other.severity == severity));
}


@override
int get hashCode => Object.hash(runtimeType,text,patternType,severity);

@override
String toString() {
  return 'AiInsight(text: $text, patternType: $patternType, severity: $severity)';
}


}

/// @nodoc
abstract mixin class $AiInsightCopyWith<$Res>  {
  factory $AiInsightCopyWith(AiInsight value, $Res Function(AiInsight) _then) = _$AiInsightCopyWithImpl;
@useResult
$Res call({
 String text, String patternType, InsightSeverity severity
});




}
/// @nodoc
class _$AiInsightCopyWithImpl<$Res>
    implements $AiInsightCopyWith<$Res> {
  _$AiInsightCopyWithImpl(this._self, this._then);

  final AiInsight _self;
  final $Res Function(AiInsight) _then;

/// Create a copy of AiInsight
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? patternType = null,Object? severity = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,patternType: null == patternType ? _self.patternType : patternType // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as InsightSeverity,
  ));
}

}


/// Adds pattern-matching-related methods to [AiInsight].
extension AiInsightPatterns on AiInsight {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiInsight value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiInsight() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiInsight value)  $default,){
final _that = this;
switch (_that) {
case _AiInsight():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiInsight value)?  $default,){
final _that = this;
switch (_that) {
case _AiInsight() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String patternType,  InsightSeverity severity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiInsight() when $default != null:
return $default(_that.text,_that.patternType,_that.severity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String patternType,  InsightSeverity severity)  $default,) {final _that = this;
switch (_that) {
case _AiInsight():
return $default(_that.text,_that.patternType,_that.severity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String patternType,  InsightSeverity severity)?  $default,) {final _that = this;
switch (_that) {
case _AiInsight() when $default != null:
return $default(_that.text,_that.patternType,_that.severity);case _:
  return null;

}
}

}

/// @nodoc


class _AiInsight implements AiInsight {
  const _AiInsight({required this.text, required this.patternType, required this.severity});
  

/// The descriptive text of the insight.
@override final  String text;
/// The type of pattern identified (e.g., "Bullish Engulfing").
@override final  String patternType;
/// The severity of the insight.
@override final  InsightSeverity severity;

/// Create a copy of AiInsight
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiInsightCopyWith<_AiInsight> get copyWith => __$AiInsightCopyWithImpl<_AiInsight>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiInsight&&(identical(other.text, text) || other.text == text)&&(identical(other.patternType, patternType) || other.patternType == patternType)&&(identical(other.severity, severity) || other.severity == severity));
}


@override
int get hashCode => Object.hash(runtimeType,text,patternType,severity);

@override
String toString() {
  return 'AiInsight(text: $text, patternType: $patternType, severity: $severity)';
}


}

/// @nodoc
abstract mixin class _$AiInsightCopyWith<$Res> implements $AiInsightCopyWith<$Res> {
  factory _$AiInsightCopyWith(_AiInsight value, $Res Function(_AiInsight) _then) = __$AiInsightCopyWithImpl;
@override @useResult
$Res call({
 String text, String patternType, InsightSeverity severity
});




}
/// @nodoc
class __$AiInsightCopyWithImpl<$Res>
    implements _$AiInsightCopyWith<$Res> {
  __$AiInsightCopyWithImpl(this._self, this._then);

  final _AiInsight _self;
  final $Res Function(_AiInsight) _then;

/// Create a copy of AiInsight
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? patternType = null,Object? severity = null,}) {
  return _then(_AiInsight(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,patternType: null == patternType ? _self.patternType : patternType // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as InsightSeverity,
  ));
}


}

// dart format on
