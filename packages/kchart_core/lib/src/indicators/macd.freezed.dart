// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'macd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MACDConfig {
  String get id => throw _privateConstructorUsedError;
  int get fastPeriod => throw _privateConstructorUsedError;
  int get slowPeriod => throw _privateConstructorUsedError;
  int get signalPeriod => throw _privateConstructorUsedError;
  List<String> get dependsOn => throw _privateConstructorUsedError;

  /// Create a copy of MACDConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MACDConfigCopyWith<MACDConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MACDConfigCopyWith<$Res> {
  factory $MACDConfigCopyWith(
          MACDConfig value, $Res Function(MACDConfig) then) =
      _$MACDConfigCopyWithImpl<$Res, MACDConfig>;
  @useResult
  $Res call(
      {String id,
      int fastPeriod,
      int slowPeriod,
      int signalPeriod,
      List<String> dependsOn});
}

/// @nodoc
class _$MACDConfigCopyWithImpl<$Res, $Val extends MACDConfig>
    implements $MACDConfigCopyWith<$Res> {
  _$MACDConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MACDConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fastPeriod = null,
    Object? slowPeriod = null,
    Object? signalPeriod = null,
    Object? dependsOn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fastPeriod: null == fastPeriod
          ? _value.fastPeriod
          : fastPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      slowPeriod: null == slowPeriod
          ? _value.slowPeriod
          : slowPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      signalPeriod: null == signalPeriod
          ? _value.signalPeriod
          : signalPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      dependsOn: null == dependsOn
          ? _value.dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MACDConfigImplCopyWith<$Res>
    implements $MACDConfigCopyWith<$Res> {
  factory _$$MACDConfigImplCopyWith(
          _$MACDConfigImpl value, $Res Function(_$MACDConfigImpl) then) =
      __$$MACDConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int fastPeriod,
      int slowPeriod,
      int signalPeriod,
      List<String> dependsOn});
}

/// @nodoc
class __$$MACDConfigImplCopyWithImpl<$Res>
    extends _$MACDConfigCopyWithImpl<$Res, _$MACDConfigImpl>
    implements _$$MACDConfigImplCopyWith<$Res> {
  __$$MACDConfigImplCopyWithImpl(
      _$MACDConfigImpl _value, $Res Function(_$MACDConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of MACDConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fastPeriod = null,
    Object? slowPeriod = null,
    Object? signalPeriod = null,
    Object? dependsOn = null,
  }) {
    return _then(_$MACDConfigImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fastPeriod: null == fastPeriod
          ? _value.fastPeriod
          : fastPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      slowPeriod: null == slowPeriod
          ? _value.slowPeriod
          : slowPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      signalPeriod: null == signalPeriod
          ? _value.signalPeriod
          : signalPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      dependsOn: null == dependsOn
          ? _value._dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$MACDConfigImpl implements _MACDConfig {
  const _$MACDConfigImpl(
      {required this.id,
      this.fastPeriod = 12,
      this.slowPeriod = 26,
      this.signalPeriod = 9,
      final List<String> dependsOn = const []})
      : _dependsOn = dependsOn;

  @override
  final String id;
  @override
  @JsonKey()
  final int fastPeriod;
  @override
  @JsonKey()
  final int slowPeriod;
  @override
  @JsonKey()
  final int signalPeriod;
  final List<String> _dependsOn;
  @override
  @JsonKey()
  List<String> get dependsOn {
    if (_dependsOn is EqualUnmodifiableListView) return _dependsOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dependsOn);
  }

  @override
  String toString() {
    return 'MACDConfig(id: $id, fastPeriod: $fastPeriod, slowPeriod: $slowPeriod, signalPeriod: $signalPeriod, dependsOn: $dependsOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MACDConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fastPeriod, fastPeriod) ||
                other.fastPeriod == fastPeriod) &&
            (identical(other.slowPeriod, slowPeriod) ||
                other.slowPeriod == slowPeriod) &&
            (identical(other.signalPeriod, signalPeriod) ||
                other.signalPeriod == signalPeriod) &&
            const DeepCollectionEquality()
                .equals(other._dependsOn, _dependsOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fastPeriod, slowPeriod,
      signalPeriod, const DeepCollectionEquality().hash(_dependsOn));

  /// Create a copy of MACDConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MACDConfigImplCopyWith<_$MACDConfigImpl> get copyWith =>
      __$$MACDConfigImplCopyWithImpl<_$MACDConfigImpl>(this, _$identity);
}

abstract class _MACDConfig implements MACDConfig {
  const factory _MACDConfig(
      {required final String id,
      final int fastPeriod,
      final int slowPeriod,
      final int signalPeriod,
      final List<String> dependsOn}) = _$MACDConfigImpl;

  @override
  String get id;
  @override
  int get fastPeriod;
  @override
  int get slowPeriod;
  @override
  int get signalPeriod;
  @override
  List<String> get dependsOn;

  /// Create a copy of MACDConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MACDConfigImplCopyWith<_$MACDConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
