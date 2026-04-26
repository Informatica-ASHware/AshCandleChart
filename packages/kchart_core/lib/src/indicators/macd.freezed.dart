// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'macd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MACDConfig {
  String get id;
  int get fastPeriod;
  int get slowPeriod;
  int get signalPeriod;
  List<String> get dependsOn;

  /// Create a copy of MACDConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MACDConfigCopyWith<MACDConfig> get copyWith =>
      _$MACDConfigCopyWithImpl<MACDConfig>(this as MACDConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MACDConfig &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fastPeriod, fastPeriod) ||
                other.fastPeriod == fastPeriod) &&
            (identical(other.slowPeriod, slowPeriod) ||
                other.slowPeriod == slowPeriod) &&
            (identical(other.signalPeriod, signalPeriod) ||
                other.signalPeriod == signalPeriod) &&
            const DeepCollectionEquality().equals(other.dependsOn, dependsOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, fastPeriod, slowPeriod,
      signalPeriod, const DeepCollectionEquality().hash(dependsOn));

  @override
  String toString() {
    return 'MACDConfig(id: $id, fastPeriod: $fastPeriod, slowPeriod: $slowPeriod, signalPeriod: $signalPeriod, dependsOn: $dependsOn)';
  }
}

/// @nodoc
abstract mixin class $MACDConfigCopyWith<$Res> {
  factory $MACDConfigCopyWith(
          MACDConfig value, $Res Function(MACDConfig) _then) =
      _$MACDConfigCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int fastPeriod,
      int slowPeriod,
      int signalPeriod,
      List<String> dependsOn});
}

/// @nodoc
class _$MACDConfigCopyWithImpl<$Res> implements $MACDConfigCopyWith<$Res> {
  _$MACDConfigCopyWithImpl(this._self, this._then);

  final MACDConfig _self;
  final $Res Function(MACDConfig) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fastPeriod: null == fastPeriod
          ? _self.fastPeriod
          : fastPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      slowPeriod: null == slowPeriod
          ? _self.slowPeriod
          : slowPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      signalPeriod: null == signalPeriod
          ? _self.signalPeriod
          : signalPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      dependsOn: null == dependsOn
          ? _self.dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MACDConfig].
extension MACDConfigPatterns on MACDConfig {
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
    TResult Function(_MACDConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MACDConfig() when $default != null:
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
    TResult Function(_MACDConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MACDConfig():
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
    TResult? Function(_MACDConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MACDConfig() when $default != null:
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
    TResult Function(String id, int fastPeriod, int slowPeriod,
            int signalPeriod, List<String> dependsOn)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MACDConfig() when $default != null:
        return $default(_that.id, _that.fastPeriod, _that.slowPeriod,
            _that.signalPeriod, _that.dependsOn);
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
    TResult Function(String id, int fastPeriod, int slowPeriod,
            int signalPeriod, List<String> dependsOn)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MACDConfig():
        return $default(_that.id, _that.fastPeriod, _that.slowPeriod,
            _that.signalPeriod, _that.dependsOn);
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
    TResult? Function(String id, int fastPeriod, int slowPeriod,
            int signalPeriod, List<String> dependsOn)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MACDConfig() when $default != null:
        return $default(_that.id, _that.fastPeriod, _that.slowPeriod,
            _that.signalPeriod, _that.dependsOn);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MACDConfig implements MACDConfig {
  const _MACDConfig(
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

  /// Create a copy of MACDConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MACDConfigCopyWith<_MACDConfig> get copyWith =>
      __$MACDConfigCopyWithImpl<_MACDConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MACDConfig &&
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

  @override
  String toString() {
    return 'MACDConfig(id: $id, fastPeriod: $fastPeriod, slowPeriod: $slowPeriod, signalPeriod: $signalPeriod, dependsOn: $dependsOn)';
  }
}

/// @nodoc
abstract mixin class _$MACDConfigCopyWith<$Res>
    implements $MACDConfigCopyWith<$Res> {
  factory _$MACDConfigCopyWith(
          _MACDConfig value, $Res Function(_MACDConfig) _then) =
      __$MACDConfigCopyWithImpl;
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
class __$MACDConfigCopyWithImpl<$Res> implements _$MACDConfigCopyWith<$Res> {
  __$MACDConfigCopyWithImpl(this._self, this._then);

  final _MACDConfig _self;
  final $Res Function(_MACDConfig) _then;

  /// Create a copy of MACDConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? fastPeriod = null,
    Object? slowPeriod = null,
    Object? signalPeriod = null,
    Object? dependsOn = null,
  }) {
    return _then(_MACDConfig(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fastPeriod: null == fastPeriod
          ? _self.fastPeriod
          : fastPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      slowPeriod: null == slowPeriod
          ? _self.slowPeriod
          : slowPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      signalPeriod: null == signalPeriod
          ? _self.signalPeriod
          : signalPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      dependsOn: null == dependsOn
          ? _self._dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
