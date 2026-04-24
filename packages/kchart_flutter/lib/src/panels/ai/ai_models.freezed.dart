// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AiInsight {
  /// The descriptive text of the insight.
  String get text => throw _privateConstructorUsedError;

  /// The type of pattern identified (e.g., "Bullish Engulfing").
  String get patternType => throw _privateConstructorUsedError;

  /// The severity of the insight.
  InsightSeverity get severity => throw _privateConstructorUsedError;

  /// Create a copy of AiInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiInsightCopyWith<AiInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiInsightCopyWith<$Res> {
  factory $AiInsightCopyWith(AiInsight value, $Res Function(AiInsight) then) =
      _$AiInsightCopyWithImpl<$Res, AiInsight>;
  @useResult
  $Res call({String text, String patternType, InsightSeverity severity});
}

/// @nodoc
class _$AiInsightCopyWithImpl<$Res, $Val extends AiInsight>
    implements $AiInsightCopyWith<$Res> {
  _$AiInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? patternType = null,
    Object? severity = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      patternType: null == patternType
          ? _value.patternType
          : patternType // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as InsightSeverity,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiInsightImplCopyWith<$Res>
    implements $AiInsightCopyWith<$Res> {
  factory _$$AiInsightImplCopyWith(
          _$AiInsightImpl value, $Res Function(_$AiInsightImpl) then) =
      __$$AiInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String patternType, InsightSeverity severity});
}

/// @nodoc
class __$$AiInsightImplCopyWithImpl<$Res>
    extends _$AiInsightCopyWithImpl<$Res, _$AiInsightImpl>
    implements _$$AiInsightImplCopyWith<$Res> {
  __$$AiInsightImplCopyWithImpl(
      _$AiInsightImpl _value, $Res Function(_$AiInsightImpl) _then)
      : super(_value, _then);

  /// Create a copy of AiInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? patternType = null,
    Object? severity = null,
  }) {
    return _then(_$AiInsightImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      patternType: null == patternType
          ? _value.patternType
          : patternType // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as InsightSeverity,
    ));
  }
}

/// @nodoc

class _$AiInsightImpl implements _AiInsight {
  const _$AiInsightImpl(
      {required this.text, required this.patternType, required this.severity});

  /// The descriptive text of the insight.
  @override
  final String text;

  /// The type of pattern identified (e.g., "Bullish Engulfing").
  @override
  final String patternType;

  /// The severity of the insight.
  @override
  final InsightSeverity severity;

  @override
  String toString() {
    return 'AiInsight(text: $text, patternType: $patternType, severity: $severity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiInsightImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.patternType, patternType) ||
                other.patternType == patternType) &&
            (identical(other.severity, severity) ||
                other.severity == severity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, patternType, severity);

  /// Create a copy of AiInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiInsightImplCopyWith<_$AiInsightImpl> get copyWith =>
      __$$AiInsightImplCopyWithImpl<_$AiInsightImpl>(this, _$identity);
}

abstract class _AiInsight implements AiInsight {
  const factory _AiInsight(
      {required final String text,
      required final String patternType,
      required final InsightSeverity severity}) = _$AiInsightImpl;

  /// The descriptive text of the insight.
  @override
  String get text;

  /// The type of pattern identified (e.g., "Bullish Engulfing").
  @override
  String get patternType;

  /// The severity of the insight.
  @override
  InsightSeverity get severity;

  /// Create a copy of AiInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiInsightImplCopyWith<_$AiInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
