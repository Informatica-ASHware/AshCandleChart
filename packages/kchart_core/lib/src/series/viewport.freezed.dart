// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'viewport.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Viewport {
  /// Index of the first visible data point in the [Series].
  int get startIdx => throw _privateConstructorUsedError;

  /// Index of the last visible data point in the [Series].
  int get endIdx => throw _privateConstructorUsedError;

  /// Horizontal scale factor (zoom).
  double get scale => throw _privateConstructorUsedError;

  /// Horizontal scroll offset.
  double get scrollX => throw _privateConstructorUsedError;

  /// Create a copy of Viewport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViewportCopyWith<Viewport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewportCopyWith<$Res> {
  factory $ViewportCopyWith(Viewport value, $Res Function(Viewport) then) =
      _$ViewportCopyWithImpl<$Res, Viewport>;
  @useResult
  $Res call({int startIdx, int endIdx, double scale, double scrollX});
}

/// @nodoc
class _$ViewportCopyWithImpl<$Res, $Val extends Viewport>
    implements $ViewportCopyWith<$Res> {
  _$ViewportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Viewport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startIdx = null,
    Object? endIdx = null,
    Object? scale = null,
    Object? scrollX = null,
  }) {
    return _then(_value.copyWith(
      startIdx: null == startIdx
          ? _value.startIdx
          : startIdx // ignore: cast_nullable_to_non_nullable
              as int,
      endIdx: null == endIdx
          ? _value.endIdx
          : endIdx // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      scrollX: null == scrollX
          ? _value.scrollX
          : scrollX // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewportImplCopyWith<$Res>
    implements $ViewportCopyWith<$Res> {
  factory _$$ViewportImplCopyWith(
          _$ViewportImpl value, $Res Function(_$ViewportImpl) then) =
      __$$ViewportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int startIdx, int endIdx, double scale, double scrollX});
}

/// @nodoc
class __$$ViewportImplCopyWithImpl<$Res>
    extends _$ViewportCopyWithImpl<$Res, _$ViewportImpl>
    implements _$$ViewportImplCopyWith<$Res> {
  __$$ViewportImplCopyWithImpl(
      _$ViewportImpl _value, $Res Function(_$ViewportImpl) _then)
      : super(_value, _then);

  /// Create a copy of Viewport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startIdx = null,
    Object? endIdx = null,
    Object? scale = null,
    Object? scrollX = null,
  }) {
    return _then(_$ViewportImpl(
      startIdx: null == startIdx
          ? _value.startIdx
          : startIdx // ignore: cast_nullable_to_non_nullable
              as int,
      endIdx: null == endIdx
          ? _value.endIdx
          : endIdx // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      scrollX: null == scrollX
          ? _value.scrollX
          : scrollX // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ViewportImpl implements _Viewport {
  const _$ViewportImpl(
      {required this.startIdx,
      required this.endIdx,
      required this.scale,
      required this.scrollX});

  /// Index of the first visible data point in the [Series].
  @override
  final int startIdx;

  /// Index of the last visible data point in the [Series].
  @override
  final int endIdx;

  /// Horizontal scale factor (zoom).
  @override
  final double scale;

  /// Horizontal scroll offset.
  @override
  final double scrollX;

  @override
  String toString() {
    return 'Viewport(startIdx: $startIdx, endIdx: $endIdx, scale: $scale, scrollX: $scrollX)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewportImpl &&
            (identical(other.startIdx, startIdx) ||
                other.startIdx == startIdx) &&
            (identical(other.endIdx, endIdx) || other.endIdx == endIdx) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.scrollX, scrollX) || other.scrollX == scrollX));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, startIdx, endIdx, scale, scrollX);

  /// Create a copy of Viewport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewportImplCopyWith<_$ViewportImpl> get copyWith =>
      __$$ViewportImplCopyWithImpl<_$ViewportImpl>(this, _$identity);
}

abstract class _Viewport implements Viewport {
  const factory _Viewport(
      {required final int startIdx,
      required final int endIdx,
      required final double scale,
      required final double scrollX}) = _$ViewportImpl;

  /// Index of the first visible data point in the [Series].
  @override
  int get startIdx;

  /// Index of the last visible data point in the [Series].
  @override
  int get endIdx;

  /// Horizontal scale factor (zoom).
  @override
  double get scale;

  /// Horizontal scroll offset.
  @override
  double get scrollX;

  /// Create a copy of Viewport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewportImplCopyWith<_$ViewportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
