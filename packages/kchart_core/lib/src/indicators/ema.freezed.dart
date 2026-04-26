// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EMAConfig {
  String get id;
  int get period;
  List<String> get dependsOn;

  /// Create a copy of EMAConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EMAConfigCopyWith<EMAConfig> get copyWith =>
      _$EMAConfigCopyWithImpl<EMAConfig>(this as EMAConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EMAConfig &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality().equals(other.dependsOn, dependsOn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, period, const DeepCollectionEquality().hash(dependsOn));

  @override
  String toString() {
    return 'EMAConfig(id: $id, period: $period, dependsOn: $dependsOn)';
  }
}

/// @nodoc
abstract mixin class $EMAConfigCopyWith<$Res> {
  factory $EMAConfigCopyWith(EMAConfig value, $Res Function(EMAConfig) _then) =
      _$EMAConfigCopyWithImpl;
  @useResult
  $Res call({String id, int period, List<String> dependsOn});
}

/// @nodoc
class _$EMAConfigCopyWithImpl<$Res> implements $EMAConfigCopyWith<$Res> {
  _$EMAConfigCopyWithImpl(this._self, this._then);

  final EMAConfig _self;
  final $Res Function(EMAConfig) _then;

  /// Create a copy of EMAConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? period = null,
    Object? dependsOn = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      dependsOn: null == dependsOn
          ? _self.dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EMAConfig].
extension EMAConfigPatterns on EMAConfig {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EMAConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EMAConfig() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EMAConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EMAConfig():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EMAConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EMAConfig() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, int period, List<String> dependsOn)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EMAConfig() when $default != null:
        return $default(_that.id, _that.period, _that.dependsOn);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, int period, List<String> dependsOn) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EMAConfig():
        return $default(_that.id, _that.period, _that.dependsOn);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, int period, List<String> dependsOn)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EMAConfig() when $default != null:
        return $default(_that.id, _that.period, _that.dependsOn);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _EMAConfig implements EMAConfig {
  const _EMAConfig(
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

  /// Create a copy of EMAConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EMAConfigCopyWith<_EMAConfig> get copyWith =>
      __$EMAConfigCopyWithImpl<_EMAConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EMAConfig &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other._dependsOn, _dependsOn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, period, const DeepCollectionEquality().hash(_dependsOn));

  @override
  String toString() {
    return 'EMAConfig(id: $id, period: $period, dependsOn: $dependsOn)';
  }
}

/// @nodoc
abstract mixin class _$EMAConfigCopyWith<$Res>
    implements $EMAConfigCopyWith<$Res> {
  factory _$EMAConfigCopyWith(
          _EMAConfig value, $Res Function(_EMAConfig) _then) =
      __$EMAConfigCopyWithImpl;
  @override
  @useResult
  $Res call({String id, int period, List<String> dependsOn});
}

/// @nodoc
class __$EMAConfigCopyWithImpl<$Res> implements _$EMAConfigCopyWith<$Res> {
  __$EMAConfigCopyWithImpl(this._self, this._then);

  final _EMAConfig _self;
  final $Res Function(_EMAConfig) _then;

  /// Create a copy of EMAConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? period = null,
    Object? dependsOn = null,
  }) {
    return _then(_EMAConfig(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _self.period
          : period // ignore: cast_nullable_to_non_nullable
              as int,
      dependsOn: null == dependsOn
          ? _self._dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
