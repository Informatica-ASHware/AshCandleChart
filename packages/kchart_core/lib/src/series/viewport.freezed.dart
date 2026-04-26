// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'viewport.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Viewport {
  /// Index of the first visible data point in the [Series].
  int get startIdx;

  /// Index of the last visible data point in the [Series].
  int get endIdx;

  /// Horizontal scale factor (zoom).
  double get scale;

  /// Horizontal scroll offset.
  double get scrollX;

  /// Create a copy of Viewport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ViewportCopyWith<Viewport> get copyWith =>
      _$ViewportCopyWithImpl<Viewport>(this as Viewport, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Viewport &&
            (identical(other.startIdx, startIdx) ||
                other.startIdx == startIdx) &&
            (identical(other.endIdx, endIdx) || other.endIdx == endIdx) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.scrollX, scrollX) || other.scrollX == scrollX));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, startIdx, endIdx, scale, scrollX);

  @override
  String toString() {
    return 'Viewport(startIdx: $startIdx, endIdx: $endIdx, scale: $scale, scrollX: $scrollX)';
  }
}

/// @nodoc
abstract mixin class $ViewportCopyWith<$Res> {
  factory $ViewportCopyWith(Viewport value, $Res Function(Viewport) _then) =
      _$ViewportCopyWithImpl;
  @useResult
  $Res call({int startIdx, int endIdx, double scale, double scrollX});
}

/// @nodoc
class _$ViewportCopyWithImpl<$Res> implements $ViewportCopyWith<$Res> {
  _$ViewportCopyWithImpl(this._self, this._then);

  final Viewport _self;
  final $Res Function(Viewport) _then;

  /// Create a copy of Viewport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startIdx = null,
    Object? endIdx = null,
    Object? scale = null,
    Object? scrollX = null,
  }) {
    return _then(_self.copyWith(
      startIdx: null == startIdx
          ? _self.startIdx
          : startIdx // ignore: cast_nullable_to_non_nullable
              as int,
      endIdx: null == endIdx
          ? _self.endIdx
          : endIdx // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _self.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      scrollX: null == scrollX
          ? _self.scrollX
          : scrollX // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [Viewport].
extension ViewportPatterns on Viewport {
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
    TResult Function(_Viewport value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Viewport() when $default != null:
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
    TResult Function(_Viewport value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Viewport():
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
    TResult? Function(_Viewport value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Viewport() when $default != null:
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
    TResult Function(int startIdx, int endIdx, double scale, double scrollX)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Viewport() when $default != null:
        return $default(
            _that.startIdx, _that.endIdx, _that.scale, _that.scrollX);
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
    TResult Function(int startIdx, int endIdx, double scale, double scrollX)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Viewport():
        return $default(
            _that.startIdx, _that.endIdx, _that.scale, _that.scrollX);
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
    TResult? Function(int startIdx, int endIdx, double scale, double scrollX)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Viewport() when $default != null:
        return $default(
            _that.startIdx, _that.endIdx, _that.scale, _that.scrollX);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Viewport extends Viewport {
  const _Viewport(
      {required this.startIdx,
      required this.endIdx,
      required this.scale,
      required this.scrollX})
      : super._();

  /// Index of the first visible data point in the [Series].
  @override
  final int startIdx;

  /// Index of the last visible data point in the [Series].
  @override
  final int endIdx;

  /// Horizontal scale factor (zoom).
  @override
  final double scale;

  /// Horizontal scroll offset.
  @override
  final double scrollX;

  /// Create a copy of Viewport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ViewportCopyWith<_Viewport> get copyWith =>
      __$ViewportCopyWithImpl<_Viewport>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Viewport &&
            (identical(other.startIdx, startIdx) ||
                other.startIdx == startIdx) &&
            (identical(other.endIdx, endIdx) || other.endIdx == endIdx) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.scrollX, scrollX) || other.scrollX == scrollX));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, startIdx, endIdx, scale, scrollX);

  @override
  String toString() {
    return 'Viewport(startIdx: $startIdx, endIdx: $endIdx, scale: $scale, scrollX: $scrollX)';
  }
}

/// @nodoc
abstract mixin class _$ViewportCopyWith<$Res>
    implements $ViewportCopyWith<$Res> {
  factory _$ViewportCopyWith(_Viewport value, $Res Function(_Viewport) _then) =
      __$ViewportCopyWithImpl;
  @override
  @useResult
  $Res call({int startIdx, int endIdx, double scale, double scrollX});
}

/// @nodoc
class __$ViewportCopyWithImpl<$Res> implements _$ViewportCopyWith<$Res> {
  __$ViewportCopyWithImpl(this._self, this._then);

  final _Viewport _self;
  final $Res Function(_Viewport) _then;

  /// Create a copy of Viewport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startIdx = null,
    Object? endIdx = null,
    Object? scale = null,
    Object? scrollX = null,
  }) {
    return _then(_Viewport(
      startIdx: null == startIdx
          ? _self.startIdx
          : startIdx // ignore: cast_nullable_to_non_nullable
              as int,
      endIdx: null == endIdx
          ? _self.endIdx
          : endIdx // ignore: cast_nullable_to_non_nullable
              as int,
      scale: null == scale
          ? _self.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      scrollX: null == scrollX
          ? _self.scrollX
          : scrollX // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
