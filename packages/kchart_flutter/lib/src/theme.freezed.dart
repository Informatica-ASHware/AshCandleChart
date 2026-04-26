// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChartTheme {
  /// Color for the grid lines.
  Color get gridColor;

  /// Color for bullish candles (close >= open).
  Color get bullColor;

  /// Color for bearish candles (close < open).
  Color get bearColor;

  /// Color for the crosshair lines.
  Color get crosshairColor;

  /// Text style for labels on the axes.
  TextStyle get axisTextStyle;

  /// Text style for crosshair labels.
  TextStyle get crosshairTextStyle;

  /// Color for trade overlay lines (e.g., entry price).
  Color get tradeLineColor;

  /// Color for the chart background.
  Color get backgroundColor;

  /// Width of the Y-axis (price scale) on the right.
  double get yAxisWidth;

  /// Color for Volume Profile buy bars.
  Color get vpBuyColor;

  /// Color for Volume Profile sell bars.
  Color get vpSellColor;

  /// Color for the Point of Control line in Volume Profile.
  Color get vpPocColor;

  /// Color for Order Book bids.
  Color get bidColor;

  /// Color for Order Book asks.
  Color get askColor;

  /// Primary color for Liquidation Heatmap.
  Color get liquidationColor;

  /// Create a copy of ChartTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChartThemeCopyWith<ChartTheme> get copyWith =>
      _$ChartThemeCopyWithImpl<ChartTheme>(this as ChartTheme, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChartTheme &&
            (identical(other.gridColor, gridColor) ||
                other.gridColor == gridColor) &&
            (identical(other.bullColor, bullColor) ||
                other.bullColor == bullColor) &&
            (identical(other.bearColor, bearColor) ||
                other.bearColor == bearColor) &&
            (identical(other.crosshairColor, crosshairColor) ||
                other.crosshairColor == crosshairColor) &&
            (identical(other.axisTextStyle, axisTextStyle) ||
                other.axisTextStyle == axisTextStyle) &&
            (identical(other.crosshairTextStyle, crosshairTextStyle) ||
                other.crosshairTextStyle == crosshairTextStyle) &&
            (identical(other.tradeLineColor, tradeLineColor) ||
                other.tradeLineColor == tradeLineColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.yAxisWidth, yAxisWidth) ||
                other.yAxisWidth == yAxisWidth) &&
            (identical(other.vpBuyColor, vpBuyColor) ||
                other.vpBuyColor == vpBuyColor) &&
            (identical(other.vpSellColor, vpSellColor) ||
                other.vpSellColor == vpSellColor) &&
            (identical(other.vpPocColor, vpPocColor) ||
                other.vpPocColor == vpPocColor) &&
            (identical(other.bidColor, bidColor) ||
                other.bidColor == bidColor) &&
            (identical(other.askColor, askColor) ||
                other.askColor == askColor) &&
            (identical(other.liquidationColor, liquidationColor) ||
                other.liquidationColor == liquidationColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      gridColor,
      bullColor,
      bearColor,
      crosshairColor,
      axisTextStyle,
      crosshairTextStyle,
      tradeLineColor,
      backgroundColor,
      yAxisWidth,
      vpBuyColor,
      vpSellColor,
      vpPocColor,
      bidColor,
      askColor,
      liquidationColor);

  @override
  String toString() {
    return 'ChartTheme(gridColor: $gridColor, bullColor: $bullColor, bearColor: $bearColor, crosshairColor: $crosshairColor, axisTextStyle: $axisTextStyle, crosshairTextStyle: $crosshairTextStyle, tradeLineColor: $tradeLineColor, backgroundColor: $backgroundColor, yAxisWidth: $yAxisWidth, vpBuyColor: $vpBuyColor, vpSellColor: $vpSellColor, vpPocColor: $vpPocColor, bidColor: $bidColor, askColor: $askColor, liquidationColor: $liquidationColor)';
  }
}

/// @nodoc
abstract mixin class $ChartThemeCopyWith<$Res> {
  factory $ChartThemeCopyWith(
          ChartTheme value, $Res Function(ChartTheme) _then) =
      _$ChartThemeCopyWithImpl;
  @useResult
  $Res call(
      {Color gridColor,
      Color bullColor,
      Color bearColor,
      Color crosshairColor,
      TextStyle axisTextStyle,
      TextStyle crosshairTextStyle,
      Color tradeLineColor,
      Color backgroundColor,
      double yAxisWidth,
      Color vpBuyColor,
      Color vpSellColor,
      Color vpPocColor,
      Color bidColor,
      Color askColor,
      Color liquidationColor});
}

