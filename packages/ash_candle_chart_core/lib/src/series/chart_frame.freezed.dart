// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_frame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChartFrame {
  /// The main price [Series].
  Series get series;

  /// Map of indicator names to their respective [Series].
  Map<String, Series> get indicators;

  /// The current [Viewport] state.
  Viewport get viewport;

  /// The collection of annotations (drawings) in the chart.
  AnnotationDocument get annotations;

  /// The collection of trade-related overlays.
  TradeOverlayDocument get tradeOverlays;

  /// List of overlays (e.g., drawings, alerts, etc.) to be rendered.
  List<dynamic> get overlays;

  /// Optional volume profile data.
  VolumeProfile? get volumeProfile;

  /// Optional order book data.
  OrderBook? get orderBook;

  /// Optional list of liquidation areas for heatmap.
  List<LiquidationArea> get liquidations;

  /// Sequential number to track frame updates and ensure consistent state.
  int get sequenceNumber;

  /// Granular sequence numbers per panel to optimize repaints.
  /// Key can be 'main', 'volume', or indicator IDs.
  Map<String, int> get panelSequenceNumbers;

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChartFrameCopyWith<ChartFrame> get copyWith =>
      _$ChartFrameCopyWithImpl<ChartFrame>(this as ChartFrame, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChartFrame &&
            (identical(other.series, series) || other.series == series) &&
            const DeepCollectionEquality()
                .equals(other.indicators, indicators) &&
            (identical(other.viewport, viewport) ||
                other.viewport == viewport) &&
            (identical(other.annotations, annotations) ||
                other.annotations == annotations) &&
            (identical(other.tradeOverlays, tradeOverlays) ||
                other.tradeOverlays == tradeOverlays) &&
            const DeepCollectionEquality().equals(other.overlays, overlays) &&
            (identical(other.volumeProfile, volumeProfile) ||
                other.volumeProfile == volumeProfile) &&
            (identical(other.orderBook, orderBook) ||
                other.orderBook == orderBook) &&
            const DeepCollectionEquality()
                .equals(other.liquidations, liquidations) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                other.sequenceNumber == sequenceNumber) &&
            const DeepCollectionEquality()
                .equals(other.panelSequenceNumbers, panelSequenceNumbers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      series,
      const DeepCollectionEquality().hash(indicators),
      viewport,
      annotations,
      tradeOverlays,
      const DeepCollectionEquality().hash(overlays),
      volumeProfile,
      orderBook,
      const DeepCollectionEquality().hash(liquidations),
      sequenceNumber,
      const DeepCollectionEquality().hash(panelSequenceNumbers));

  @override
  String toString() {
    return 'ChartFrame(series: $series, indicators: $indicators, viewport: $viewport, annotations: $annotations, tradeOverlays: $tradeOverlays, overlays: $overlays, volumeProfile: $volumeProfile, orderBook: $orderBook, liquidations: $liquidations, sequenceNumber: $sequenceNumber, panelSequenceNumbers: $panelSequenceNumbers)';
  }
}

/// @nodoc
abstract mixin class $ChartFrameCopyWith<$Res> {
  factory $ChartFrameCopyWith(
          ChartFrame value, $Res Function(ChartFrame) _then) =
      _$ChartFrameCopyWithImpl;
  @useResult
  $Res call(
      {Series series,
      Map<String, Series> indicators,
      Viewport viewport,
      AnnotationDocument annotations,
      TradeOverlayDocument tradeOverlays,
      List<dynamic> overlays,
      VolumeProfile? volumeProfile,
      OrderBook? orderBook,
      List<LiquidationArea> liquidations,
      int sequenceNumber,
      Map<String, int> panelSequenceNumbers});

  $ViewportCopyWith<$Res> get viewport;
  $AnnotationDocumentCopyWith<$Res> get annotations;
  $TradeOverlayDocumentCopyWith<$Res> get tradeOverlays;
  $VolumeProfileCopyWith<$Res>? get volumeProfile;
  $OrderBookCopyWith<$Res>? get orderBook;
}

/// @nodoc
class _$ChartFrameCopyWithImpl<$Res> implements $ChartFrameCopyWith<$Res> {
  _$ChartFrameCopyWithImpl(this._self, this._then);

