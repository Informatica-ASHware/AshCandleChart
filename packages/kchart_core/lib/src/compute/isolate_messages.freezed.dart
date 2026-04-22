// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isolate_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComputeRequest {
  /// Unique identifier for the request, used for correlation and cancellation.
  String get requestId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String requestId, String method, Object? payload)
        $default, {
    required TResult Function(
            String requestId, List<IndicatorConfig> configs, Series series)
        indicatorBatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String requestId, String method, Object? payload)?
        $default, {
    TResult? Function(
            String requestId, List<IndicatorConfig> configs, Series series)?
        indicatorBatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String requestId, String method, Object? payload)?
        $default, {
    TResult Function(
            String requestId, List<IndicatorConfig> configs, Series series)?
        indicatorBatch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ComputeRequest value) $default, {
    required TResult Function(_IndicatorBatchRequest value) indicatorBatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ComputeRequest value)? $default, {
    TResult? Function(_IndicatorBatchRequest value)? indicatorBatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ComputeRequest value)? $default, {
    TResult Function(_IndicatorBatchRequest value)? indicatorBatch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ComputeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComputeRequestCopyWith<ComputeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComputeRequestCopyWith<$Res> {
  factory $ComputeRequestCopyWith(
          ComputeRequest value, $Res Function(ComputeRequest) then) =
      _$ComputeRequestCopyWithImpl<$Res, ComputeRequest>;
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class _$ComputeRequestCopyWithImpl<$Res, $Val extends ComputeRequest>
    implements $ComputeRequestCopyWith<$Res> {
  _$ComputeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComputeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComputeRequestImplCopyWith<$Res>
    implements $ComputeRequestCopyWith<$Res> {
  factory _$$ComputeRequestImplCopyWith(_$ComputeRequestImpl value,
          $Res Function(_$ComputeRequestImpl) then) =
      __$$ComputeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestId, String method, Object? payload});
}

/// @nodoc
class __$$ComputeRequestImplCopyWithImpl<$Res>
    extends _$ComputeRequestCopyWithImpl<$Res, _$ComputeRequestImpl>
    implements _$$ComputeRequestImplCopyWith<$Res> {
  __$$ComputeRequestImplCopyWithImpl(
      _$ComputeRequestImpl _value, $Res Function(_$ComputeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComputeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? method = null,
    Object? payload = freezed,
  }) {
    return _then(_$ComputeRequestImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      payload: freezed == payload ? _value.payload : payload,
    ));
  }
}

/// @nodoc

class _$ComputeRequestImpl implements _ComputeRequest {
  const _$ComputeRequestImpl(
      {required this.requestId, required this.method, required this.payload});

  /// Unique identifier for the request, used for correlation and cancellation.
  @override
  final String requestId;

  /// The method or operation to perform.
  @override
  final String method;

  /// The payload for the request.
  /// Should ideally contain [TransferableTypedData] for large data.
  @override
  final Object? payload;

  @override
  String toString() {
    return 'ComputeRequest(requestId: $requestId, method: $method, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComputeRequestImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId, method,
      const DeepCollectionEquality().hash(payload));

