// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trade_overlay.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TradeOverlay {
  /// Unique identifier for the overlay.
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, AnnotationPoint point, int color,
            double size, String? label)
        marker,
    required TResult Function(String id, double entryPrice, double? stopLoss,
            double? takeProfit, int profitColor, int lossColor, int entryColor)
        position,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, AnnotationPoint point, int color, double size,
            String? label)?
        marker,
    TResult? Function(String id, double entryPrice, double? stopLoss,
            double? takeProfit, int profitColor, int lossColor, int entryColor)?
        position,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, AnnotationPoint point, int color, double size,
            String? label)?
        marker,
    TResult Function(String id, double entryPrice, double? stopLoss,
            double? takeProfit, int profitColor, int lossColor, int entryColor)?
        position,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TradeMarker value) marker,
    required TResult Function(PositionOverlay value) position,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TradeMarker value)? marker,
    TResult? Function(PositionOverlay value)? position,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TradeMarker value)? marker,
    TResult Function(PositionOverlay value)? position,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TradeOverlay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TradeOverlayCopyWith<TradeOverlay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeOverlayCopyWith<$Res> {
  factory $TradeOverlayCopyWith(
          TradeOverlay value, $Res Function(TradeOverlay) then) =
      _$TradeOverlayCopyWithImpl<$Res, TradeOverlay>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$TradeOverlayCopyWithImpl<$Res, $Val extends TradeOverlay>
    implements $TradeOverlayCopyWith<$Res> {
  _$TradeOverlayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TradeOverlay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TradeMarkerImplCopyWith<$Res>
    implements $TradeOverlayCopyWith<$Res> {
  factory _$$TradeMarkerImplCopyWith(
          _$TradeMarkerImpl value, $Res Function(_$TradeMarkerImpl) then) =
      __$$TradeMarkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      AnnotationPoint point,
      int color,
      double size,
      String? label});

  $AnnotationPointCopyWith<$Res> get point;
}

/// @nodoc
class __$$TradeMarkerImplCopyWithImpl<$Res>
    extends _$TradeOverlayCopyWithImpl<$Res, _$TradeMarkerImpl>
    implements _$$TradeMarkerImplCopyWith<$Res> {
  __$$TradeMarkerImplCopyWithImpl(
      _$TradeMarkerImpl _value, $Res Function(_$TradeMarkerImpl) _then)
      : super(_value, _then);

  /// Create a copy of TradeOverlay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? point = null,
    Object? color = null,
    Object? size = null,
    Object? label = freezed,
  }) {
    return _then(_$TradeMarkerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as AnnotationPoint,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of TradeOverlay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnnotationPointCopyWith<$Res> get point {
    return $AnnotationPointCopyWith<$Res>(_value.point, (value) {
      return _then(_value.copyWith(point: value));
    });
  }
}

/// @nodoc

class _$TradeMarkerImpl extends TradeMarker {
  const _$TradeMarkerImpl(
      {required this.id,
      required this.point,
      this.color = 0xFF4CAF50,
      this.size = 8.0,
      this.label})
      : super._();

  /// Unique identifier for the overlay.
  @override
  final String id;

  /// The point in time and price where the marker is placed.
  @override
  final AnnotationPoint point;

  /// Hex color of the marker.
  @override
  @JsonKey()
  final int color;

  /// Size of the marker in pixels.
  @override
  @JsonKey()
  final double size;

  /// Optional label to display next to the marker.
  @override
  final String? label;

  @override
  String toString() {
    return 'TradeOverlay.marker(id: $id, point: $point, color: $color, size: $size, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradeMarkerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, point, color, size, label);

  /// Create a copy of TradeOverlay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TradeMarkerImplCopyWith<_$TradeMarkerImpl> get copyWith =>
      __$$TradeMarkerImplCopyWithImpl<_$TradeMarkerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, AnnotationPoint point, int color,
            double size, String? label)
        marker,
    required TResult Function(String id, double entryPrice, double? stopLoss,
            double? takeProfit, int profitColor, int lossColor, int entryColor)
        position,
  }) {
    return marker(id, point, color, size, label);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, AnnotationPoint point, int color, double size,
            String? label)?
        marker,
    TResult? Function(String id, double entryPrice, double? stopLoss,
            double? takeProfit, int profitColor, int lossColor, int entryColor)?
        position,
  }) {
    return marker?.call(id, point, color, size, label);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, AnnotationPoint point, int color, double size,
            String? label)?
        marker,
    TResult Function(String id, double entryPrice, double? stopLoss,
            double? takeProfit, int profitColor, int lossColor, int entryColor)?
        position,
    required TResult orElse(),
  }) {
    if (marker != null) {
      return marker(id, point, color, size, label);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TradeMarker value) marker,
    required TResult Function(PositionOverlay value) position,
  }) {
    return marker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TradeMarker value)? marker,
    TResult? Function(PositionOverlay value)? position,
  }) {
    return marker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TradeMarker value)? marker,
    TResult Function(PositionOverlay value)? position,
    required TResult orElse(),
  }) {
    if (marker != null) {
      return marker(this);
    }
    return orElse();
  }
}