  final ChartFrame _self;
  final $Res Function(ChartFrame) _then;

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? series = null,
    Object? indicators = null,
    Object? viewport = null,
    Object? annotations = null,
    Object? tradeOverlays = null,
    Object? overlays = null,
    Object? volumeProfile = freezed,
    Object? orderBook = freezed,
    Object? liquidations = null,
    Object? sequenceNumber = null,
    Object? panelSequenceNumbers = null,
  }) {
    return _then(_self.copyWith(
      series: null == series
          ? _self.series
          : series // ignore: cast_nullable_to_non_nullable
              as Series,
      indicators: null == indicators
          ? _self.indicators
          : indicators // ignore: cast_nullable_to_non_nullable
              as Map<String, Series>,
      viewport: null == viewport
          ? _self.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as Viewport,
      annotations: null == annotations
          ? _self.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as AnnotationDocument,
      tradeOverlays: null == tradeOverlays
          ? _self.tradeOverlays
          : tradeOverlays // ignore: cast_nullable_to_non_nullable
              as TradeOverlayDocument,
      overlays: null == overlays
          ? _self.overlays
          : overlays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      volumeProfile: freezed == volumeProfile
          ? _self.volumeProfile
          : volumeProfile // ignore: cast_nullable_to_non_nullable
              as VolumeProfile?,
      orderBook: freezed == orderBook
          ? _self.orderBook
          : orderBook // ignore: cast_nullable_to_non_nullable
              as OrderBook?,
      liquidations: null == liquidations
          ? _self.liquidations
          : liquidations // ignore: cast_nullable_to_non_nullable
              as List<LiquidationArea>,
      sequenceNumber: null == sequenceNumber
          ? _self.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      panelSequenceNumbers: null == panelSequenceNumbers
          ? _self.panelSequenceNumbers
          : panelSequenceNumbers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViewportCopyWith<$Res> get viewport {
    return $ViewportCopyWith<$Res>(_self.viewport, (value) {
      return _then(_self.copyWith(viewport: value));
    });
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnnotationDocumentCopyWith<$Res> get annotations {
    return $AnnotationDocumentCopyWith<$Res>(_self.annotations, (value) {
      return _then(_self.copyWith(annotations: value));
    });
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TradeOverlayDocumentCopyWith<$Res> get tradeOverlays {
    return $TradeOverlayDocumentCopyWith<$Res>(_self.tradeOverlays, (value) {
      return _then(_self.copyWith(tradeOverlays: value));
    });
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VolumeProfileCopyWith<$Res>? get volumeProfile {
    if (_self.volumeProfile == null) {
      return null;
    }

    return $VolumeProfileCopyWith<$Res>(_self.volumeProfile!, (value) {
      return _then(_self.copyWith(volumeProfile: value));
    });
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderBookCopyWith<$Res>? get orderBook {
    if (_self.orderBook == null) {
      return null;
    }

    return $OrderBookCopyWith<$Res>(_self.orderBook!, (value) {
      return _then(_self.copyWith(orderBook: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ChartFrame].
extension ChartFramePatterns on ChartFrame {
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
    TResult Function(_ChartFrame value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChartFrame() when $default != null:
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
    TResult Function(_ChartFrame value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartFrame():
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
    TResult? Function(_ChartFrame value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartFrame() when $default != null:
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
    TResult Function(
            Series series,
            Map<String, Series> indicators,
            Viewport viewport,
            AnnotationDocument annotations,
            TradeOverlayDocument tradeOverlays,
            List<dynamic> overlays,
            VolumeProfile? volumeProfile,
            OrderBook? orderBook,
            List<LiquidationArea> liquidations,
            int sequenceNumber,
            Map<String, int> panelSequenceNumbers)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChartFrame() when $default != null:
        return $default(
            _that.series,
            _that.indicators,
            _that.viewport,
            _that.annotations,
            _that.tradeOverlays,
            _that.overlays,
            _that.volumeProfile,
            _that.orderBook,
            _that.liquidations,
            _that.sequenceNumber,
            _that.panelSequenceNumbers);
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
    TResult Function(
            Series series,
            Map<String, Series> indicators,
            Viewport viewport,
            AnnotationDocument annotations,
            TradeOverlayDocument tradeOverlays,
            List<dynamic> overlays,
            VolumeProfile? volumeProfile,
            OrderBook? orderBook,
            List<LiquidationArea> liquidations,
            int sequenceNumber,
            Map<String, int> panelSequenceNumbers)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartFrame():
        return $default(
            _that.series,
            _that.indicators,
            _that.viewport,
            _that.annotations,
            _that.tradeOverlays,
            _that.overlays,
            _that.volumeProfile,
            _that.orderBook,
            _that.liquidations,
            _that.sequenceNumber,
            _that.panelSequenceNumbers);
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
    TResult? Function(
            Series series,
            Map<String, Series> indicators,
            Viewport viewport,
            AnnotationDocument annotations,
            TradeOverlayDocument tradeOverlays,
            List<dynamic> overlays,
            VolumeProfile? volumeProfile,
            OrderBook? orderBook,
            List<LiquidationArea> liquidations,
            int sequenceNumber,
            Map<String, int> panelSequenceNumbers)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartFrame() when $default != null:
        return $default(
            _that.series,
            _that.indicators,
            _that.viewport,
            _that.annotations,
            _that.tradeOverlays,
            _that.overlays,
            _that.volumeProfile,
            _that.orderBook,
            _that.liquidations,
            _that.sequenceNumber,
            _that.panelSequenceNumbers);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChartFrame extends ChartFrame {
  const _ChartFrame(
      {required this.series,
      required final Map<String, Series> indicators,
      required this.viewport,
      this.annotations = const AnnotationDocument(),
      this.tradeOverlays = const TradeOverlayDocument(),
      required final List<dynamic> overlays,
      this.volumeProfile,
      this.orderBook,
      final List<LiquidationArea> liquidations = const [],
      required this.sequenceNumber,
      required final Map<String, int> panelSequenceNumbers})
      : _indicators = indicators,
        _overlays = overlays,
        _liquidations = liquidations,
        _panelSequenceNumbers = panelSequenceNumbers,
        super._();

  /// The main price [Series].
  @override
  final Series series;

  /// Map of indicator names to their respective [Series].
  final Map<String, Series> _indicators;

  /// Map of indicator names to their respective [Series].
  @override
  Map<String, Series> get indicators {
    if (_indicators is EqualUnmodifiableMapView) return _indicators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_indicators);
  }

  /// The current [Viewport] state.
  @override
  final Viewport viewport;

  /// The collection of annotations (drawings) in the chart.
  @override
  @JsonKey()
  final AnnotationDocument annotations;

  /// The collection of trade-related overlays.
  @override
  @JsonKey()
  final TradeOverlayDocument tradeOverlays;

  /// List of overlays (e.g., drawings, alerts, etc.) to be rendered.
  final List<dynamic> _overlays;

  /// List of overlays (e.g., drawings, alerts, etc.) to be rendered.
  @override
  List<dynamic> get overlays {
    if (_overlays is EqualUnmodifiableListView) return _overlays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_overlays);
  }

  /// Optional volume profile data.
  @override
  final VolumeProfile? volumeProfile;

  /// Optional order book data.
  @override
  final OrderBook? orderBook;

  /// Optional list of liquidation areas for heatmap.
  final List<LiquidationArea> _liquidations;

  /// Optional list of liquidation areas for heatmap.
  @override
  @JsonKey()
  List<LiquidationArea> get liquidations {
    if (_liquidations is EqualUnmodifiableListView) return _liquidations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_liquidations);
  }

  /// Sequential number to track frame updates and ensure consistent state.
  @override
  final int sequenceNumber;

  /// Granular sequence numbers per panel to optimize repaints.
  /// Key can be 'main', 'volume', or indicator IDs.
  final Map<String, int> _panelSequenceNumbers;

  /// Granular sequence numbers per panel to optimize repaints.
  /// Key can be 'main', 'volume', or indicator IDs.
  @override
  Map<String, int> get panelSequenceNumbers {
    if (_panelSequenceNumbers is EqualUnmodifiableMapView)
      return _panelSequenceNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_panelSequenceNumbers);
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChartFrameCopyWith<_ChartFrame> get copyWith =>
      __$ChartFrameCopyWithImpl<_ChartFrame>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChartFrame &&
            (identical(other.series, series) || other.series == series) &&
            const DeepCollectionEquality()
                .equals(other._indicators, _indicators) &&
            (identical(other.viewport, viewport) ||
                other.viewport == viewport) &&
            (identical(other.annotations, annotations) ||
                other.annotations == annotations) &&
            (identical(other.tradeOverlays, tradeOverlays) ||
                other.tradeOverlays == tradeOverlays) &&
            const DeepCollectionEquality().equals(other._overlays, _overlays) &&
            (identical(other.volumeProfile, volumeProfile) ||
                other.volumeProfile == volumeProfile) &&
            (identical(other.orderBook, orderBook) ||
                other.orderBook == orderBook) &&
            const DeepCollectionEquality()
                .equals(other._liquidations, _liquidations) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                other.sequenceNumber == sequenceNumber) &&
            const DeepCollectionEquality()
                .equals(other._panelSequenceNumbers, _panelSequenceNumbers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      series,
      const DeepCollectionEquality().hash(_indicators),
      viewport,
      annotations,
      tradeOverlays,
      const DeepCollectionEquality().hash(_overlays),
      volumeProfile,
      orderBook,
      const DeepCollectionEquality().hash(_liquidations),
      sequenceNumber,
      const DeepCollectionEquality().hash(_panelSequenceNumbers));

  @override
  String toString() {
    return 'ChartFrame(series: $series, indicators: $indicators, viewport: $viewport, annotations: $annotations, tradeOverlays: $tradeOverlays, overlays: $overlays, volumeProfile: $volumeProfile, orderBook: $orderBook, liquidations: $liquidations, sequenceNumber: $sequenceNumber, panelSequenceNumbers: $panelSequenceNumbers)';
  }
}

/// @nodoc
abstract mixin class _$ChartFrameCopyWith<$Res>
    implements $ChartFrameCopyWith<$Res> {
  factory _$ChartFrameCopyWith(
          _ChartFrame value, $Res Function(_ChartFrame) _then) =
      __$ChartFrameCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Series series,
      Map<String, Series> indicators,
      Viewport viewport,
      AnnotationDocument annotations,
      TradeOverlayDocument tradeOverlays,
      List<dynamic> overlays,
      VolumeProfile? volumeProfile,
      OrderBook? orderBook,
      List<LiquidationArea> liquidations,
      int sequenceNumber,
      Map<String, int> panelSequenceNumbers});

  @override
  $ViewportCopyWith<$Res> get viewport;
  @override
  $AnnotationDocumentCopyWith<$Res> get annotations;
  @override
  $TradeOverlayDocumentCopyWith<$Res> get tradeOverlays;
  @override
  $VolumeProfileCopyWith<$Res>? get volumeProfile;
  @override
  $OrderBookCopyWith<$Res>? get orderBook;
}

/// @nodoc
class __$ChartFrameCopyWithImpl<$Res> implements _$ChartFrameCopyWith<$Res> {
  __$ChartFrameCopyWithImpl(this._self, this._then);

  final _ChartFrame _self;
  final $Res Function(_ChartFrame) _then;

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? series = null,
    Object? indicators = null,
    Object? viewport = null,
    Object? annotations = null,
    Object? tradeOverlays = null,
    Object? overlays = null,
    Object? volumeProfile = freezed,
    Object? orderBook = freezed,
    Object? liquidations = null,
    Object? sequenceNumber = null,
    Object? panelSequenceNumbers = null,
  }) {
    return _then(_ChartFrame(
      series: null == series
          ? _self.series
          : series // ignore: cast_nullable_to_non_nullable
              as Series,
      indicators: null == indicators
          ? _self._indicators
          : indicators // ignore: cast_nullable_to_non_nullable
              as Map<String, Series>,
      viewport: null == viewport
          ? _self.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as Viewport,
      annotations: null == annotations
          ? _self.annotations
          : annotations // ignore: cast_nullable_to_non_nullable
              as AnnotationDocument,
      tradeOverlays: null == tradeOverlays
          ? _self.tradeOverlays
          : tradeOverlays // ignore: cast_nullable_to_non_nullable
              as TradeOverlayDocument,
      overlays: null == overlays
          ? _self._overlays
          : overlays // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      volumeProfile: freezed == volumeProfile
          ? _self.volumeProfile
          : volumeProfile // ignore: cast_nullable_to_non_nullable
              as VolumeProfile?,
      orderBook: freezed == orderBook
          ? _self.orderBook
          : orderBook // ignore: cast_nullable_to_non_nullable
              as OrderBook?,
      liquidations: null == liquidations
          ? _self._liquidations
          : liquidations // ignore: cast_nullable_to_non_nullable
              as List<LiquidationArea>,
      sequenceNumber: null == sequenceNumber
          ? _self.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      panelSequenceNumbers: null == panelSequenceNumbers
          ? _self._panelSequenceNumbers
          : panelSequenceNumbers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViewportCopyWith<$Res> get viewport {
    return $ViewportCopyWith<$Res>(_self.viewport, (value) {
      return _then(_self.copyWith(viewport: value));
    });
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnnotationDocumentCopyWith<$Res> get annotations {
    return $AnnotationDocumentCopyWith<$Res>(_self.annotations, (value) {
      return _then(_self.copyWith(annotations: value));
    });
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TradeOverlayDocumentCopyWith<$Res> get tradeOverlays {
    return $TradeOverlayDocumentCopyWith<$Res>(_self.tradeOverlays, (value) {
      return _then(_self.copyWith(tradeOverlays: value));
    });
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VolumeProfileCopyWith<$Res>? get volumeProfile {
    if (_self.volumeProfile == null) {
      return null;
    }

    return $VolumeProfileCopyWith<$Res>(_self.volumeProfile!, (value) {
      return _then(_self.copyWith(volumeProfile: value));
    });
  }

  /// Create a copy of ChartFrame
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderBookCopyWith<$Res>? get orderBook {
    if (_self.orderBook == null) {
      return null;
    }

    return $OrderBookCopyWith<$Res>(_self.orderBook!, (value) {
      return _then(_self.copyWith(orderBook: value));
    });
  }
}

// dart format on
