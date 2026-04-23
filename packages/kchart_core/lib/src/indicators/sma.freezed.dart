// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sma.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SMAConfig {
  String get id => throw _privateConstructorUsedError;
  int get period => throw _privateConstructorUsedError;
  List<String> get dependsOn => throw _privateConstructorUsedError;

  /// Create a copy of SMAConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SMAConfigCopyWith<SMAConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SMAConfigCopyWith<$Res> {
  factory $SMAConfigCopyWith(SMAConfig value, $Res Function(SMAConfig) then) =
      _$SMAConfigCopyWithImpl<$Res, SMAConfig>;
  @useResult
  $Res call({String id, int period, List<String> dependsOn});
}

/// @nodoc
class _$SMAConfigCopyWithImpl<$Res, $Val extends SMAConfig>
    implements $SMAConfigCopyWith<$Res> {
  _$SMAConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SMAConfig
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
abstract class _$$SMAConfigImplCopyWith<$Res>
    implements $SMAConfigCopyWith<$Res> {
  factory _$$SMAConfigImplCopyWith(
          _$SMAConfigImpl value, $Res Function(_$SMAConfigImpl) then) =
      __$$SMAConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int period, List<String> dependsOn});
}

/// @nodoc
class __$$SMAConfigImplCopyWithImpl<$Res>
    extends _$SMAConfigCopyWithImpl<$Res, _$SMAConfigImpl>
    implements _$$SMAConfigImplCopyWith<$Res> {
  __$$SMAConfigImplCopyWithImpl(
      _$SMAConfigImpl _value, $Res Function(_$SMAConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of SMAConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? period = null,
    Object? dependsOn = null,
  }) {
    return _then(_$SMAConfigImpl(
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

class _$SMAConfigImpl implements _SMAConfig {
  const _$SMAConfigImpl(
      {required this.id,
      this.period = 20,
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
    return 'SMAConfig(id: $id, period: $period, dependsOn: $dependsOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SMAConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other._dependsOn, _dependsOn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, period, const DeepCollectionEquality().hash(_dependsOn));

  /// Create a copy of SMAConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SMAConfigImplCopyWith<_$SMAConfigImpl> get copyWith =>
      __$$SMAConfigImplCopyWithImpl<_$SMAConfigImpl>(this, _$identity);
}

abstract class _SMAConfig implements SMAConfig {
  const factory _SMAConfig(
      {required final String id,
      final int period,
      final List<String> dependsOn}) = _$SMAConfigImpl;

  @override
  String get id;
  @override
  int get period;
  @override
  List<String> get dependsOn;

  /// Create a copy of SMAConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SMAConfigImplCopyWith<_$SMAConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
