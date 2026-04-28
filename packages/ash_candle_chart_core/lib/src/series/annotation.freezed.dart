// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnnotationPoint {

/// Unix timestamp in milliseconds.
 int get timestamp;/// Price value.
 double get price;
/// Create a copy of AnnotationPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnotationPointCopyWith<AnnotationPoint> get copyWith => _$AnnotationPointCopyWithImpl<AnnotationPoint>(this as AnnotationPoint, _$identity);

  /// Serializes this AnnotationPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnotationPoint&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,price);

@override
String toString() {
  return 'AnnotationPoint(timestamp: $timestamp, price: $price)';
}


}

/// @nodoc
abstract mixin class $AnnotationPointCopyWith<$Res>  {
  factory $AnnotationPointCopyWith(AnnotationPoint value, $Res Function(AnnotationPoint) _then) = _$AnnotationPointCopyWithImpl;
@useResult
$Res call({
 int timestamp, double price
});




}
/// @nodoc
class _$AnnotationPointCopyWithImpl<$Res>
    implements $AnnotationPointCopyWith<$Res> {
  _$AnnotationPointCopyWithImpl(this._self, this._then);

  final AnnotationPoint _self;
  final $Res Function(AnnotationPoint) _then;

/// Create a copy of AnnotationPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? price = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnotationPoint].
extension AnnotationPointPatterns on AnnotationPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnotationPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnotationPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnotationPoint value)  $default,){
final _that = this;
switch (_that) {
case _AnnotationPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnotationPoint value)?  $default,){
final _that = this;
switch (_that) {
case _AnnotationPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int timestamp,  double price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnotationPoint() when $default != null:
return $default(_that.timestamp,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int timestamp,  double price)  $default,) {final _that = this;
switch (_that) {
case _AnnotationPoint():
return $default(_that.timestamp,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int timestamp,  double price)?  $default,) {final _that = this;
switch (_that) {
case _AnnotationPoint() when $default != null:
return $default(_that.timestamp,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnnotationPoint implements AnnotationPoint {
  const _AnnotationPoint({required this.timestamp, required this.price});
  factory _AnnotationPoint.fromJson(Map<String, dynamic> json) => _$AnnotationPointFromJson(json);

/// Unix timestamp in milliseconds.
@override final  int timestamp;
/// Price value.
@override final  double price;

/// Create a copy of AnnotationPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnotationPointCopyWith<_AnnotationPoint> get copyWith => __$AnnotationPointCopyWithImpl<_AnnotationPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnnotationPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnotationPoint&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,price);

@override
String toString() {
  return 'AnnotationPoint(timestamp: $timestamp, price: $price)';
}


}

/// @nodoc
abstract mixin class _$AnnotationPointCopyWith<$Res> implements $AnnotationPointCopyWith<$Res> {
  factory _$AnnotationPointCopyWith(_AnnotationPoint value, $Res Function(_AnnotationPoint) _then) = __$AnnotationPointCopyWithImpl;
@override @useResult
$Res call({
 int timestamp, double price
});




}
/// @nodoc
class __$AnnotationPointCopyWithImpl<$Res>
    implements _$AnnotationPointCopyWith<$Res> {
  __$AnnotationPointCopyWithImpl(this._self, this._then);

  final _AnnotationPoint _self;
  final $Res Function(_AnnotationPoint) _then;

/// Create a copy of AnnotationPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? price = null,}) {
  return _then(_AnnotationPoint(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$Annotation {

/// Unique identifier for the annotation.
 String get id;/// The starting point of the trend line.
 AnnotationPoint get start;/// The ending point of the trend line.
 AnnotationPoint get end;/// Hex color of the line.
 int get color;/// Width of the line.
 double get strokeWidth;
/// Create a copy of Annotation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnotationCopyWith<Annotation> get copyWith => _$AnnotationCopyWithImpl<Annotation>(this as Annotation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Annotation&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.color, color) || other.color == color)&&(identical(other.strokeWidth, strokeWidth) || other.strokeWidth == strokeWidth));
}


@override
int get hashCode => Object.hash(runtimeType,id,start,end,color,strokeWidth);

@override
String toString() {
  return 'Annotation(id: $id, start: $start, end: $end, color: $color, strokeWidth: $strokeWidth)';
}


}

/// @nodoc
abstract mixin class $AnnotationCopyWith<$Res>  {
  factory $AnnotationCopyWith(Annotation value, $Res Function(Annotation) _then) = _$AnnotationCopyWithImpl;
@useResult
$Res call({
 String id, AnnotationPoint start, AnnotationPoint end, int color, double strokeWidth
});


$AnnotationPointCopyWith<$Res> get start;$AnnotationPointCopyWith<$Res> get end;

}
/// @nodoc
class _$AnnotationCopyWithImpl<$Res>
    implements $AnnotationCopyWith<$Res> {
  _$AnnotationCopyWithImpl(this._self, this._then);

  final Annotation _self;
  final $Res Function(Annotation) _then;

/// Create a copy of Annotation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? start = null,Object? end = null,Object? color = null,Object? strokeWidth = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as AnnotationPoint,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as AnnotationPoint,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,strokeWidth: null == strokeWidth ? _self.strokeWidth : strokeWidth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of Annotation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnotationPointCopyWith<$Res> get start {
  
  return $AnnotationPointCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}/// Create a copy of Annotation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnotationPointCopyWith<$Res> get end {
  
  return $AnnotationPointCopyWith<$Res>(_self.end, (value) {
    return _then(_self.copyWith(end: value));
  });
}
}


/// Adds pattern-matching-related methods to [Annotation].
extension AnnotationPatterns on Annotation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrendLine value)?  trendLine,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrendLine() when trendLine != null:
return trendLine(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrendLine value)  trendLine,}){
final _that = this;
switch (_that) {
case TrendLine():
return trendLine(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrendLine value)?  trendLine,}){
final _that = this;
switch (_that) {
case TrendLine() when trendLine != null:
return trendLine(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  AnnotationPoint start,  AnnotationPoint end,  int color,  double strokeWidth)?  trendLine,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrendLine() when trendLine != null:
return trendLine(_that.id,_that.start,_that.end,_that.color,_that.strokeWidth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  AnnotationPoint start,  AnnotationPoint end,  int color,  double strokeWidth)  trendLine,}) {final _that = this;
switch (_that) {
case TrendLine():
return trendLine(_that.id,_that.start,_that.end,_that.color,_that.strokeWidth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  AnnotationPoint start,  AnnotationPoint end,  int color,  double strokeWidth)?  trendLine,}) {final _that = this;
switch (_that) {
case TrendLine() when trendLine != null:
return trendLine(_that.id,_that.start,_that.end,_that.color,_that.strokeWidth);case _:
  return null;

}
}

}

/// @nodoc


class TrendLine extends Annotation {
  const TrendLine({required this.id, required this.start, required this.end, this.color = 0xFF2196F3, this.strokeWidth = 2.0}): super._();
  

/// Unique identifier for the annotation.
@override final  String id;
/// The starting point of the trend line.
@override final  AnnotationPoint start;
/// The ending point of the trend line.
@override final  AnnotationPoint end;
/// Hex color of the line.
@override@JsonKey() final  int color;
/// Width of the line.
@override@JsonKey() final  double strokeWidth;

/// Create a copy of Annotation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendLineCopyWith<TrendLine> get copyWith => _$TrendLineCopyWithImpl<TrendLine>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendLine&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.color, color) || other.color == color)&&(identical(other.strokeWidth, strokeWidth) || other.strokeWidth == strokeWidth));
}


@override
int get hashCode => Object.hash(runtimeType,id,start,end,color,strokeWidth);

@override
String toString() {
  return 'Annotation.trendLine(id: $id, start: $start, end: $end, color: $color, strokeWidth: $strokeWidth)';
}


}

