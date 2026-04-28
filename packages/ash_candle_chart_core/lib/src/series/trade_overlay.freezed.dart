// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trade_overlay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TradeOverlay {

/// Unique identifier for the overlay.
 String get id;
/// Create a copy of TradeOverlay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradeOverlayCopyWith<TradeOverlay> get copyWith => _$TradeOverlayCopyWithImpl<TradeOverlay>(this as TradeOverlay, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradeOverlay&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TradeOverlay(id: $id)';
}


}

/// @nodoc
abstract mixin class $TradeOverlayCopyWith<$Res>  {
  factory $TradeOverlayCopyWith(TradeOverlay value, $Res Function(TradeOverlay) _then) = _$TradeOverlayCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$TradeOverlayCopyWithImpl<$Res>
    implements $TradeOverlayCopyWith<$Res> {
  _$TradeOverlayCopyWithImpl(this._self, this._then);

  final TradeOverlay _self;
  final $Res Function(TradeOverlay) _then;

/// Create a copy of TradeOverlay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TradeOverlay].
extension TradeOverlayPatterns on TradeOverlay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TradeMarker value)?  marker,TResult Function( PositionOverlay value)?  position,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TradeMarker() when marker != null:
return marker(_that);case PositionOverlay() when position != null:
return position(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TradeMarker value)  marker,required TResult Function( PositionOverlay value)  position,}){
final _that = this;
switch (_that) {
case TradeMarker():
return marker(_that);case PositionOverlay():
return position(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TradeMarker value)?  marker,TResult? Function( PositionOverlay value)?  position,}){
final _that = this;
switch (_that) {
case TradeMarker() when marker != null:
return marker(_that);case PositionOverlay() when position != null:
return position(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  AnnotationPoint point,  int color,  double size,  String? label)?  marker,TResult Function( String id,  double entryPrice,  double? stopLoss,  double? takeProfit,  int profitColor,  int lossColor,  int entryColor)?  position,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TradeMarker() when marker != null:
return marker(_that.id,_that.point,_that.color,_that.size,_that.label);case PositionOverlay() when position != null:
return position(_that.id,_that.entryPrice,_that.stopLoss,_that.takeProfit,_that.profitColor,_that.lossColor,_that.entryColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  AnnotationPoint point,  int color,  double size,  String? label)  marker,required TResult Function( String id,  double entryPrice,  double? stopLoss,  double? takeProfit,  int profitColor,  int lossColor,  int entryColor)  position,}) {final _that = this;
switch (_that) {
case TradeMarker():
return marker(_that.id,_that.point,_that.color,_that.size,_that.label);case PositionOverlay():
return position(_that.id,_that.entryPrice,_that.stopLoss,_that.takeProfit,_that.profitColor,_that.lossColor,_that.entryColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  AnnotationPoint point,  int color,  double size,  String? label)?  marker,TResult? Function( String id,  double entryPrice,  double? stopLoss,  double? takeProfit,  int profitColor,  int lossColor,  int entryColor)?  position,}) {final _that = this;
switch (_that) {
case TradeMarker() when marker != null:
return marker(_that.id,_that.point,_that.color,_that.size,_that.label);case PositionOverlay() when position != null:
return position(_that.id,_that.entryPrice,_that.stopLoss,_that.takeProfit,_that.profitColor,_that.lossColor,_that.entryColor);case _:
  return null;

}
}

}

/// @nodoc


class TradeMarker extends TradeOverlay {
  const TradeMarker({required this.id, required this.point, this.color = 0xFF4CAF50, this.size = 8.0, this.label}): super._();
  

/// Unique identifier for the overlay.
@override final  String id;
/// The point in time and price where the marker is placed.
 final  AnnotationPoint point;
/// Hex color of the marker.
@JsonKey() final  int color;
/// Size of the marker in pixels.
@JsonKey() final  double size;
/// Optional label to display next to the marker.
 final  String? label;

/// Create a copy of TradeOverlay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradeMarkerCopyWith<TradeMarker> get copyWith => _$TradeMarkerCopyWithImpl<TradeMarker>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradeMarker&&(identical(other.id, id) || other.id == id)&&(identical(other.point, point) || other.point == point)&&(identical(other.color, color) || other.color == color)&&(identical(other.size, size) || other.size == size)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,id,point,color,size,label);

@override
String toString() {
  return 'TradeOverlay.marker(id: $id, point: $point, color: $color, size: $size, label: $label)';
}


}