  /// Create a copy of ComputeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComputeRequestImplCopyWith<_$ComputeRequestImpl> get copyWith =>
      __$$ComputeRequestImplCopyWithImpl<_$ComputeRequestImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String requestId, String method, Object? payload)
        $default, {
    required TResult Function(
            String requestId, List<IndicatorConfig> configs, Series series)
        indicatorBatch,
  }) {
    return $default(requestId, method, payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String requestId, String method, Object? payload)?
        $default, {
    TResult? Function(
            String requestId, List<IndicatorConfig> configs, Series series)?
        indicatorBatch,
  }) {
    return $default?.call(requestId, method, payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String requestId, String method, Object? payload)?
        $default, {
    TResult Function(
            String requestId, List<IndicatorConfig> configs, Series series)?
        indicatorBatch,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(requestId, method, payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ComputeRequest value) $default, {
    required TResult Function(_IndicatorBatchRequest value) indicatorBatch,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ComputeRequest value)? $default, {
    TResult? Function(_IndicatorBatchRequest value)? indicatorBatch,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ComputeRequest value)? $default, {
    TResult Function(_IndicatorBatchRequest value)? indicatorBatch,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ComputeRequest implements ComputeRequest {
  const factory _ComputeRequest(
      {required final String requestId,
      required final String method,
      required final Object? payload}) = _$ComputeRequestImpl;

  /// Unique identifier for the request, used for correlation and cancellation.
  @override
  String get requestId;

  /// The method or operation to perform.
  String get method;

  /// The payload for the request.
  /// Should ideally contain [TransferableTypedData] for large data.
  Object? get payload;

  /// Create a copy of ComputeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComputeRequestImplCopyWith<_$ComputeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IndicatorBatchRequestImplCopyWith<$Res>
    implements $ComputeRequestCopyWith<$Res> {
  factory _$$IndicatorBatchRequestImplCopyWith(
          _$IndicatorBatchRequestImpl value,
          $Res Function(_$IndicatorBatchRequestImpl) then) =
      __$$IndicatorBatchRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestId, List<IndicatorConfig> configs, Series series});
}

/// @nodoc
class __$$IndicatorBatchRequestImplCopyWithImpl<$Res>
    extends _$ComputeRequestCopyWithImpl<$Res, _$IndicatorBatchRequestImpl>
    implements _$$IndicatorBatchRequestImplCopyWith<$Res> {
  __$$IndicatorBatchRequestImplCopyWithImpl(_$IndicatorBatchRequestImpl _value,
      $Res Function(_$IndicatorBatchRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComputeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? configs = null,
    Object? series = null,
  }) {
    return _then(_$IndicatorBatchRequestImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      configs: null == configs
          ? _value._configs
          : configs // ignore: cast_nullable_to_non_nullable
              as List<IndicatorConfig>,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Series,
    ));
  }
}

/// @nodoc

class _$IndicatorBatchRequestImpl implements _IndicatorBatchRequest {
  const _$IndicatorBatchRequestImpl(
      {required this.requestId,
      required final List<IndicatorConfig> configs,
      required this.series})
      : _configs = configs;

  @override
  final String requestId;
  final List<IndicatorConfig> _configs;
  @override
  List<IndicatorConfig> get configs {
    if (_configs is EqualUnmodifiableListView) return _configs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_configs);
  }

  @override
  final Series series;

  @override
  String toString() {
    return 'ComputeRequest.indicatorBatch(requestId: $requestId, configs: $configs, series: $series)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndicatorBatchRequestImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            const DeepCollectionEquality().equals(other._configs, _configs) &&
            (identical(other.series, series) || other.series == series));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId,
      const DeepCollectionEquality().hash(_configs), series);

  /// Create a copy of ComputeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IndicatorBatchRequestImplCopyWith<_$IndicatorBatchRequestImpl>
      get copyWith => __$$IndicatorBatchRequestImplCopyWithImpl<
          _$IndicatorBatchRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String requestId, String method, Object? payload)
        $default, {
    required TResult Function(
            String requestId, List<IndicatorConfig> configs, Series series)
        indicatorBatch,
  }) {
    return indicatorBatch(requestId, configs, series);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String requestId, String method, Object? payload)?
        $default, {
    TResult? Function(
            String requestId, List<IndicatorConfig> configs, Series series)?
        indicatorBatch,
  }) {
    return indicatorBatch?.call(requestId, configs, series);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String requestId, String method, Object? payload)?
        $default, {
    TResult Function(
            String requestId, List<IndicatorConfig> configs, Series series)?
        indicatorBatch,
    required TResult orElse(),
  }) {
    if (indicatorBatch != null) {
      return indicatorBatch(requestId, configs, series);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ComputeRequest value) $default, {
    required TResult Function(_IndicatorBatchRequest value) indicatorBatch,
  }) {
    return indicatorBatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ComputeRequest value)? $default, {
    TResult? Function(_IndicatorBatchRequest value)? indicatorBatch,
  }) {
    return indicatorBatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ComputeRequest value)? $default, {
    TResult Function(_IndicatorBatchRequest value)? indicatorBatch,
    required TResult orElse(),
  }) {
    if (indicatorBatch != null) {
      return indicatorBatch(this);
    }
    return orElse();
  }
}

