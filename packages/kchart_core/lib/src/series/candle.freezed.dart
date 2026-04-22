// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Candle {
  /// Unix timestamp in milliseconds.
  int get timestamp => throw _privateConstructorUsedError;

  /// Opening price.
  double get open => throw _privateConstructorUsedError;

  /// Highest price reached during the interval.
  double get high => throw _privateConstructorUsedError;

  /// Lowest price reached during the interval.
  double get low => throw _privateConstructorUsedError;

  /// Closing price.
  double get close => throw _privateConstructorUsedError;

  /// Volume traded during the interval.
  double get volume => throw _privateConstructorUsedError;

  /// Create a copy of Candle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CandleCopyWith<Candle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandleCopyWith<$Res> {
  factory $CandleCopyWith(Candle value, $Res Function(Candle) then) =
      _$CandleCopyWithImpl<$Res, Candle>;
  @useResult
  $Res call(
      {int timestamp,
      double open,
      double high,
      double low,
      double close,
      double volume});
}

/// @nodoc
class _$CandleCopyWithImpl<$Res, $Val extends Candle>
    implements $CandleCopyWith<$Res> {
  _$CandleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Candle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CandleImplCopyWith<$Res> implements $CandleCopyWith<$Res> {
  factory _$$CandleImplCopyWith(
          _$CandleImpl value, $Res Function(_$CandleImpl) then) =
      __$$CandleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int timestamp,
      double open,
      double high,
      double low,
      double close,
      double volume});
}

/// @nodoc
class __$$CandleImplCopyWithImpl<$Res>
    extends _$CandleCopyWithImpl<$Res, _$CandleImpl>
    implements _$$CandleImplCopyWith<$Res> {
  __$$CandleImplCopyWithImpl(
      _$CandleImpl _value, $Res Function(_$CandleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Candle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_$CandleImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CandleImpl implements _Candle {
  const _$CandleImpl(
      {required this.timestamp,
      required this.open,
      required this.high,
      required this.low,
      required this.close,
      required this.volume});

  /// Unix timestamp in milliseconds.
  @override
  final int timestamp;

  /// Opening price.
  @override
  final double open;

  /// Highest price reached during the interval.
  @override
  final double high;

  /// Lowest price reached during the interval.
  @override
  final double low;

  /// Closing price.
  @override
  final double close;

  /// Volume traded during the interval.
  @override
  final double volume;

  @override
  String toString() {
    return 'Candle(timestamp: $timestamp, open: $open, high: $high, low: $low, close: $close, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandleImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, timestamp, open, high, low, close, volume);

  /// Create a copy of Candle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CandleImplCopyWith<_$CandleImpl> get copyWith =>
      __$$CandleImplCopyWithImpl<_$CandleImpl>(this, _$identity);
}

abstract class _Candle implements Candle {
  const factory _Candle(
      {required final int timestamp,
      required final double open,
      required final double high,
      required final double low,
      required final double close,
      required final double volume}) = _$CandleImpl;

  /// Unix timestamp in milliseconds.
  @override
  int get timestamp;

  /// Opening price.
  @override
  double get open;

  /// Highest price reached during the interval.
  @override
  double get high;

  /// Lowest price reached during the interval.
  @override
  double get low;

  /// Closing price.
  @override
  double get close;

  /// Volume traded during the interval.
  @override
  double get volume;

  /// Create a copy of Candle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CandleImplCopyWith<_$CandleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
