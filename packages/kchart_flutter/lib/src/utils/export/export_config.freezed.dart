// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'export_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExportConfig {
  /// The pixel ratio for the exported image. Defaults to 2.0.
  double get pixelRatio => throw _privateConstructorUsedError;

  /// Optional watermark text to be displayed on the image.
  String? get watermark => throw _privateConstructorUsedError;

  /// Whether the image background should be opaque. Defaults to true.
  bool get opaque => throw _privateConstructorUsedError;

  /// The background color for the exported image.
  /// Only used if [opaque] is true. Defaults to [Colors.white].
  Color get backgroundColor => throw _privateConstructorUsedError;

  /// Create a copy of ExportConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExportConfigCopyWith<ExportConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportConfigCopyWith<$Res> {
  factory $ExportConfigCopyWith(
          ExportConfig value, $Res Function(ExportConfig) then) =
      _$ExportConfigCopyWithImpl<$Res, ExportConfig>;
  @useResult
  $Res call(
      {double pixelRatio,
      String? watermark,
      bool opaque,
      Color backgroundColor});
}

/// @nodoc
class _$ExportConfigCopyWithImpl<$Res, $Val extends ExportConfig>
    implements $ExportConfigCopyWith<$Res> {
  _$ExportConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      pixelRatio: null == pixelRatio
          ? _value.pixelRatio
          : pixelRatio // ignore: cast_nullable_to_non_nullable
              as double,
      watermark: freezed == watermark
          ? _value.watermark
          : watermark // ignore: cast_nullable_to_non_nullable
              as String?,
      opaque: null == opaque
          ? _value.opaque
          : opaque // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExportConfigImplCopyWith<$Res>
    implements $ExportConfigCopyWith<$Res> {
  factory _$$ExportConfigImplCopyWith(
          _$ExportConfigImpl value, $Res Function(_$ExportConfigImpl) then) =
      __$$ExportConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double pixelRatio,
      String? watermark,
      bool opaque,
      Color backgroundColor});
}

/// @nodoc
class __$$ExportConfigImplCopyWithImpl<$Res>
    extends _$ExportConfigCopyWithImpl<$Res, _$ExportConfigImpl>
    implements _$$ExportConfigImplCopyWith<$Res> {
  __$$ExportConfigImplCopyWithImpl(
      _$ExportConfigImpl _value, $Res Function(_$ExportConfigImpl) _then)
      : super(_value, _then);

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
    return _then(_$ExportConfigImpl(
      pixelRatio: null == pixelRatio
          ? _value.pixelRatio
          : pixelRatio // ignore: cast_nullable_to_non_nullable
              as double,
      watermark: freezed == watermark
          ? _value.watermark
          : watermark // ignore: cast_nullable_to_non_nullable
              as String?,
      opaque: null == opaque
          ? _value.opaque
          : opaque // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$ExportConfigImpl implements _ExportConfig {
  const _$ExportConfigImpl(
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

  @override
  String toString() {
    return 'ExportConfig(pixelRatio: $pixelRatio, watermark: $watermark, opaque: $opaque, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportConfigImpl &&
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

  /// Create a copy of ExportConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportConfigImplCopyWith<_$ExportConfigImpl> get copyWith =>
      __$$ExportConfigImplCopyWithImpl<_$ExportConfigImpl>(this, _$identity);
}

abstract class _ExportConfig implements ExportConfig {
  const factory _ExportConfig(
      {final double pixelRatio,
      final String? watermark,
      final bool opaque,
      final Color backgroundColor}) = _$ExportConfigImpl;

  /// The pixel ratio for the exported image. Defaults to 2.0.
  @override
  double get pixelRatio;

  /// Optional watermark text to be displayed on the image.
  @override
  String? get watermark;

  /// Whether the image background should be opaque. Defaults to true.
  @override
  bool get opaque;

  /// The background color for the exported image.
  /// Only used if [opaque] is true. Defaults to [Colors.white].
  @override
  Color get backgroundColor;

  /// Create a copy of ExportConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportConfigImplCopyWith<_$ExportConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
