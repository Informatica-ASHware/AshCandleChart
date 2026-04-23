// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crosshair_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CrosshairState {
  /// Horizontal position in local pixels.
  double? get dx => throw _privateConstructorUsedError;

  /// Vertical position in local pixels.
  double? get dy => throw _privateConstructorUsedError;

  /// The timestamp at the current horizontal position.
  int? get timestamp => throw _privateConstructorUsedError;

  /// The price (or value) at the current vertical position.
  double? get price => throw _privateConstructorUsedError;

  /// Create a copy of CrosshairState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CrosshairStateCopyWith<CrosshairState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrosshairStateCopyWith<$Res> {
  factory $CrosshairStateCopyWith(
          CrosshairState value, $Res Function(CrosshairState) then) =
      _$CrosshairStateCopyWithImpl<$Res, CrosshairState>;
  @useResult
  $Res call({double? dx, double? dy, int? timestamp, double? price});
}

/// @nodoc
class _$CrosshairStateCopyWithImpl<$Res, $Val extends CrosshairState>
    implements $CrosshairStateCopyWith<$Res> {
  _$CrosshairStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CrosshairState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dx = freezed,
    Object? dy = freezed,
    Object? timestamp = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      dx: freezed == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double?,
      dy: freezed == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrosshairStateImplCopyWith<$Res>
    implements $CrosshairStateCopyWith<$Res> {
  factory _$$CrosshairStateImplCopyWith(_$CrosshairStateImpl value,
          $Res Function(_$CrosshairStateImpl) then) =
      __$$CrosshairStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? dx, double? dy, int? timestamp, double? price});
}

/// @nodoc
class __$$CrosshairStateImplCopyWithImpl<$Res>
    extends _$CrosshairStateCopyWithImpl<$Res, _$CrosshairStateImpl>
    implements _$$CrosshairStateImplCopyWith<$Res> {
  __$$CrosshairStateImplCopyWithImpl(
      _$CrosshairStateImpl _value, $Res Function(_$CrosshairStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CrosshairState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dx = freezed,
    Object? dy = freezed,
    Object? timestamp = freezed,
    Object? price = freezed,
  }) {
    return _then(_$CrosshairStateImpl(
      dx: freezed == dx
          ? _value.dx
          : dx // ignore: cast_nullable_to_non_nullable
              as double?,
      dy: freezed == dy
          ? _value.dy
          : dy // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$CrosshairStateImpl implements _CrosshairState {
  const _$CrosshairStateImpl({this.dx, this.dy, this.timestamp, this.price});

  /// Horizontal position in local pixels.
  @override
  final double? dx;

  /// Vertical position in local pixels.
  @override
  final double? dy;

  /// The timestamp at the current horizontal position.
  @override
  final int? timestamp;

  /// The price (or value) at the current vertical position.
  @override
  final double? price;

  @override
  String toString() {
    return 'CrosshairState(dx: $dx, dy: $dy, timestamp: $timestamp, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrosshairStateImpl &&
            (identical(other.dx, dx) || other.dx == dx) &&
            (identical(other.dy, dy) || other.dy == dy) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dx, dy, timestamp, price);

  /// Create a copy of CrosshairState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrosshairStateImplCopyWith<_$CrosshairStateImpl> get copyWith =>
      __$$CrosshairStateImplCopyWithImpl<_$CrosshairStateImpl>(
          this, _$identity);
}

abstract class _CrosshairState implements CrosshairState {
  const factory _CrosshairState(
      {final double? dx,
      final double? dy,
      final int? timestamp,
      final double? price}) = _$CrosshairStateImpl;

  /// Horizontal position in local pixels.
  @override
  double? get dx;

  /// Vertical position in local pixels.
  @override
  double? get dy;

  /// The timestamp at the current horizontal position.
  @override
  int? get timestamp;

  /// The price (or value) at the current vertical position.
  @override
  double? get price;

  /// Create a copy of CrosshairState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrosshairStateImplCopyWith<_$CrosshairStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
