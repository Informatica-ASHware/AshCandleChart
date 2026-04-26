// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'export_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExportConfig {
  /// The pixel ratio for the exported image. Defaults to 2.0.
  double get pixelRatio;

  /// Optional watermark text to be displayed on the image.
  String? get watermark;

  /// Whether the image background should be opaque. Defaults to true.
  bool get opaque;

  /// The background color for the exported image.
  /// Only used if [opaque] is true. Defaults to [Colors.white].
  Color get backgroundColor;

  /// Create a copy of ExportConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExportConfigCopyWith<ExportConfig> get copyWith =>
      _$ExportConfigCopyWithImpl<ExportConfig>(
          this as ExportConfig, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExportConfig &&
            (identical(other.pixelRatio, pixelRatio) ||
                other.pixelRatio == pixelRatio) &&
            (identical(other.watermark, watermark) ||
                other.watermark == watermark) &&
            (identical(other.opaque, opaque) || other.opaque == opaque) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pixelRatio, watermark, opaque, backgroundColor);

  @override
  String toString() {
    return 'ExportConfig(pixelRatio: $pixelRatio, watermark: $watermark, opaque: $opaque, backgroundColor: $backgroundColor)';
  }
}

/// @nodoc
abstract mixin class $ExportConfigCopyWith<$Res> {
  factory $ExportConfigCopyWith(
          ExportConfig value, $Res Function(ExportConfig) _then) =
      _$ExportConfigCopyWithImpl;
  @useResult
  $Res call(
      {double pixelRatio,
      String? watermark,
      bool opaque,
      Color backgroundColor});
}

/// @nodoc
class _$ExportConfigCopyWithImpl<$Res> implements $ExportConfigCopyWith<$Res> {
  _$ExportConfigCopyWithImpl(this._self, this._then);

  final ExportConfig _self;
  final $Res Function(ExportConfig) _then;

  /// Create a copy of ExportConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pixelRatio = null,
    Object? watermark = freezed,
    Object? opaque = null,
    Object? backgroundColor = null,
  }) {
    return _then(_self.copyWith(
      pixelRatio: null == pixelRatio
          ? _self.pixelRatio
          : pixelRatio // ignore: cast_nullable_to_non_nullable
              as double,
      watermark: freezed == watermark
          ? _self.watermark
          : watermark // ignore: cast_nullable_to_non_nullable
              as String?,
      opaque: null == opaque
          ? _self.opaque
          : opaque // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundColor: null == backgroundColor
          ? _self.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExportConfig].
extension ExportConfigPatterns on ExportConfig {
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
    TResult Function(_ExportConfig value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExportConfig() when $default != null:
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
    TResult Function(_ExportConfig value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExportConfig():
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
    TResult? Function(_ExportConfig value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExportConfig() when $default != null:
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
    TResult Function(double pixelRatio, String? watermark, bool opaque,
            Color backgroundColor)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExportConfig() when $default != null:
        return $default(_that.pixelRatio, _that.watermark, _that.opaque,
            _that.backgroundColor);
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
    TResult Function(double pixelRatio, String? watermark, bool opaque,
            Color backgroundColor)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExportConfig():
        return $default(_that.pixelRatio, _that.watermark, _that.opaque,
            _that.backgroundColor);
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
    TResult? Function(double pixelRatio, String? watermark, bool opaque,
            Color backgroundColor)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExportConfig() when $default != null:
        return $default(_that.pixelRatio, _that.watermark, _that.opaque,
            _that.backgroundColor);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExportConfig implements ExportConfig {
  const _ExportConfig(
      {this.pixelRatio = 2.0,
      this.watermark,
      this.opaque = true,
      this.backgroundColor = Colors.white});

  /// The pixel ratio for the exported image. Defaults to 2.0.
  @override
  @JsonKey()
  final double pixelRatio;

  /// Optional watermark text to be displayed on the image.
  @override
  final String? watermark;

  /// Whether the image background should be opaque. Defaults to true.
  @override
  @JsonKey()
  final bool opaque;

  /// The background color for the exported image.
  /// Only used if [opaque] is true. Defaults to [Colors.white].
  @override
  @JsonKey()
  final Color backgroundColor;

  /// Create a copy of ExportConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExportConfigCopyWith<_ExportConfig> get copyWith =>
      __$ExportConfigCopyWithImpl<_ExportConfig>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExportConfig &&
            (identical(other.pixelRatio, pixelRatio) ||
                other.pixelRatio == pixelRatio) &&
            (identical(other.watermark, watermark) ||
                other.watermark == watermark) &&
            (identical(other.opaque, opaque) || other.opaque == opaque) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pixelRatio, watermark, opaque, backgroundColor);

  @override
  String toString() {
    return 'ExportConfig(pixelRatio: $pixelRatio, watermark: $watermark, opaque: $opaque, backgroundColor: $backgroundColor)';
  }
}

/// @nodoc
abstract mixin class _$ExportConfigCopyWith<$Res>
    implements $ExportConfigCopyWith<$Res> {
  factory _$ExportConfigCopyWith(
          _ExportConfig value, $Res Function(_ExportConfig) _then) =
      __$ExportConfigCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double pixelRatio,
      String? watermark,
      bool opaque,
      Color backgroundColor});
}

/// @nodoc
class __$ExportConfigCopyWithImpl<$Res>
    implements _$ExportConfigCopyWith<$Res> {
  __$ExportConfigCopyWithImpl(this._self, this._then);

  final _ExportConfig _self;
  final $Res Function(_ExportConfig) _then;

  /// Create a copy of ExportConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pixelRatio = null,
    Object? watermark = freezed,
    Object? opaque = null,
    Object? backgroundColor = null,
  }) {
    return _then(_ExportConfig(
      pixelRatio: null == pixelRatio
          ? _self.pixelRatio
          : pixelRatio // ignore: cast_nullable_to_non_nullable
              as double,
      watermark: freezed == watermark
          ? _self.watermark
          : watermark // ignore: cast_nullable_to_non_nullable
              as String?,
      opaque: null == opaque
          ? _self.opaque
          : opaque // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundColor: null == backgroundColor
          ? _self.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

// dart format on
