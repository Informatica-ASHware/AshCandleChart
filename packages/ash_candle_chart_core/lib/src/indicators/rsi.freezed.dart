// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RSIConfig {
  String get id;
  int get period;
  List<String> get dependsOn;

  /// Create a copy of RSIConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RSIConfigCopyWith<RSIConfig> get copyWith =>
      _$RSIConfigCopyWithImpl<RSIConfig>(this as RSIConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RSIConfig &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality().equals(other.dependsOn, dependsOn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, period, const DeepCollectionEquality().hash(dependsOn));

  @override
  String toString() {
    return 'RSIConfig(id: $id, period: $period, dependsOn: $dependsOn)';
  }
}

/// @nodoc
abstract mixin class $RSIConfigCopyWith<$Res> {
  factory $RSIConfigCopyWith(RSIConfig value, $Res Function(RSIConfig) _then) =
      _$RSIConfigCopyWithImpl;
  @useResult
  $Res call({String id, int period, List<String> dependsOn});
}

/// @nodoc
class _$RSIConfigCopyWithImpl<$Res> implements $RSIConfigCopyWith<$Res> {
  _$RSIConfigCopyWithImpl(this._self, this._then);

  final RSIConfig _self;
  final $Res Function(RSIConfig) _then;

  /// Create a copy of RSIConfig
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

/// Adds pattern-matching-related methods to [RSIConfig].
extension RSIConfigPatterns on RSIConfig {
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
    TResult Function(_RSIConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RSIConfig() when $default != null:
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
    TResult Function(_RSIConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RSIConfig():
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
    TResult? Function(_RSIConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RSIConfig() when $default != null:
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
      case _RSIConfig() when $default != null:
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
      case _RSIConfig():
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
      case _RSIConfig() when $default != null:
        return $default(_that.id, _that.period, _that.dependsOn);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RSIConfig implements RSIConfig {
  const _RSIConfig(
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

  /// Create a copy of RSIConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RSIConfigCopyWith<_RSIConfig> get copyWith =>
      __$RSIConfigCopyWithImpl<_RSIConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RSIConfig &&
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
    return 'RSIConfig(id: $id, period: $period, dependsOn: $dependsOn)';
  }
}

/// @nodoc
abstract mixin class _$RSIConfigCopyWith<$Res>
    implements $RSIConfigCopyWith<$Res> {
  factory _$RSIConfigCopyWith(
          _RSIConfig value, $Res Function(_RSIConfig) _then) =
      __$RSIConfigCopyWithImpl;
  @override
  @useResult
  $Res call({String id, int period, List<String> dependsOn});
}

/// @nodoc
class __$RSIConfigCopyWithImpl<$Res> implements _$RSIConfigCopyWith<$Res> {
  __$RSIConfigCopyWithImpl(this._self, this._then);

  final _RSIConfig _self;
  final $Res Function(_RSIConfig) _then;

  /// Create a copy of RSIConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? period = null,
    Object? dependsOn = null,
  }) {
    return _then(_RSIConfig(
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