/// @nodoc
abstract mixin class $TrendLineCopyWith<$Res> implements $AnnotationCopyWith<$Res> {
  factory $TrendLineCopyWith(TrendLine value, $Res Function(TrendLine) _then) = _$TrendLineCopyWithImpl;
@override @useResult
$Res call({
 String id, AnnotationPoint start, AnnotationPoint end, int color, double strokeWidth
});


@override $AnnotationPointCopyWith<$Res> get start;@override $AnnotationPointCopyWith<$Res> get end;

}
/// @nodoc
class _$TrendLineCopyWithImpl<$Res>
    implements $TrendLineCopyWith<$Res> {
  _$TrendLineCopyWithImpl(this._self, this._then);

  final TrendLine _self;
  final $Res Function(TrendLine) _then;

/// Create a copy of Annotation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? start = null,Object? end = null,Object? color = null,Object? strokeWidth = null,}) {
  return _then(TrendLine(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as AnnotationPoint,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as AnnotationPoint,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,strokeWidth: null == strokeWidth ? _self.strokeWidth : strokeWidth // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of Annotation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnotationPointCopyWith<$Res> get start {
  
  return $AnnotationPointCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}/// Create a copy of Annotation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnotationPointCopyWith<$Res> get end {
  
  return $AnnotationPointCopyWith<$Res>(_self.end, (value) {
    return _then(_self.copyWith(end: value));
  });
}
}

