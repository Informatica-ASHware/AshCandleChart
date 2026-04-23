// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'annotation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnnotationPoint _$AnnotationPointFromJson(Map<String, dynamic> json) {
  return _AnnotationPoint.fromJson(json);
}

/// @nodoc
mixin _$AnnotationPoint {
  /// Unix timestamp in milliseconds.
  int get timestamp => throw _privateConstructorUsedError;

  /// Price value.
  double get price => throw _privateConstructorUsedError;

  /// Serializes this AnnotationPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnnotationPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnnotationPointCopyWith<AnnotationPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnotationPointCopyWith<$Res> {
  factory $AnnotationPointCopyWith(
          AnnotationPoint value, $Res Function(AnnotationPoint) then) =
      _$AnnotationPointCopyWithImpl<$Res, AnnotationPoint>;
  @useResult
  $Res call({int timestamp, double price});
}

/// @nodoc
class _$AnnotationPointCopyWithImpl<$Res, $Val extends AnnotationPoint>
    implements $AnnotationPointCopyWith<$Res> {
  _$AnnotationPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnnotationPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnotationPointImplCopyWith<$Res>
    implements $AnnotationPointCopyWith<$Res> {
  factory _$$AnnotationPointImplCopyWith(_$AnnotationPointImpl value,
          $Res Function(_$AnnotationPointImpl) then) =
      __$$AnnotationPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int timestamp, double price});
}

/// @nodoc
class __$$AnnotationPointImplCopyWithImpl<$Res>
    extends _$AnnotationPointCopyWithImpl<$Res, _$AnnotationPointImpl>
    implements _$$AnnotationPointImplCopyWith<$Res> {
  __$$AnnotationPointImplCopyWithImpl(
      _$AnnotationPointImpl _value, $Res Function(_$AnnotationPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnnotationPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? price = null,
  }) {
    return _then(_$AnnotationPointImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnnotationPointImpl implements _AnnotationPoint {
  const _$AnnotationPointImpl({required this.timestamp, required this.price});

  factory _$AnnotationPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnnotationPointImplFromJson(json);

  /// Unix timestamp in milliseconds.
  @override
  final int timestamp;

  /// Price value.
  @override
  final double price;

  @override
  String toString() {
    return 'AnnotationPoint(timestamp: $timestamp, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnotationPointImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, price);

  /// Create a copy of AnnotationPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnotationPointImplCopyWith<_$AnnotationPointImpl> get copyWith =>
      __$$AnnotationPointImplCopyWithImpl<_$AnnotationPointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnnotationPointImplToJson(
      this,
    );
  }
}

abstract class _AnnotationPoint implements AnnotationPoint {
  const factory _AnnotationPoint(
      {required final int timestamp,
      required final double price}) = _$AnnotationPointImpl;

  factory _AnnotationPoint.fromJson(Map<String, dynamic> json) =
      _$AnnotationPointImpl.fromJson;

  /// Unix timestamp in milliseconds.
  @override
  int get timestamp;

  /// Price value.
  @override
  double get price;

  /// Create a copy of AnnotationPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnnotationPointImplCopyWith<_$AnnotationPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Annotation {
  /// Unique identifier for the annotation.
  String get id => throw _privateConstructorUsedError;

  /// The starting point of the trend line.
  AnnotationPoint get start => throw _privateConstructorUsedError;

  /// The ending point of the trend line.
  AnnotationPoint get end => throw _privateConstructorUsedError;

  /// Hex color of the line.
  int get color => throw _privateConstructorUsedError;

  /// Width of the line.
  double get strokeWidth => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, AnnotationPoint start,
            AnnotationPoint end, int color, double strokeWidth)
        trendLine,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, AnnotationPoint start, AnnotationPoint end,
            int color, double strokeWidth)?
        trendLine,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, AnnotationPoint start, AnnotationPoint end,
            int color, double strokeWidth)?
        trendLine,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendLine value) trendLine,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendLine value)? trendLine,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendLine value)? trendLine,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Annotation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnnotationCopyWith<Annotation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnotationCopyWith<$Res> {
  factory $AnnotationCopyWith(
          Annotation value, $Res Function(Annotation) then) =
      _$AnnotationCopyWithImpl<$Res, Annotation>;
  @useResult
  $Res call(
      {String id,
      AnnotationPoint start,
      AnnotationPoint end,
      int color,
      double strokeWidth});

  $AnnotationPointCopyWith<$Res> get start;
  $AnnotationPointCopyWith<$Res> get end;
}