/// @nodoc
class _$ChartThemeCopyWithImpl<$Res> implements $ChartThemeCopyWith<$Res> {
  _$ChartThemeCopyWithImpl(this._self, this._then);

  final ChartTheme _self;
  final $Res Function(ChartTheme) _then;

  /// Create a copy of ChartTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gridColor = null,
    Object? bullColor = null,
    Object? bearColor = null,
    Object? crosshairColor = null,
    Object? axisTextStyle = null,
    Object? crosshairTextStyle = null,
    Object? tradeLineColor = null,
    Object? backgroundColor = null,
    Object? yAxisWidth = null,
    Object? vpBuyColor = null,
    Object? vpSellColor = null,
    Object? vpPocColor = null,
    Object? bidColor = null,
    Object? askColor = null,
    Object? liquidationColor = null,
  }) {
    return _then(_self.copyWith(
      gridColor: null == gridColor
          ? _self.gridColor
          : gridColor // ignore: cast_nullable_to_non_nullable
              as Color,
      bullColor: null == bullColor
          ? _self.bullColor
          : bullColor // ignore: cast_nullable_to_non_nullable
              as Color,
      bearColor: null == bearColor
          ? _self.bearColor
          : bearColor // ignore: cast_nullable_to_non_nullable
              as Color,
      crosshairColor: null == crosshairColor
          ? _self.crosshairColor
          : crosshairColor // ignore: cast_nullable_to_non_nullable
              as Color,
      axisTextStyle: null == axisTextStyle
          ? _self.axisTextStyle
          : axisTextStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      crosshairTextStyle: null == crosshairTextStyle
          ? _self.crosshairTextStyle
          : crosshairTextStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      tradeLineColor: null == tradeLineColor
          ? _self.tradeLineColor
          : tradeLineColor // ignore: cast_nullable_to_non_nullable
              as Color,
      backgroundColor: null == backgroundColor
          ? _self.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      yAxisWidth: null == yAxisWidth
          ? _self.yAxisWidth
          : yAxisWidth // ignore: cast_nullable_to_non_nullable
              as double,
      vpBuyColor: null == vpBuyColor
          ? _self.vpBuyColor
          : vpBuyColor // ignore: cast_nullable_to_non_nullable
              as Color,
      vpSellColor: null == vpSellColor
          ? _self.vpSellColor
          : vpSellColor // ignore: cast_nullable_to_non_nullable
              as Color,
      vpPocColor: null == vpPocColor
          ? _self.vpPocColor
          : vpPocColor // ignore: cast_nullable_to_non_nullable
              as Color,
      bidColor: null == bidColor
          ? _self.bidColor
          : bidColor // ignore: cast_nullable_to_non_nullable
              as Color,
      askColor: null == askColor
          ? _self.askColor
          : askColor // ignore: cast_nullable_to_non_nullable
              as Color,
      liquidationColor: null == liquidationColor
          ? _self.liquidationColor
          : liquidationColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChartTheme].
extension ChartThemePatterns on ChartTheme {
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
    TResult Function(_ChartTheme value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChartTheme() when $default != null:
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
    TResult Function(_ChartTheme value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartTheme():
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
    TResult? Function(_ChartTheme value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartTheme() when $default != null:
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
            Color gridColor,
            Color bullColor,
            Color bearColor,
            Color crosshairColor,
            TextStyle axisTextStyle,
            TextStyle crosshairTextStyle,
            Color tradeLineColor,
            Color backgroundColor,
            double yAxisWidth,
            Color vpBuyColor,
            Color vpSellColor,
            Color vpPocColor,
            Color bidColor,
            Color askColor,
            Color liquidationColor)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChartTheme() when $default != null:
        return $default(
            _that.gridColor,
            _that.bullColor,
            _that.bearColor,
            _that.crosshairColor,
            _that.axisTextStyle,
            _that.crosshairTextStyle,
            _that.tradeLineColor,
            _that.backgroundColor,
            _that.yAxisWidth,
            _that.vpBuyColor,
            _that.vpSellColor,
            _that.vpPocColor,
            _that.bidColor,
            _that.askColor,
            _that.liquidationColor);
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
            Color gridColor,
            Color bullColor,
            Color bearColor,
            Color crosshairColor,
            TextStyle axisTextStyle,
            TextStyle crosshairTextStyle,
            Color tradeLineColor,
            Color backgroundColor,
            double yAxisWidth,
            Color vpBuyColor,
            Color vpSellColor,
            Color vpPocColor,
            Color bidColor,
            Color askColor,
            Color liquidationColor)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartTheme():
        return $default(
            _that.gridColor,
            _that.bullColor,
            _that.bearColor,
            _that.crosshairColor,
            _that.axisTextStyle,
            _that.crosshairTextStyle,
            _that.tradeLineColor,
            _that.backgroundColor,
            _that.yAxisWidth,
            _that.vpBuyColor,
            _that.vpSellColor,
            _that.vpPocColor,
            _that.bidColor,
            _that.askColor,
            _that.liquidationColor);
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
            Color gridColor,
            Color bullColor,
            Color bearColor,
            Color crosshairColor,
            TextStyle axisTextStyle,
            TextStyle crosshairTextStyle,
            Color tradeLineColor,
            Color backgroundColor,
            double yAxisWidth,
            Color vpBuyColor,
            Color vpSellColor,
            Color vpPocColor,
            Color bidColor,
            Color askColor,
            Color liquidationColor)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChartTheme() when $default != null:
        return $default(
            _that.gridColor,
            _that.bullColor,
            _that.bearColor,
            _that.crosshairColor,
            _that.axisTextStyle,
            _that.crosshairTextStyle,
            _that.tradeLineColor,
            _that.backgroundColor,
            _that.yAxisWidth,
            _that.vpBuyColor,
            _that.vpSellColor,
            _that.vpPocColor,
            _that.bidColor,
            _that.askColor,
            _that.liquidationColor);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChartTheme implements ChartTheme {
  const _ChartTheme(
      {required this.gridColor,
      required this.bullColor,
      required this.bearColor,
      required this.crosshairColor,
      required this.axisTextStyle,
      required this.crosshairTextStyle,
      required this.tradeLineColor,
      required this.backgroundColor,
      this.yAxisWidth = 60.0,
      required this.vpBuyColor,
      required this.vpSellColor,
      required this.vpPocColor,
      required this.bidColor,
      required this.askColor,
      required this.liquidationColor});

  /// Color for the grid lines.
  @override
  final Color gridColor;

  /// Color for bullish candles (close >= open).
  @override
  final Color bullColor;

  /// Color for bearish candles (close < open).
  @override
  final Color bearColor;

  /// Color for the crosshair lines.
  @override
  final Color crosshairColor;

  /// Text style for labels on the axes.
  @override
  final TextStyle axisTextStyle;

  /// Text style for crosshair labels.
  @override
  final TextStyle crosshairTextStyle;

  /// Color for trade overlay lines (e.g., entry price).
  @override
  final Color tradeLineColor;

  /// Color for the chart background.
  @override
  final Color backgroundColor;

  /// Width of the Y-axis (price scale) on the right.
  @override
  @JsonKey()
  final double yAxisWidth;

  /// Color for Volume Profile buy bars.
  @override
  final Color vpBuyColor;

  /// Color for Volume Profile sell bars.
  @override
  final Color vpSellColor;

  /// Color for the Point of Control line in Volume Profile.
  @override
  final Color vpPocColor;

  /// Color for Order Book bids.
  @override
  final Color bidColor;

  /// Color for Order Book asks.
  @override
  final Color askColor;

  /// Primary color for Liquidation Heatmap.
  @override
  final Color liquidationColor;

  /// Create a copy of ChartTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChartThemeCopyWith<_ChartTheme> get copyWith =>
      __$ChartThemeCopyWithImpl<_ChartTheme>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChartTheme &&
            (identical(other.gridColor, gridColor) ||
                other.gridColor == gridColor) &&
            (identical(other.bullColor, bullColor) ||
                other.bullColor == bullColor) &&
            (identical(other.bearColor, bearColor) ||
                other.bearColor == bearColor) &&
            (identical(other.crosshairColor, crosshairColor) ||
                other.crosshairColor == crosshairColor) &&
            (identical(other.axisTextStyle, axisTextStyle) ||
                other.axisTextStyle == axisTextStyle) &&
            (identical(other.crosshairTextStyle, crosshairTextStyle) ||
                other.crosshairTextStyle == crosshairTextStyle) &&
            (identical(other.tradeLineColor, tradeLineColor) ||
                other.tradeLineColor == tradeLineColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.yAxisWidth, yAxisWidth) ||
                other.yAxisWidth == yAxisWidth) &&
            (identical(other.vpBuyColor, vpBuyColor) ||
                other.vpBuyColor == vpBuyColor) &&
            (identical(other.vpSellColor, vpSellColor) ||
                other.vpSellColor == vpSellColor) &&
            (identical(other.vpPocColor, vpPocColor) ||
                other.vpPocColor == vpPocColor) &&
            (identical(other.bidColor, bidColor) ||
                other.bidColor == bidColor) &&
            (identical(other.askColor, askColor) ||
                other.askColor == askColor) &&
            (identical(other.liquidationColor, liquidationColor) ||
                other.liquidationColor == liquidationColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      gridColor,
      bullColor,
      bearColor,
      crosshairColor,
      axisTextStyle,
      crosshairTextStyle,
      tradeLineColor,
      backgroundColor,
      yAxisWidth,
      vpBuyColor,
      vpSellColor,
      vpPocColor,
      bidColor,
      askColor,
      liquidationColor);

  @override
  String toString() {
    return 'ChartTheme(gridColor: $gridColor, bullColor: $bullColor, bearColor: $bearColor, crosshairColor: $crosshairColor, axisTextStyle: $axisTextStyle, crosshairTextStyle: $crosshairTextStyle, tradeLineColor: $tradeLineColor, backgroundColor: $backgroundColor, yAxisWidth: $yAxisWidth, vpBuyColor: $vpBuyColor, vpSellColor: $vpSellColor, vpPocColor: $vpPocColor, bidColor: $bidColor, askColor: $askColor, liquidationColor: $liquidationColor)';
  }
}

/// @nodoc
abstract mixin class _$ChartThemeCopyWith<$Res>
    implements $ChartThemeCopyWith<$Res> {
  factory _$ChartThemeCopyWith(
          _ChartTheme value, $Res Function(_ChartTheme) _then) =
      __$ChartThemeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Color gridColor,
      Color bullColor,
      Color bearColor,
      Color crosshairColor,
      TextStyle axisTextStyle,
      TextStyle crosshairTextStyle,
      Color tradeLineColor,
      Color backgroundColor,
      double yAxisWidth,
      Color vpBuyColor,
      Color vpSellColor,
      Color vpPocColor,
      Color bidColor,
      Color askColor,
      Color liquidationColor});
}

