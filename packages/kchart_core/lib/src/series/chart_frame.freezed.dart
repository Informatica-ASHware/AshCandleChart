// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_frame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChartFrame {
  /// The main price [Series].
  Series get series => throw _privateConstructorUsedError;

  /// Map of indicator names to their respective [Series].
  Map<String, Series> get indicators => throw _privateConstructorUsedError;

  /// The current [Viewport] state.
  Viewport get viewport => throw _privateConstructorUsedError;

  /// List of overlays (e.g., drawings, alerts, etc.) to be rendered.
  List<dynamic> get overlays => throw _privateConstructorUsedError;

  /// Sequential number to track frame updates and ensure consistent state.
  int get sequenceNumber => throw _privateConstructorUsedError;

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartFrameCopyWith<ChartFrame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartFrameCopyWith<$Res> {
  factory $ChartFrameCopyWith(
          ChartFrame value, $Res Function(ChartFrame) then) =
      _$ChartFrameCopyWithImpl<$Res, ChartFrame>;
  @useResult
  $Res call(
      {Series series,
      Map<String, Series> indicators,
      Viewport viewport,
      List<dynamic> overlays,
      int sequenceNumber});

  $ViewportCopyWith<$Res> get viewport;
}

/// @nodoc
class _$ChartFrameCopyWithImpl<$Res, $Val extends ChartFrame>
    implements $ChartFrameCopyWith<$Res> {
  _$ChartFrameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? series = null,
    Object? indicators = null,
    Object? viewport = null,
    Object? overlays = null,
    Object? sequenceNumber = null,
  }) {
    return _then(_value.copyWith(
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Series,
      indicators: null == indicators
          ? _value.indicators
          : indicators // ignore: cast_nullable_to_non_nullable
              as Map<String, Series>,
      viewport: null == viewport
          ? _value.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as Viewport,
      overlays: null == overlays
          ? _value.overlays
          : overlays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViewportCopyWith<$Res> get viewport {
    return $ViewportCopyWith<$Res>(_value.viewport, (value) {
      return _then(_value.copyWith(viewport: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChartFrameImplCopyWith<$Res>
    implements $ChartFrameCopyWith<$Res> {
  factory _$$ChartFrameImplCopyWith(
          _$ChartFrameImpl value, $Res Function(_$ChartFrameImpl) then) =
      __$$ChartFrameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Series series,
      Map<String, Series> indicators,
      Viewport viewport,
      List<dynamic> overlays,
      int sequenceNumber});

  @override
  $ViewportCopyWith<$Res> get viewport;
}

/// @nodoc
class __$$ChartFrameImplCopyWithImpl<$Res>
    extends _$ChartFrameCopyWithImpl<$Res, _$ChartFrameImpl>
    implements _$$ChartFrameImplCopyWith<$Res> {
  __$$ChartFrameImplCopyWithImpl(
      _$ChartFrameImpl _value, $Res Function(_$ChartFrameImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? series = null,
    Object? indicators = null,
    Object? viewport = null,
    Object? overlays = null,
    Object? sequenceNumber = null,
  }) {
    return _then(_$ChartFrameImpl(
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Series,
      indicators: null == indicators
          ? _value._indicators
          : indicators // ignore: cast_nullable_to_non_nullable
              as Map<String, Series>,
      viewport: null == viewport
          ? _value.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as Viewport,
      overlays: null == overlays
          ? _value._overlays
          : overlays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      sequenceNumber: null == sequenceNumber
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChartFrameImpl implements _ChartFrame {
  const _$ChartFrameImpl(
      {required this.series,
      required final Map<String, Series> indicators,
      required this.viewport,
      required final List<dynamic> overlays,
      required this.sequenceNumber})
      : _indicators = indicators,
        _overlays = overlays;

  /// The main price [Series].
  @override
  final Series series;

  /// Map of indicator names to their respective [Series].
  final Map<String, Series> _indicators;

  /// Map of indicator names to their respective [Series].
  @override
  Map<String, Series> get indicators {
    if (_indicators is EqualUnmodifiableMapView) return _indicators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_indicators);
  }

  /// The current [Viewport] state.
  @override
  final Viewport viewport;

  /// List of overlays (e.g., drawings, alerts, etc.) to be rendered.
  final List<dynamic> _overlays;

  /// List of overlays (e.g., drawings, alerts, etc.) to be rendered.
  @override
  List<dynamic> get overlays {
    if (_overlays is EqualUnmodifiableListView) return _overlays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overlays);
  }

  /// Sequential number to track frame updates and ensure consistent state.
  @override
  final int sequenceNumber;

  @override
  String toString() {
    return 'ChartFrame(series: $series, indicators: $indicators, viewport: $viewport, overlays: $overlays, sequenceNumber: $sequenceNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartFrameImpl &&
            (identical(other.series, series) || other.series == series) &&
            const DeepCollectionEquality()
                .equals(other._indicators, _indicators) &&
            (identical(other.viewport, viewport) ||
                other.viewport == viewport) &&
            const DeepCollectionEquality().equals(other._overlays, _overlays) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                other.sequenceNumber == sequenceNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      series,
      const DeepCollectionEquality().hash(_indicators),
      viewport,
      const DeepCollectionEquality().hash(_overlays),
      sequenceNumber);

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartFrameImplCopyWith<_$ChartFrameImpl> get copyWith =>
      __$$ChartFrameImplCopyWithImpl<_$ChartFrameImpl>(this, _$identity);
}

abstract class _ChartFrame implements ChartFrame {
  const factory _ChartFrame(
      {required final Series series,
      required final Map<String, Series> indicators,
      required final Viewport viewport,
      required final List<dynamic> overlays,
      required final int sequenceNumber}) = _$ChartFrameImpl;

  /// The main price [Series].
  @override
  Series get series;

  /// Map of indicator names to their respective [Series].
  @override
  Map<String, Series> get indicators;

  /// The current [Viewport] state.
  @override
  Viewport get viewport;

  /// List of overlays (e.g., drawings, alerts, etc.) to be rendered.
  @override
  List<dynamic> get overlays;

  /// Sequential number to track frame updates and ensure consistent state.
  @override
  int get sequenceNumber;

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartFrameImplCopyWith<_$ChartFrameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