/// @nodoc
class _$AnnotationCopyWithImpl<$Res, $Val extends Annotation>
    implements $AnnotationCopyWith<$Res> {
  _$AnnotationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Annotation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? color = null,
    Object? strokeWidth = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as AnnotationPoint,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as AnnotationPoint,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of Annotation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnnotationPointCopyWith<$Res> get start {
    return $AnnotationPointCopyWith<$Res>(_value.start, (value) {
      return _then(_value.copyWith(start: value) as $Val);
    });
  }

  /// Create a copy of Annotation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnnotationPointCopyWith<$Res> get end {
    return $AnnotationPointCopyWith<$Res>(_value.end, (value) {
      return _then(_value.copyWith(end: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrendLineImplCopyWith<$Res>
    implements $AnnotationCopyWith<$Res> {
  factory _$$TrendLineImplCopyWith(
          _$TrendLineImpl value, $Res Function(_$TrendLineImpl) then) =
      __$$TrendLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      AnnotationPoint start,
      AnnotationPoint end,
      int color,
      double strokeWidth});

  @override
  $AnnotationPointCopyWith<$Res> get start;
  @override
  $AnnotationPointCopyWith<$Res> get end;
}

/// @nodoc
class __$$TrendLineImplCopyWithImpl<$Res>
    extends _$AnnotationCopyWithImpl<$Res, _$TrendLineImpl>
    implements _$$TrendLineImplCopyWith<$Res> {
  __$$TrendLineImplCopyWithImpl(
      _$TrendLineImpl _value, $Res Function(_$TrendLineImpl) _then)
      : super(_value, _then);

  /// Create a copy of Annotation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? color = null,
    Object? strokeWidth = null,
  }) {
    return _then(_$TrendLineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as AnnotationPoint,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as AnnotationPoint,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$TrendLineImpl extends TrendLine {
  const _$TrendLineImpl(
      {required this.id,
      required this.start,
      required this.end,
      this.color = 0xFF2196F3,
      this.strokeWidth = 2.0})
      : super._();

  /// Unique identifier for the annotation.
  @override
  final String id;

  /// The starting point of the trend line.
  @override
  final AnnotationPoint start;

  /// The ending point of the trend line.
  @override
  final AnnotationPoint end;

  /// Hex color of the line.
  @override
  @JsonKey()
  final int color;

  /// Width of the line.
  @override
  @JsonKey()
  final double strokeWidth;

  @override
  String toString() {
    return 'Annotation.trendLine(id: $id, start: $start, end: $end, color: $color, strokeWidth: $strokeWidth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendLineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, start, end, color, strokeWidth);

  /// Create a copy of Annotation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendLineImplCopyWith<_$TrendLineImpl> get copyWith =>
      __$$TrendLineImplCopyWithImpl<_$TrendLineImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, AnnotationPoint start,
            AnnotationPoint end, int color, double strokeWidth)
        trendLine,
  }) {
    return trendLine(id, start, end, color, strokeWidth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, AnnotationPoint start, AnnotationPoint end,
            int color, double strokeWidth)?
        trendLine,
  }) {
    return trendLine?.call(id, start, end, color, strokeWidth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, AnnotationPoint start, AnnotationPoint end,
            int color, double strokeWidth)?
        trendLine,
    required TResult orElse(),
  }) {
    if (trendLine != null) {
      return trendLine(id, start, end, color, strokeWidth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrendLine value) trendLine,
  }) {
    return trendLine(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TrendLine value)? trendLine,
  }) {
    return trendLine?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrendLine value)? trendLine,
    required TResult orElse(),
  }) {
    if (trendLine != null) {
      return trendLine(this);
    }
    return orElse();
  }
}

