// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isolate_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComputeRequest {

/// Unique identifier for the request, used for correlation and cancellation.
 String get requestId;
/// Create a copy of ComputeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComputeRequestCopyWith<ComputeRequest> get copyWith => _$ComputeRequestCopyWithImpl<ComputeRequest>(this as ComputeRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComputeRequest&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'ComputeRequest(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class $ComputeRequestCopyWith<$Res>  {
  factory $ComputeRequestCopyWith(ComputeRequest value, $Res Function(ComputeRequest) _then) = _$ComputeRequestCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class _$ComputeRequestCopyWithImpl<$Res>
    implements $ComputeRequestCopyWith<$Res> {
  _$ComputeRequestCopyWithImpl(this._self, this._then);

  final ComputeRequest _self;
  final $Res Function(ComputeRequest) _then;

/// Create a copy of ComputeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ComputeRequest].
extension ComputeRequestPatterns on ComputeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComputeRequest value)?  $default,{TResult Function( _IndicatorBatchRequest value)?  indicatorBatch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComputeRequest() when $default != null:
return $default(_that);case _IndicatorBatchRequest() when indicatorBatch != null:
return indicatorBatch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComputeRequest value)  $default,{required TResult Function( _IndicatorBatchRequest value)  indicatorBatch,}){
final _that = this;
switch (_that) {
case _ComputeRequest():
return $default(_that);case _IndicatorBatchRequest():
return indicatorBatch(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComputeRequest value)?  $default,{TResult? Function( _IndicatorBatchRequest value)?  indicatorBatch,}){
final _that = this;
switch (_that) {
case _ComputeRequest() when $default != null:
return $default(_that);case _IndicatorBatchRequest() when indicatorBatch != null:
return indicatorBatch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  String method,  Object? payload)?  $default,{TResult Function( String requestId,  List<IndicatorConfig> configs,  Series series)?  indicatorBatch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComputeRequest() when $default != null:
return $default(_that.requestId,_that.method,_that.payload);case _IndicatorBatchRequest() when indicatorBatch != null:
return indicatorBatch(_that.requestId,_that.configs,_that.series);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  String method,  Object? payload)  $default,{required TResult Function( String requestId,  List<IndicatorConfig> configs,  Series series)  indicatorBatch,}) {final _that = this;
switch (_that) {
case _ComputeRequest():
return $default(_that.requestId,_that.method,_that.payload);case _IndicatorBatchRequest():
return indicatorBatch(_that.requestId,_that.configs,_that.series);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  String method,  Object? payload)?  $default,{TResult? Function( String requestId,  List<IndicatorConfig> configs,  Series series)?  indicatorBatch,}) {final _that = this;
switch (_that) {
case _ComputeRequest() when $default != null:
return $default(_that.requestId,_that.method,_that.payload);case _IndicatorBatchRequest() when indicatorBatch != null:
return indicatorBatch(_that.requestId,_that.configs,_that.series);case _:
  return null;

}
}

}

/// @nodoc


class _ComputeRequest implements ComputeRequest {
  const _ComputeRequest({required this.requestId, required this.method, required this.payload});
  

/// Unique identifier for the request, used for correlation and cancellation.
@override final  String requestId;
/// The method or operation to perform.
 final  String method;
/// The payload for the request.
/// Should ideally contain [TransferableTypedData] for large data.
 final  Object? payload;

/// Create a copy of ComputeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComputeRequestCopyWith<_ComputeRequest> get copyWith => __$ComputeRequestCopyWithImpl<_ComputeRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComputeRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other.payload, payload));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,method,const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'ComputeRequest(requestId: $requestId, method: $method, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ComputeRequestCopyWith<$Res> implements $ComputeRequestCopyWith<$Res> {
  factory _$ComputeRequestCopyWith(_ComputeRequest value, $Res Function(_ComputeRequest) _then) = __$ComputeRequestCopyWithImpl;
@override @useResult
$Res call({
 String requestId, String method, Object? payload
});




}
/// @nodoc
class __$ComputeRequestCopyWithImpl<$Res>
    implements _$ComputeRequestCopyWith<$Res> {
  __$ComputeRequestCopyWithImpl(this._self, this._then);

  final _ComputeRequest _self;
  final $Res Function(_ComputeRequest) _then;

/// Create a copy of ComputeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? method = null,Object? payload = freezed,}) {
  return _then(_ComputeRequest(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,payload: freezed == payload ? _self.payload : payload ,
  ));
}


}

