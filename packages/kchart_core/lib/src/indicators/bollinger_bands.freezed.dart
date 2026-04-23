// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bollinger_bands.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BollingerBandsConfig {
  String get id => throw _privateConstructorUsedError;
  int get period => throw _privateConstructorUsedError;
  double get stdDev => throw _privateConstructorUsedError;
  List<String> get dependsOn => throw _privateConstructorUsedError;

  /// Create a copy of BollingerBandsConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BollingerBandsConfigCopyWith<BollingerBandsConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BollingerBandsConfigCopyWith<$Res> {
  factory $BollingerBandsConfigCopyWith(BollingerBandsConfig value,
          $Res Function(BollingerBandsConfig) then) =
      _$BollingerBandsConfigCopyWithImpl<$Res, BollingerBandsConfig>;
  @useResult
  $Res call({String id, int period, double stdDev, List<String> dependsOn});
}

/// @nodoc
class _$BollingerBandsConfigCopyWithImpl<$Res,
        $Val extends BollingerBandsConfig>
    implements $BollingerBandsConfigCopyWith<$Res> {
  _$BollingerBandsConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BollingerBandsConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? period = null,
    Object? stdDev = null,
    Object? dependsOn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      stdDev: null == stdDev
          ? _value.stdDev
          : stdDev // ignore: cast_nullable_to_non_nullable
              as double,
      dependsOn: null == dependsOn
          ? _value.dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BollingerBandsConfigImplCopyWith<$Res>
    implements $BollingerBandsConfigCopyWith<$Res> {
  factory _$$BollingerBandsConfigImplCopyWith(_$BollingerBandsConfigImpl value,
          $Res Function(_$BollingerBandsConfigImpl) then) =
      __$$BollingerBandsConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int period, double stdDev, List<String> dependsOn});
}

/// @nodoc
class __$$BollingerBandsConfigImplCopyWithImpl<$Res>
    extends _$BollingerBandsConfigCopyWithImpl<$Res, _$BollingerBandsConfigImpl>
    implements _$$BollingerBandsConfigImplCopyWith<$Res> {
  __$$BollingerBandsConfigImplCopyWithImpl(_$BollingerBandsConfigImpl _value,
      $Res Function(_$BollingerBandsConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of BollingerBandsConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? period = null,
    Object? stdDev = null,
    Object? dependsOn = null,
  }) {
    return _then(_$BollingerBandsConfigImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      stdDev: null == stdDev
          ? _value.stdDev
          : stdDev // ignore: cast_nullable_to_non_nullable
              as double,
      dependsOn: null == dependsOn
          ? _value._dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$BollingerBandsConfigImpl implements _BollingerBandsConfig {
  const _$BollingerBandsConfigImpl(
      {required this.id,
      this.period = 20,
      this.stdDev = 2.0,
      final List<String> dependsOn = const []})
      : _dependsOn = dependsOn;

  @override
  final String id;
  @override
  @JsonKey()
  final int period;
  @override
  @JsonKey()
  final double stdDev;
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
    return 'BollingerBandsConfig(id: $id, period: $period, stdDev: $stdDev, dependsOn: $dependsOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BollingerBandsConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.stdDev, stdDev) || other.stdDev == stdDev) &&
            const DeepCollectionEquality()
                .equals(other._dependsOn, _dependsOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, period, stdDev,
      const DeepCollectionEquality().hash(_dependsOn));

  /// Create a copy of BollingerBandsConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BollingerBandsConfigImplCopyWith<_$BollingerBandsConfigImpl>
      get copyWith =>
          __$$BollingerBandsConfigImplCopyWithImpl<_$BollingerBandsConfigImpl>(
              this, _$identity);
}

abstract class _BollingerBandsConfig implements BollingerBandsConfig {
  const factory _BollingerBandsConfig(
      {required final String id,
      final int period,
      final double stdDev,
      final List<String> dependsOn}) = _$BollingerBandsConfigImpl;

  @override
  String get id;
  @override
  int get period;
  @override
  double get stdDev;
  @override
  List<String> get dependsOn;

  /// Create a copy of BollingerBandsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BollingerBandsConfigImplCopyWith<_$BollingerBandsConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}