abstract class TrendLine extends Annotation {
  const factory TrendLine(
      {required final String id,
      required final AnnotationPoint start,
      required final AnnotationPoint end,
      final int color,
      final double strokeWidth}) = _$TrendLineImpl;
  const TrendLine._() : super._();

  /// Unique identifier for the annotation.
  @override
  String get id;

  /// The starting point of the trend line.
  @override
  AnnotationPoint get start;

  /// The ending point of the trend line.
  @override
  AnnotationPoint get end;

  /// Hex color of the line.
  @override
  int get color;

  /// Width of the line.
  @override
  double get strokeWidth;

  /// Create a copy of Annotation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrendLineImplCopyWith<_$TrendLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnnotationDocument {
  /// List of annotations in the document.
  List<Annotation> get annotations => throw _privateConstructorUsedError;

  /// Create a copy of AnnotationDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnnotationDocumentCopyWith<AnnotationDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnnotationDocumentCopyWith<$Res> {
  factory $AnnotationDocumentCopyWith(
          AnnotationDocument value, $Res Function(AnnotationDocument) then) =
      _$AnnotationDocumentCopyWithImpl<$Res, AnnotationDocument>;
  @useResult
  $Res call({List<Annotation> annotations});
}

/// @nodoc
class _$AnnotationDocumentCopyWithImpl<$Res, $Val extends AnnotationDocument>
    implements $AnnotationDocumentCopyWith<$Res> {
  _$AnnotationDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnnotationDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annotations = null,
  }) {
    return _then(_value.copyWith(
      annotations: null == annotations
          ? _value.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<Annotation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnnotationDocumentImplCopyWith<$Res>
    implements $AnnotationDocumentCopyWith<$Res> {
  factory _$$AnnotationDocumentImplCopyWith(_$AnnotationDocumentImpl value,
          $Res Function(_$AnnotationDocumentImpl) then) =
      __$$AnnotationDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Annotation> annotations});
}

/// @nodoc
class __$$AnnotationDocumentImplCopyWithImpl<$Res>
    extends _$AnnotationDocumentCopyWithImpl<$Res, _$AnnotationDocumentImpl>
    implements _$$AnnotationDocumentImplCopyWith<$Res> {
  __$$AnnotationDocumentImplCopyWithImpl(_$AnnotationDocumentImpl _value,
      $Res Function(_$AnnotationDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnnotationDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annotations = null,
  }) {
    return _then(_$AnnotationDocumentImpl(
      annotations: null == annotations
          ? _value._annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as List<Annotation>,
    ));
  }
}

/// @nodoc

class _$AnnotationDocumentImpl extends _AnnotationDocument {
  const _$AnnotationDocumentImpl(
      {final List<Annotation> annotations = const []})
      : _annotations = annotations,
        super._();

  /// List of annotations in the document.
  final List<Annotation> _annotations;

  /// List of annotations in the document.
  @override
  @JsonKey()
  List<Annotation> get annotations {
    if (_annotations is EqualUnmodifiableListView) return _annotations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_annotations);
  }

  @override
  String toString() {
    return 'AnnotationDocument(annotations: $annotations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnnotationDocumentImpl &&
            const DeepCollectionEquality()
                .equals(other._annotations, _annotations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_annotations));

  /// Create a copy of AnnotationDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnnotationDocumentImplCopyWith<_$AnnotationDocumentImpl> get copyWith =>
      __$$AnnotationDocumentImplCopyWithImpl<_$AnnotationDocumentImpl>(
          this, _$identity);
}

abstract class _AnnotationDocument extends AnnotationDocument {
  const factory _AnnotationDocument({final List<Annotation> annotations}) =
      _$AnnotationDocumentImpl;
  const _AnnotationDocument._() : super._();

  /// List of annotations in the document.
  @override
  List<Annotation> get annotations;

  /// Create a copy of AnnotationDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnnotationDocumentImplCopyWith<_$AnnotationDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
