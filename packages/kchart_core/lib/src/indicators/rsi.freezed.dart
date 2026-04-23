// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RSIConfig {
  String get id => throw _privateConstructorUsedError;
  int get period => throw _privateConstructorUsedError;
  List<String> get dependsOn => throw _privateConstructorUsedError;

  /// Create a copy of RSIConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RSIConfigCopyWith<RSIConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RSIConfigCopyWith<$Res> {
  factory $RSIConfigCopyWith(RSIConfig value, $Res Function(RSIConfig) then) =
      _$RSIConfigCopyWithImpl<$Res, RSIConfig>;
  @useResult
  $Res call({String id, int period, List<String> dependsOn});
}

/// @nodoc
class _$RSIConfigCopyWithImpl<$Res, $Val extends RSIConfig>
    implements $RSIConfigCopyWith<$Res> {
  _$RSIConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RSIConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? period = null,
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
      dependsOn: null == dependsOn
          ? _value.dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RSIConfigImplCopyWith<$Res>
    implements $RSIConfigCopyWith<$Res> {
  factory _$$RSIConfigImplCopyWith(
          _$RSIConfigImpl value, $Res Function(_$RSIConfigImpl) then) =
      __$$RSIConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int period, List<String> dependsOn});
}

/// @nodoc
class __$$RSIConfigImplCopyWithImpl<$Res>
    extends _$RSIConfigCopyWithImpl<$Res, _$RSIConfigImpl>
    implements _$$RSIConfigImplCopyWith<$Res> {
  __$$RSIConfigImplCopyWithImpl(
      _$RSIConfigImpl _value, $Res Function(_$RSIConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of RSIConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? period = null,
    Object? dependsOn = null,
  }) {
    return _then(_$RSIConfigImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      dependsOn: null == dependsOn
          ? _value._dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$RSIConfigImpl implements _RSIConfig {
  const _$RSIConfigImpl(
      {required this.id,
      this.period = 14,
      final List<String> dependsOn = const []})
      : _dependsOn = dependsOn;

  @override
  final String id;
  @override
  @JsonKey()
  final int period;
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
    return 'RSIConfig(id: $id, period: $period, dependsOn: $dependsOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RSIConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other._dependsOn, _dependsOn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, period, const DeepCollectionEquality().hash(_dependsOn));

  /// Create a copy of RSIConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RSIConfigImplCopyWith<_$RSIConfigImpl> get copyWith =>
      __$$RSIConfigImplCopyWithImpl<_$RSIConfigImpl>(this, _$identity);
}

abstract class _RSIConfig implements RSIConfig {
  const factory _RSIConfig(
      {required final String id,
      final int period,
      final List<String> dependsOn}) = _$RSIConfigImpl;

  @override
  String get id;
  @override
  int get period;
  @override
  List<String> get dependsOn;

  /// Create a copy of RSIConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RSIConfigImplCopyWith<_$RSIConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