abstract class TradeMarker extends TradeOverlay {
  const factory TradeMarker(
      {required final String id,
      required final AnnotationPoint point,
      final int color,
      final double size,
      final String? label}) = _$TradeMarkerImpl;
  const TradeMarker._() : super._();

  /// Unique identifier for the overlay.
  @override
  String get id;

  /// The point in time and price where the marker is placed.
  AnnotationPoint get point;

  /// Hex color of the marker.
  int get color;

  /// Size of the marker in pixels.
  double get size;

  /// Optional label to display next to the marker.
  String? get label;

  /// Create a copy of TradeOverlay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TradeMarkerImplCopyWith<_$TradeMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PositionOverlayImplCopyWith<$Res>
    implements $TradeOverlayCopyWith<$Res> {
  factory _$$PositionOverlayImplCopyWith(_$PositionOverlayImpl value,
          $Res Function(_$PositionOverlayImpl) then) =
      __$$PositionOverlayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double entryPrice,
      double? stopLoss,
      double? takeProfit,
      int profitColor,
      int lossColor,
      int entryColor});
}

/// @nodoc
class __$$PositionOverlayImplCopyWithImpl<$Res>
    extends _$TradeOverlayCopyWithImpl<$Res, _$PositionOverlayImpl>
    implements _$$PositionOverlayImplCopyWith<$Res> {
  __$$PositionOverlayImplCopyWithImpl(
      _$PositionOverlayImpl _value, $Res Function(_$PositionOverlayImpl) _then)
      : super(_value, _then);

  /// Create a copy of TradeOverlay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? entryPrice = null,
    Object? stopLoss = freezed,
    Object? takeProfit = freezed,
    Object? profitColor = null,
    Object? lossColor = null,
    Object? entryColor = null,
  }) {
    return _then(_$PositionOverlayImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      entryPrice: null == entryPrice
          ? _value.entryPrice
          : entryPrice // ignore: cast_nullable_to_non_nullable
              as double,
      stopLoss: freezed == stopLoss
          ? _value.stopLoss
          : stopLoss // ignore: cast_nullable_to_non_nullable
              as double?,
      takeProfit: freezed == takeProfit
          ? _value.takeProfit
          : takeProfit // ignore: cast_nullable_to_non_nullable
              as double?,
      profitColor: null == profitColor
          ? _value.profitColor
          : profitColor // ignore: cast_nullable_to_non_nullable
              as int,
      lossColor: null == lossColor
          ? _value.lossColor
          : lossColor // ignore: cast_nullable_to_non_nullable
              as int,
      entryColor: null == entryColor
          ? _value.entryColor
          : entryColor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PositionOverlayImpl extends PositionOverlay {
  const _$PositionOverlayImpl(
      {required this.id,
      required this.entryPrice,
      this.stopLoss,
      this.takeProfit,
      this.profitColor = 0x334CAF50,
      this.lossColor = 0x33F44336,
      this.entryColor = 0xFFFFFFFF})
      : super._();

  /// Unique identifier for the overlay.
  @override
  final String id;

  /// The entry price of the position.
  @override
  final double entryPrice;

  /// Optional stop loss price.
  @override
  final double? stopLoss;

  /// Optional take profit price.
  @override
  final double? takeProfit;

  /// Hex color for the profit zone (entry to TP).
  @override
  @JsonKey()
  final int profitColor;

  /// Hex color for the loss zone (entry to SL).
  @override
  @JsonKey()
  final int lossColor;

  /// Hex color for the entry line.
  @override
  @JsonKey()
  final int entryColor;

  @override
  String toString() {
    return 'TradeOverlay.position(id: $id, entryPrice: $entryPrice, stopLoss: $stopLoss, takeProfit: $takeProfit, profitColor: $profitColor, lossColor: $lossColor, entryColor: $entryColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionOverlayImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.entryPrice, entryPrice) ||
                other.entryPrice == entryPrice) &&
            (identical(other.stopLoss, stopLoss) ||
                other.stopLoss == stopLoss) &&
            (identical(other.takeProfit, takeProfit) ||
                other.takeProfit == takeProfit) &&
            (identical(other.profitColor, profitColor) ||
                other.profitColor == profitColor) &&
            (identical(other.lossColor, lossColor) ||
                other.lossColor == lossColor) &&
            (identical(other.entryColor, entryColor) ||
                other.entryColor == entryColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, entryPrice, stopLoss,
      takeProfit, profitColor, lossColor, entryColor);

  /// Create a copy of TradeOverlay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionOverlayImplCopyWith<_$PositionOverlayImpl> get copyWith =>
      __$$PositionOverlayImplCopyWithImpl<_$PositionOverlayImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, AnnotationPoint point, int color,
            double size, String? label)
        marker,
    required TResult Function(String id, double entryPrice, double? stopLoss,
            double? takeProfit, int profitColor, int lossColor, int entryColor)
        position,
  }) {
    return position(id, entryPrice, stopLoss, takeProfit, profitColor,
        lossColor, entryColor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, AnnotationPoint point, int color, double size,
            String? label)?
        marker,
    TResult? Function(String id, double entryPrice, double? stopLoss,
            double? takeProfit, int profitColor, int lossColor, int entryColor)?
        position,
  }) {
    return position?.call(id, entryPrice, stopLoss, takeProfit, profitColor,
        lossColor, entryColor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, AnnotationPoint point, int color, double size,
            String? label)?
        marker,
    TResult Function(String id, double entryPrice, double? stopLoss,
            double? takeProfit, int profitColor, int lossColor, int entryColor)?
        position,
    required TResult orElse(),
  }) {
    if (position != null) {
      return position(id, entryPrice, stopLoss, takeProfit, profitColor,
          lossColor, entryColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TradeMarker value) marker,
    required TResult Function(PositionOverlay value) position,
  }) {
    return position(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TradeMarker value)? marker,
    TResult? Function(PositionOverlay value)? position,
  }) {
    return position?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TradeMarker value)? marker,
    TResult Function(PositionOverlay value)? position,
    required TResult orElse(),
  }) {
    if (position != null) {
      return position(this);
    }
    return orElse();
  }
}