/// @nodoc
abstract mixin class $TradeMarkerCopyWith<$Res> implements $TradeOverlayCopyWith<$Res> {
  factory $TradeMarkerCopyWith(TradeMarker value, $Res Function(TradeMarker) _then) = _$TradeMarkerCopyWithImpl;
@override @useResult
$Res call({
 String id, AnnotationPoint point, int color, double size, String? label
});


$AnnotationPointCopyWith<$Res> get point;

}
/// @nodoc
class _$TradeMarkerCopyWithImpl<$Res>
    implements $TradeMarkerCopyWith<$Res> {
  _$TradeMarkerCopyWithImpl(this._self, this._then);

  final TradeMarker _self;
  final $Res Function(TradeMarker) _then;

/// Create a copy of TradeOverlay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? point = null,Object? color = null,Object? size = null,Object? label = freezed,}) {
  return _then(TradeMarker(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,point: null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as AnnotationPoint,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TradeOverlay
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnnotationPointCopyWith<$Res> get point {
  
  return $AnnotationPointCopyWith<$Res>(_self.point, (value) {
    return _then(_self.copyWith(point: value));
  });
}
}

/// @nodoc


class PositionOverlay extends TradeOverlay {
  const PositionOverlay({required this.id, required this.entryPrice, this.stopLoss, this.takeProfit, this.profitColor = 0x334CAF50, this.lossColor = 0x33F44336, this.entryColor = 0xFFFFFFFF}): super._();
  

/// Unique identifier for the overlay.
@override final  String id;
/// The entry price of the position.
 final  double entryPrice;
/// Optional stop loss price.
 final  double? stopLoss;
/// Optional take profit price.
 final  double? takeProfit;
/// Hex color for the profit zone (entry to TP).
@JsonKey() final  int profitColor;
/// Hex color for the loss zone (entry to SL).
@JsonKey() final  int lossColor;
/// Hex color for the entry line.
@JsonKey() final  int entryColor;

/// Create a copy of TradeOverlay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PositionOverlayCopyWith<PositionOverlay> get copyWith => _$PositionOverlayCopyWithImpl<PositionOverlay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PositionOverlay&&(identical(other.id, id) || other.id == id)&&(identical(other.entryPrice, entryPrice) || other.entryPrice == entryPrice)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&(identical(other.takeProfit, takeProfit) || other.takeProfit == takeProfit)&&(identical(other.profitColor, profitColor) || other.profitColor == profitColor)&&(identical(other.lossColor, lossColor) || other.lossColor == lossColor)&&(identical(other.entryColor, entryColor) || other.entryColor == entryColor));
}


@override
int get hashCode => Object.hash(runtimeType,id,entryPrice,stopLoss,takeProfit,profitColor,lossColor,entryColor);

@override
String toString() {
  return 'TradeOverlay.position(id: $id, entryPrice: $entryPrice, stopLoss: $stopLoss, takeProfit: $takeProfit, profitColor: $profitColor, lossColor: $lossColor, entryColor: $entryColor)';
}


}

/// @nodoc
abstract mixin class $PositionOverlayCopyWith<$Res> implements $TradeOverlayCopyWith<$Res> {
  factory $PositionOverlayCopyWith(PositionOverlay value, $Res Function(PositionOverlay) _then) = _$PositionOverlayCopyWithImpl;
@override @useResult
$Res call({
 String id, double entryPrice, double? stopLoss, double? takeProfit, int profitColor, int lossColor, int entryColor
});




}
/// @nodoc
class _$PositionOverlayCopyWithImpl<$Res>
    implements $PositionOverlayCopyWith<$Res> {
  _$PositionOverlayCopyWithImpl(this._self, this._then);

  final PositionOverlay _self;
  final $Res Function(PositionOverlay) _then;

/// Create a copy of TradeOverlay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? entryPrice = null,Object? stopLoss = freezed,Object? takeProfit = freezed,Object? profitColor = null,Object? lossColor = null,Object? entryColor = null,}) {
  return _then(PositionOverlay(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,entryPrice: null == entryPrice ? _self.entryPrice : entryPrice // ignore: cast_nullable_to_non_nullable
as double,stopLoss: freezed == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as double?,takeProfit: freezed == takeProfit ? _self.takeProfit : takeProfit // ignore: cast_nullable_to_non_nullable
as double?,profitColor: null == profitColor ? _self.profitColor : profitColor // ignore: cast_nullable_to_non_nullable
as int,lossColor: null == lossColor ? _self.lossColor : lossColor // ignore: cast_nullable_to_non_nullable
as int,entryColor: null == entryColor ? _self.entryColor : entryColor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$TradeOverlayDocument {

/// List of trade overlays in the document.
 List<TradeOverlay> get overlays;
/// Create a copy of TradeOverlayDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TradeOverlayDocumentCopyWith<TradeOverlayDocument> get copyWith => _$TradeOverlayDocumentCopyWithImpl<TradeOverlayDocument>(this as TradeOverlayDocument, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TradeOverlayDocument&&const DeepCollectionEquality().equals(other.overlays, overlays));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(overlays));

@override
String toString() {
  return 'TradeOverlayDocument(overlays: $overlays)';
}


}

/// @nodoc
abstract mixin class $TradeOverlayDocumentCopyWith<$Res>  {
  factory $TradeOverlayDocumentCopyWith(TradeOverlayDocument value, $Res Function(TradeOverlayDocument) _then) = _$TradeOverlayDocumentCopyWithImpl;
@useResult
$Res call({
 List<TradeOverlay> overlays
});




}
/// @nodoc
class _$TradeOverlayDocumentCopyWithImpl<$Res>
    implements $TradeOverlayDocumentCopyWith<$Res> {
  _$TradeOverlayDocumentCopyWithImpl(this._self, this._then);

  final TradeOverlayDocument _self;
  final $Res Function(TradeOverlayDocument) _then;

/// Create a copy of TradeOverlayDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? overlays = null,}) {
  return _then(_self.copyWith(
overlays: null == overlays ? _self.overlays : overlays // ignore: cast_nullable_to_non_nullable
as List<TradeOverlay>,
  ));
}

}


/// Adds pattern-matching-related methods to [TradeOverlayDocument].
extension TradeOverlayDocumentPatterns on TradeOverlayDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TradeOverlayDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TradeOverlayDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TradeOverlayDocument value)  $default,){
final _that = this;
switch (_that) {
case _TradeOverlayDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TradeOverlayDocument value)?  $default,){
final _that = this;
switch (_that) {
case _TradeOverlayDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TradeOverlay> overlays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TradeOverlayDocument() when $default != null:
return $default(_that.overlays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TradeOverlay> overlays)  $default,) {final _that = this;
switch (_that) {
case _TradeOverlayDocument():
return $default(_that.overlays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TradeOverlay> overlays)?  $default,) {final _that = this;
switch (_that) {
case _TradeOverlayDocument() when $default != null:
return $default(_that.overlays);case _:
  return null;

}
}

}

/// @nodoc


class _TradeOverlayDocument extends TradeOverlayDocument {
  const _TradeOverlayDocument({final  List<TradeOverlay> overlays = const []}): _overlays = overlays,super._();
  

/// List of trade overlays in the document.
 final  List<TradeOverlay> _overlays;
/// List of trade overlays in the document.
@override@JsonKey() List<TradeOverlay> get overlays {
  if (_overlays is EqualUnmodifiableListView) return _overlays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_overlays);
}


/// Create a copy of TradeOverlayDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TradeOverlayDocumentCopyWith<_TradeOverlayDocument> get copyWith => __$TradeOverlayDocumentCopyWithImpl<_TradeOverlayDocument>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TradeOverlayDocument&&const DeepCollectionEquality().equals(other._overlays, _overlays));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_overlays));

@override
String toString() {
  return 'TradeOverlayDocument(overlays: $overlays)';
}


}

/// @nodoc
abstract mixin class _$TradeOverlayDocumentCopyWith<$Res> implements $TradeOverlayDocumentCopyWith<$Res> {
  factory _$TradeOverlayDocumentCopyWith(_TradeOverlayDocument value, $Res Function(_TradeOverlayDocument) _then) = __$TradeOverlayDocumentCopyWithImpl;
@override @useResult
$Res call({
 List<TradeOverlay> overlays
});




}
/// @nodoc
class __$TradeOverlayDocumentCopyWithImpl<$Res>
    implements _$TradeOverlayDocumentCopyWith<$Res> {
  __$TradeOverlayDocumentCopyWithImpl(this._self, this._then);

  final _TradeOverlayDocument _self;
  final $Res Function(_TradeOverlayDocument) _then;

/// Create a copy of TradeOverlayDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? overlays = null,}) {
  return _then(_TradeOverlayDocument(
overlays: null == overlays ? _self._overlays : overlays // ignore: cast_nullable_to_non_nullable
as List<TradeOverlay>,
  ));
}


}

// dart format on