/// @nodoc
class __$ChartThemeCopyWithImpl<$Res> implements _$ChartThemeCopyWith<$Res> {
  __$ChartThemeCopyWithImpl(this._self, this._then);

  final _ChartTheme _self;
  final $Res Function(_ChartTheme) _then;

  /// Create a copy of ChartTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gridColor = null,
    Object? bullColor = null,
    Object? bearColor = null,
    Object? crosshairColor = null,
    Object? axisTextStyle = null,
    Object? crosshairTextStyle = null,
    Object? tradeLineColor = null,
    Object? backgroundColor = null,
    Object? yAxisWidth = null,
    Object? vpBuyColor = null,
    Object? vpSellColor = null,
    Object? vpPocColor = null,
    Object? bidColor = null,
    Object? askColor = null,
    Object? liquidationColor = null,
  }) {
    return _then(_ChartTheme(
      gridColor: null == gridColor
          ? _self.gridColor
          : gridColor // ignore: cast_nullable_to_non_nullable
              as Color,
      bullColor: null == bullColor
          ? _self.bullColor
          : bullColor // ignore: cast_nullable_to_non_nullable
              as Color,
      bearColor: null == bearColor
          ? _self.bearColor
          : bearColor // ignore: cast_nullable_to_non_nullable
              as Color,
      crosshairColor: null == crosshairColor
          ? _self.crosshairColor
          : crosshairColor // ignore: cast_nullable_to_non_nullable
              as Color,
      axisTextStyle: null == axisTextStyle
          ? _self.axisTextStyle
          : axisTextStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      crosshairTextStyle: null == crosshairTextStyle
          ? _self.crosshairTextStyle
          : crosshairTextStyle // ignore: cast_nullable_to_non_nullable
              as TextStyle,
      tradeLineColor: null == tradeLineColor
          ? _self.tradeLineColor
          : tradeLineColor // ignore: cast_nullable_to_non_nullable
              as Color,
      backgroundColor: null == backgroundColor
          ? _self.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      yAxisWidth: null == yAxisWidth
          ? _self.yAxisWidth
          : yAxisWidth // ignore: cast_nullable_to_non_nullable
              as double,
      vpBuyColor: null == vpBuyColor
          ? _self.vpBuyColor
          : vpBuyColor // ignore: cast_nullable_to_non_nullable
              as Color,
      vpSellColor: null == vpSellColor
          ? _self.vpSellColor
          : vpSellColor // ignore: cast_nullable_to_non_nullable
              as Color,
      vpPocColor: null == vpPocColor
          ? _self.vpPocColor
          : vpPocColor // ignore: cast_nullable_to_non_nullable
              as Color,
      bidColor: null == bidColor
          ? _self.bidColor
          : bidColor // ignore: cast_nullable_to_non_nullable
              as Color,
      askColor: null == askColor
          ? _self.askColor
          : askColor // ignore: cast_nullable_to_non_nullable
              as Color,
      liquidationColor: null == liquidationColor
          ? _self.liquidationColor
          : liquidationColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

// dart format on