abstract class PositionOverlay extends TradeOverlay {
  const factory PositionOverlay(
      {required final String id,
      required final double entryPrice,
      final double? stopLoss,
      final double? takeProfit,
      final int profitColor,
      final int lossColor,
      final int entryColor}) = _$PositionOverlayImpl;
  const PositionOverlay._() : super._();

  /// Unique identifier for the overlay.
  @override
  String get id;

  /// The entry price of the position.
  double get entryPrice;

  /// Optional stop loss price.
  double? get stopLoss;

  /// Optional take profit price.
  double? get takeProfit;

  /// Hex color for the profit zone (entry to TP).
  int get profitColor;

  /// Hex color for the loss zone (entry to SL).
  int get lossColor;

  /// Hex color for the entry line.
  int get entryColor;

  /// Create a copy of TradeOverlay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PositionOverlayImplCopyWith<_$PositionOverlayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TradeOverlayDocument {
  /// List of trade overlays in the document.
  List<TradeOverlay> get overlays => throw _privateConstructorUsedError;

  /// Create a copy of TradeOverlayDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TradeOverlayDocumentCopyWith<TradeOverlayDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeOverlayDocumentCopyWith<$Res> {
  factory $TradeOverlayDocumentCopyWith(TradeOverlayDocument value,
          $Res Function(TradeOverlayDocument) then) =
      _$TradeOverlayDocumentCopyWithImpl<$Res, TradeOverlayDocument>;
  @useResult
  $Res call({List<TradeOverlay> overlays});
}