abstract class _IndicatorBatchRequest implements ComputeRequest {
  const factory _IndicatorBatchRequest(
      {required final String requestId,
      required final List<IndicatorConfig> configs,
      required final Series series}) = _$IndicatorBatchRequestImpl;

  @override
  String get requestId;
  List<IndicatorConfig> get configs;
  Series get series;

  /// Create a copy of ComputeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IndicatorBatchRequestImplCopyWith<_$IndicatorBatchRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ComputeResponse {
  /// Unique identifier correlated with the [ComputeRequest].
  String get requestId => throw _privateConstructorUsedError;

  /// The result of the computation.
  /// Should ideally contain [TransferableTypedData] for large data.
  Object? get payload => throw _privateConstructorUsedError;

  /// Error message if the computation failed.
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ComputeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComputeResponseCopyWith<ComputeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComputeResponseCopyWith<$Res> {
  factory $ComputeResponseCopyWith(
          ComputeResponse value, $Res Function(ComputeResponse) then) =
      _$ComputeResponseCopyWithImpl<$Res, ComputeResponse>;
  @useResult
  $Res call({String requestId, Object? payload, String? error});
}

/// @nodoc
class _$ComputeResponseCopyWithImpl<$Res, $Val extends ComputeResponse>
    implements $ComputeResponseCopyWith<$Res> {
  _$ComputeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComputeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? payload = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      payload: freezed == payload ? _value.payload : payload,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComputeResponseImplCopyWith<$Res>
    implements $ComputeResponseCopyWith<$Res> {
  factory _$$ComputeResponseImplCopyWith(_$ComputeResponseImpl value,
          $Res Function(_$ComputeResponseImpl) then) =
      __$$ComputeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestId, Object? payload, String? error});
}