/// @nodoc


class _IndicatorBatchRequest implements ComputeRequest {
  const _IndicatorBatchRequest({required this.requestId, required final  List<IndicatorConfig> configs, required this.series}): _configs = configs;
  

@override final  String requestId;
 final  List<IndicatorConfig> _configs;
 List<IndicatorConfig> get configs {
  if (_configs is EqualUnmodifiableListView) return _configs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_configs);
}

 final  Series series;

/// Create a copy of ComputeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndicatorBatchRequestCopyWith<_IndicatorBatchRequest> get copyWith => __$IndicatorBatchRequestCopyWithImpl<_IndicatorBatchRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndicatorBatchRequest&&(identical(other.requestId, requestId) || other.requestId == requestId)&&const DeepCollectionEquality().equals(other._configs, _configs)&&(identical(other.series, series) || other.series == series));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,const DeepCollectionEquality().hash(_configs),series);

@override
String toString() {
  return 'ComputeRequest.indicatorBatch(requestId: $requestId, configs: $configs, series: $series)';
}


}

/// @nodoc
abstract mixin class _$IndicatorBatchRequestCopyWith<$Res> implements $ComputeRequestCopyWith<$Res> {
  factory _$IndicatorBatchRequestCopyWith(_IndicatorBatchRequest value, $Res Function(_IndicatorBatchRequest) _then) = __$IndicatorBatchRequestCopyWithImpl;
@override @useResult
$Res call({
 String requestId, List<IndicatorConfig> configs, Series series
});




}
/// @nodoc
class __$IndicatorBatchRequestCopyWithImpl<$Res>
    implements _$IndicatorBatchRequestCopyWith<$Res> {
  __$IndicatorBatchRequestCopyWithImpl(this._self, this._then);

  final _IndicatorBatchRequest _self;
  final $Res Function(_IndicatorBatchRequest) _then;

/// Create a copy of ComputeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? configs = null,Object? series = null,}) {
  return _then(_IndicatorBatchRequest(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,configs: null == configs ? _self._configs : configs // ignore: cast_nullable_to_non_nullable
as List<IndicatorConfig>,series: null == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as Series,
  ));
}


}

/// @nodoc
mixin _$ComputeResponse {

/// Unique identifier correlated with the [ComputeRequest].
 String get requestId;/// The result of the computation.
/// Should ideally contain [TransferableTypedData] for large data.
 Object? get payload;/// Error message if the computation failed.
 String? get error;
/// Create a copy of ComputeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComputeResponseCopyWith<ComputeResponse> get copyWith => _$ComputeResponseCopyWithImpl<ComputeResponse>(this as ComputeResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComputeResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&const DeepCollectionEquality().equals(other.payload, payload)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,const DeepCollectionEquality().hash(payload),error);

@override
String toString() {
  return 'ComputeResponse(requestId: $requestId, payload: $payload, error: $error)';
}


}