/// @nodoc
class _$TradeOverlayDocumentCopyWithImpl<$Res,
        $Val extends TradeOverlayDocument>
    implements $TradeOverlayDocumentCopyWith<$Res> {
  _$TradeOverlayDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TradeOverlayDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overlays = null,
  }) {
    return _then(_value.copyWith(
      overlays: null == overlays
          ? _value.overlays
          : overlays // ignore: cast_nullable_to_non_nullable
              as List<TradeOverlay>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TradeOverlayDocumentImplCopyWith<$Res>
    implements $TradeOverlayDocumentCopyWith<$Res> {
  factory _$$TradeOverlayDocumentImplCopyWith(_$TradeOverlayDocumentImpl value,
          $Res Function(_$TradeOverlayDocumentImpl) then) =
      __$$TradeOverlayDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TradeOverlay> overlays});
}

/// @nodoc
class __$$TradeOverlayDocumentImplCopyWithImpl<$Res>
    extends _$TradeOverlayDocumentCopyWithImpl<$Res, _$TradeOverlayDocumentImpl>
    implements _$$TradeOverlayDocumentImplCopyWith<$Res> {
  __$$TradeOverlayDocumentImplCopyWithImpl(_$TradeOverlayDocumentImpl _value,
      $Res Function(_$TradeOverlayDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of TradeOverlayDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overlays = null,
  }) {
    return _then(_$TradeOverlayDocumentImpl(
      overlays: null == overlays
          ? _value._overlays
          : overlays // ignore: cast_nullable_to_non_nullable
              as List<TradeOverlay>,
    ));
  }
}

/// @nodoc

class _$TradeOverlayDocumentImpl extends _TradeOverlayDocument {
  const _$TradeOverlayDocumentImpl(
      {final List<TradeOverlay> overlays = const []})
      : _overlays = overlays,
        super._();

  /// List of trade overlays in the document.
  final List<TradeOverlay> _overlays;

  /// List of trade overlays in the document.
  @override
  @JsonKey()
  List<TradeOverlay> get overlays {
    if (_overlays is EqualUnmodifiableListView) return _overlays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overlays);
  }

  @override
  String toString() {
    return 'TradeOverlayDocument(overlays: $overlays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradeOverlayDocumentImpl &&
            const DeepCollectionEquality().equals(other._overlays, _overlays));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_overlays));

  /// Create a copy of TradeOverlayDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TradeOverlayDocumentImplCopyWith<_$TradeOverlayDocumentImpl>
      get copyWith =>
          __$$TradeOverlayDocumentImplCopyWithImpl<_$TradeOverlayDocumentImpl>(
              this, _$identity);
}

abstract class _TradeOverlayDocument extends TradeOverlayDocument {
  const factory _TradeOverlayDocument({final List<TradeOverlay> overlays}) =
      _$TradeOverlayDocumentImpl;
  const _TradeOverlayDocument._() : super._();

  /// List of trade overlays in the document.
  @override
  List<TradeOverlay> get overlays;

  /// Create a copy of TradeOverlayDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TradeOverlayDocumentImplCopyWith<_$TradeOverlayDocumentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