/// @nodoc
mixin _$AnnotationDocument {

/// List of annotations in the document.
 List<Annotation> get annotations;
/// Create a copy of AnnotationDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnnotationDocumentCopyWith<AnnotationDocument> get copyWith => _$AnnotationDocumentCopyWithImpl<AnnotationDocument>(this as AnnotationDocument, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnnotationDocument&&const DeepCollectionEquality().equals(other.annotations, annotations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(annotations));

@override
String toString() {
  return 'AnnotationDocument(annotations: $annotations)';
}


}

/// @nodoc
abstract mixin class $AnnotationDocumentCopyWith<$Res>  {
  factory $AnnotationDocumentCopyWith(AnnotationDocument value, $Res Function(AnnotationDocument) _then) = _$AnnotationDocumentCopyWithImpl;
@useResult
$Res call({
 List<Annotation> annotations
});




}
/// @nodoc
class _$AnnotationDocumentCopyWithImpl<$Res>
    implements $AnnotationDocumentCopyWith<$Res> {
  _$AnnotationDocumentCopyWithImpl(this._self, this._then);

  final AnnotationDocument _self;
  final $Res Function(AnnotationDocument) _then;

/// Create a copy of AnnotationDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? annotations = null,}) {
  return _then(_self.copyWith(
annotations: null == annotations ? _self.annotations : annotations // ignore: cast_nullable_to_non_nullable
as List<Annotation>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnnotationDocument].
extension AnnotationDocumentPatterns on AnnotationDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnnotationDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnnotationDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnnotationDocument value)  $default,){
final _that = this;
switch (_that) {
case _AnnotationDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnnotationDocument value)?  $default,){
final _that = this;
switch (_that) {
case _AnnotationDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Annotation> annotations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnnotationDocument() when $default != null:
return $default(_that.annotations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Annotation> annotations)  $default,) {final _that = this;
switch (_that) {
case _AnnotationDocument():
return $default(_that.annotations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Annotation> annotations)?  $default,) {final _that = this;
switch (_that) {
case _AnnotationDocument() when $default != null:
return $default(_that.annotations);case _:
  return null;

}
}

}

/// @nodoc


class _AnnotationDocument extends AnnotationDocument {
  const _AnnotationDocument({final  List<Annotation> annotations = const []}): _annotations = annotations,super._();
  

/// List of annotations in the document.
 final  List<Annotation> _annotations;
/// List of annotations in the document.
@override@JsonKey() List<Annotation> get annotations {
  if (_annotations is EqualUnmodifiableListView) return _annotations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_annotations);
}


/// Create a copy of AnnotationDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnnotationDocumentCopyWith<_AnnotationDocument> get copyWith => __$AnnotationDocumentCopyWithImpl<_AnnotationDocument>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnnotationDocument&&const DeepCollectionEquality().equals(other._annotations, _annotations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_annotations));

@override
String toString() {
  return 'AnnotationDocument(annotations: $annotations)';
}


}

/// @nodoc
abstract mixin class _$AnnotationDocumentCopyWith<$Res> implements $AnnotationDocumentCopyWith<$Res> {
  factory _$AnnotationDocumentCopyWith(_AnnotationDocument value, $Res Function(_AnnotationDocument) _then) = __$AnnotationDocumentCopyWithImpl;
@override @useResult
$Res call({
 List<Annotation> annotations
});




}
/// @nodoc
class __$AnnotationDocumentCopyWithImpl<$Res>
    implements _$AnnotationDocumentCopyWith<$Res> {
  __$AnnotationDocumentCopyWithImpl(this._self, this._then);

  final _AnnotationDocument _self;
  final $Res Function(_AnnotationDocument) _then;

/// Create a copy of AnnotationDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? annotations = null,}) {
  return _then(_AnnotationDocument(
annotations: null == annotations ? _self._annotations : annotations // ignore: cast_nullable_to_non_nullable
as List<Annotation>,
  ));
}


}

// dart format on