/// @nodoc
class __$$ComputeResponseImplCopyWithImpl<$Res>
    extends _$ComputeResponseCopyWithImpl<$Res, _$ComputeResponseImpl>
    implements _$$ComputeResponseImplCopyWith<$Res> {
  __$$ComputeResponseImplCopyWithImpl(
      _$ComputeResponseImpl _value, $Res Function(_$ComputeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComputeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
    Object? payload = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ComputeResponseImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      payload: freezed == payload ? _value.payload : payload,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ComputeResponseImpl implements _ComputeResponse {
  const _$ComputeResponseImpl(
      {required this.requestId, this.payload, this.error});

  /// Unique identifier correlated with the [ComputeRequest].
  @override
  final String requestId;

  /// The result of the computation.
  /// Should ideally contain [TransferableTypedData] for large data.
  @override
  final Object? payload;

  /// Error message if the computation failed.
  @override
  final String? error;

  @override
  String toString() {
    return 'ComputeResponse(requestId: $requestId, payload: $payload, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComputeResponseImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            const DeepCollectionEquality().equals(other.payload, payload) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId,
      const DeepCollectionEquality().hash(payload), error);

  /// Create a copy of ComputeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComputeResponseImplCopyWith<_$ComputeResponseImpl> get copyWith =>
      __$$ComputeResponseImplCopyWithImpl<_$ComputeResponseImpl>(
          this, _$identity);
}

abstract class _ComputeResponse implements ComputeResponse {
  const factory _ComputeResponse(
      {required final String requestId,
      final Object? payload,
      final String? error}) = _$ComputeResponseImpl;

  /// Unique identifier correlated with the [ComputeRequest].
  @override
  String get requestId;

  /// The result of the computation.
  /// Should ideally contain [TransferableTypedData] for large data.
  @override
  Object? get payload;

  /// Error message if the computation failed.
  @override
  String? get error;

  /// Create a copy of ComputeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComputeResponseImplCopyWith<_$ComputeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ControlMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() exit,
    required TResult Function(String requestId) cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? exit,
    TResult? Function(String requestId)? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? exit,
    TResult Function(String requestId)? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exit value) exit,
    required TResult Function(_Cancel value) cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Exit value)? exit,
    TResult? Function(_Cancel value)? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exit value)? exit,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControlMessageCopyWith<$Res> {
  factory $ControlMessageCopyWith(
          ControlMessage value, $Res Function(ControlMessage) then) =
      _$ControlMessageCopyWithImpl<$Res, ControlMessage>;
}

/// @nodoc
class _$ControlMessageCopyWithImpl<$Res, $Val extends ControlMessage>
    implements $ControlMessageCopyWith<$Res> {
  _$ControlMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ControlMessage
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ExitImplCopyWith<$Res> {
  factory _$$ExitImplCopyWith(
          _$ExitImpl value, $Res Function(_$ExitImpl) then) =
      __$$ExitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExitImplCopyWithImpl<$Res>
    extends _$ControlMessageCopyWithImpl<$Res, _$ExitImpl>
    implements _$$ExitImplCopyWith<$Res> {
  __$$ExitImplCopyWithImpl(_$ExitImpl _value, $Res Function(_$ExitImpl) _then)
      : super(_value, _then);

  /// Create a copy of ControlMessage
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ExitImpl implements _Exit {
  const _$ExitImpl();

  @override
  String toString() {
    return 'ControlMessage.exit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() exit,
    required TResult Function(String requestId) cancel,
  }) {
    return exit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? exit,
    TResult? Function(String requestId)? cancel,
  }) {
    return exit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? exit,
    TResult Function(String requestId)? cancel,
    required TResult orElse(),
  }) {
    if (exit != null) {
      return exit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exit value) exit,
    required TResult Function(_Cancel value) cancel,
  }) {
    return exit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Exit value)? exit,
    TResult? Function(_Cancel value)? cancel,
  }) {
    return exit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exit value)? exit,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) {
    if (exit != null) {
      return exit(this);
    }
    return orElse();
  }
}

abstract class _Exit implements ControlMessage {
  const factory _Exit() = _$ExitImpl;
}

/// @nodoc
abstract class _$$CancelImplCopyWith<$Res> {
  factory _$$CancelImplCopyWith(
          _$CancelImpl value, $Res Function(_$CancelImpl) then) =
      __$$CancelImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class __$$CancelImplCopyWithImpl<$Res>
    extends _$ControlMessageCopyWithImpl<$Res, _$CancelImpl>
    implements _$$CancelImplCopyWith<$Res> {
  __$$CancelImplCopyWithImpl(
      _$CancelImpl _value, $Res Function(_$CancelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ControlMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$CancelImpl(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelImpl implements _Cancel {
  const _$CancelImpl({required this.requestId});

  @override
  final String requestId;

  @override
  String toString() {
    return 'ControlMessage.cancel(requestId: $requestId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelImpl &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  /// Create a copy of ControlMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelImplCopyWith<_$CancelImpl> get copyWith =>
      __$$CancelImplCopyWithImpl<_$CancelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() exit,
    required TResult Function(String requestId) cancel,
  }) {
    return cancel(requestId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? exit,
    TResult? Function(String requestId)? cancel,
  }) {
    return cancel?.call(requestId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? exit,
    TResult Function(String requestId)? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(requestId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Exit value) exit,
    required TResult Function(_Cancel value) cancel,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Exit value)? exit,
    TResult? Function(_Cancel value)? cancel,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Exit value)? exit,
    TResult Function(_Cancel value)? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class _Cancel implements ControlMessage {
  const factory _Cancel({required final String requestId}) = _$CancelImpl;

  String get requestId;

  /// Create a copy of ControlMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelImplCopyWith<_$CancelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