/// @nodoc
abstract mixin class $ComputeResponseCopyWith<$Res>  {
  factory $ComputeResponseCopyWith(ComputeResponse value, $Res Function(ComputeResponse) _then) = _$ComputeResponseCopyWithImpl;
@useResult
$Res call({
 String requestId, Object? payload, String? error
});




}
/// @nodoc
class _$ComputeResponseCopyWithImpl<$Res>
    implements $ComputeResponseCopyWith<$Res> {
  _$ComputeResponseCopyWithImpl(this._self, this._then);

  final ComputeResponse _self;
  final $Res Function(ComputeResponse) _then;

/// Create a copy of ComputeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? payload = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,payload: freezed == payload ? _self.payload : payload ,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ComputeResponse].
extension ComputeResponsePatterns on ComputeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComputeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComputeResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComputeResponse value)  $default,){
final _that = this;
switch (_that) {
case _ComputeResponse():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComputeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ComputeResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requestId,  Object? payload,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComputeResponse() when $default != null:
return $default(_that.requestId,_that.payload,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requestId,  Object? payload,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ComputeResponse():
return $default(_that.requestId,_that.payload,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requestId,  Object? payload,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ComputeResponse() when $default != null:
return $default(_that.requestId,_that.payload,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ComputeResponse implements ComputeResponse {
  const _ComputeResponse({required this.requestId, this.payload, this.error});
  

/// Unique identifier correlated with the [ComputeRequest].
@override final  String requestId;
/// The result of the computation.
/// Should ideally contain [TransferableTypedData] for large data.
@override final  Object? payload;
/// Error message if the computation failed.
@override final  String? error;

/// Create a copy of ComputeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComputeResponseCopyWith<_ComputeResponse> get copyWith => __$ComputeResponseCopyWithImpl<_ComputeResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComputeResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&const DeepCollectionEquality().equals(other.payload, payload)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,requestId,const DeepCollectionEquality().hash(payload),error);

@override
String toString() {
  return 'ComputeResponse(requestId: $requestId, payload: $payload, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ComputeResponseCopyWith<$Res> implements $ComputeResponseCopyWith<$Res> {
  factory _$ComputeResponseCopyWith(_ComputeResponse value, $Res Function(_ComputeResponse) _then) = __$ComputeResponseCopyWithImpl;
@override @useResult
$Res call({
 String requestId, Object? payload, String? error
});




}
/// @nodoc
class __$ComputeResponseCopyWithImpl<$Res>
    implements _$ComputeResponseCopyWith<$Res> {
  __$ComputeResponseCopyWithImpl(this._self, this._then);

  final _ComputeResponse _self;
  final $Res Function(_ComputeResponse) _then;

/// Create a copy of ComputeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? payload = freezed,Object? error = freezed,}) {
  return _then(_ComputeResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,payload: freezed == payload ? _self.payload : payload ,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ControlMessage {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ControlMessage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ControlMessage()';
}


}

/// @nodoc
class $ControlMessageCopyWith<$Res>  {
$ControlMessageCopyWith(ControlMessage _, $Res Function(ControlMessage) __);
}


/// Adds pattern-matching-related methods to [ControlMessage].
extension ControlMessagePatterns on ControlMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Exit value)?  exit,TResult Function( _Cancel value)?  cancel,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Exit() when exit != null:
return exit(_that);case _Cancel() when cancel != null:
return cancel(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Exit value)  exit,required TResult Function( _Cancel value)  cancel,}){
final _that = this;
switch (_that) {
case _Exit():
return exit(_that);case _Cancel():
return cancel(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Exit value)?  exit,TResult? Function( _Cancel value)?  cancel,}){
final _that = this;
switch (_that) {
case _Exit() when exit != null:
return exit(_that);case _Cancel() when cancel != null:
return cancel(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  exit,TResult Function( String requestId)?  cancel,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Exit() when exit != null:
return exit();case _Cancel() when cancel != null:
return cancel(_that.requestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  exit,required TResult Function( String requestId)  cancel,}) {final _that = this;
switch (_that) {
case _Exit():
return exit();case _Cancel():
return cancel(_that.requestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  exit,TResult? Function( String requestId)?  cancel,}) {final _that = this;
switch (_that) {
case _Exit() when exit != null:
return exit();case _Cancel() when cancel != null:
return cancel(_that.requestId);case _:
  return null;

}
}

}

/// @nodoc


class _Exit implements ControlMessage {
  const _Exit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Exit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ControlMessage.exit()';
}


}




/// @nodoc


class _Cancel implements ControlMessage {
  const _Cancel({required this.requestId});
  

 final  String requestId;

/// Create a copy of ControlMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelCopyWith<_Cancel> get copyWith => __$CancelCopyWithImpl<_Cancel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cancel&&(identical(other.requestId, requestId) || other.requestId == requestId));
}


@override
int get hashCode => Object.hash(runtimeType,requestId);

@override
String toString() {
  return 'ControlMessage.cancel(requestId: $requestId)';
}


}

/// @nodoc
abstract mixin class _$CancelCopyWith<$Res> implements $ControlMessageCopyWith<$Res> {
  factory _$CancelCopyWith(_Cancel value, $Res Function(_Cancel) _then) = __$CancelCopyWithImpl;
@useResult
$Res call({
 String requestId
});




}
/// @nodoc
class __$CancelCopyWithImpl<$Res>
    implements _$CancelCopyWith<$Res> {
  __$CancelCopyWithImpl(this._self, this._then);

  final _Cancel _self;
  final $Res Function(_Cancel) _then;

/// Create a copy of ControlMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requestId = null,}) {
  return _then(_Cancel(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
