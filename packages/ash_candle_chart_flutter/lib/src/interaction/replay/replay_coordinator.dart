import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:ash_candle_chart_core/ash_candle_chart_core.dart';

/// States for the replay mode.
enum ReplayState {
  /// Replay is currently playing.
  playing,

  /// Replay is paused.
  paused,

  /// User is scrubbing through the history.
  scrubbing,
}

/// Coordinates the historical replay of chart data.
///
/// It intercepts an input [Stream<ChartFrame>] and exposes a truncated
/// version based on the current replay position (the "fake now").
class ReplayCoordinator extends ChangeNotifier {
  final Stream<ChartFrame> _inputStream;
  StreamSubscription<ChartFrame>? _subscription;

  ChartFrame? _fullFrame;
  ChartFrame? _truncatedFrame;
  int? _currentTimestamp;
  ReplayState _state = ReplayState.paused;
  double _speed = 1.0;
  Timer? _playbackTimer;

  /// Creates a [ReplayCoordinator].
  ReplayCoordinator({required Stream<ChartFrame> inputStream})
      : _inputStream = inputStream {
    _subscription = _inputStream.listen(_handleNewFrame);
  }

  /// The current replay state.
  ReplayState get state => _state;

  /// The current playback speed.
  double get speed => _speed;

  /// The current "fake now" timestamp.
  int? get currentTimestamp => _currentTimestamp;

  /// The latest truncated [ChartFrame].
  ChartFrame? get truncatedFrame => _truncatedFrame;

  /// The original full [ChartFrame].
  ChartFrame? get fullFrame => _fullFrame;

  void _handleNewFrame(ChartFrame frame) {
    _fullFrame = frame;
    if (_currentTimestamp == null && frame.series.length > 0) {
      _currentTimestamp = frame.series.timestamps.last;
    }
    _updateTruncatedFrame();
  }

  void _updateTruncatedFrame() {
    final full = _fullFrame;
    if (full == null || _currentTimestamp == null) return;

    final int index = _findTimestampIndex(_currentTimestamp!);

    // Truncate main series
    final truncatedSeries = Series(
      timestamps: full.series.timestamps.sublist(0, index + 1),
      open: full.series.open.sublist(0, index + 1),
      high: full.series.high.sublist(0, index + 1),
      low: full.series.low.sublist(0, index + 1),
      close: full.series.close.sublist(0, index + 1),
      volume: full.series.volume.sublist(0, index + 1),
    );

    // Truncate indicators
    final truncatedIndicators = <String, Series>{};
    full.indicators.forEach((id, series) {
      // Find the last index in the indicator series that is <= currentTimestamp
      int indicatorIndex =
          _findTimestampIndexForSeries(series, _currentTimestamp!);

      // If the series is empty or currentTimestamp is before the first element,
      // it should be an empty series.
      if (indicatorIndex < 0 ||
          series.timestamps[indicatorIndex] > _currentTimestamp!) {
        truncatedIndicators[id] = Series(
          timestamps: Int64List(0),
          open: Float64List(0),
          high: Float64List(0),
          low: Float64List(0),
          close: Float64List(0),
          volume: Float64List(0),
        );
      } else {
        truncatedIndicators[id] = Series(
          timestamps: series.timestamps.sublist(0, indicatorIndex + 1),
          open: series.open.sublist(0, indicatorIndex + 1),
          high: series.high.sublist(0, indicatorIndex + 1),
          low: series.low.sublist(0, indicatorIndex + 1),
          close: series.close.sublist(0, indicatorIndex + 1),
          volume: series.volume.sublist(0, indicatorIndex + 1),
        );
      }
    });

    // Truncate annotations
    final truncatedAnnotations = full.annotations.copyWith(
      annotations: full.annotations.annotations.where((a) {
        if (a is TrendLine) {
          return a.start.timestamp <= _currentTimestamp! &&
              a.end.timestamp <= _currentTimestamp!;
        }
        return true;
      }).toList(),
    );

    // Truncate trade overlays
    final truncatedTradeOverlays = full.tradeOverlays.copyWith(
      overlays: full.tradeOverlays.overlays.where((o) {
        if (o is TradeMarker) {
          return o.point.timestamp <= _currentTimestamp!;
        }
        if (o is PositionOverlay) {
          // PositionOverlay currently doesn't have a timestamp,
          // we'll assume it should be hidden in replay for now
          // unless we add an entryTimestamp to it.
          // US specification says: "Los overlays de dominio (trades) futuros no se renderizan en el modo replay."
          // Since we don't have entry time for position, we hide it to be safe.
          return false;
        }
        return true;
      }).toList(),
    );

    _truncatedFrame = full.copyWith(
      series: truncatedSeries,
      indicators: truncatedIndicators,
      annotations: truncatedAnnotations,
      tradeOverlays: truncatedTradeOverlays,
      sequenceNumber: full.sequenceNumber + 1,
    );

    notifyListeners();
  }

  /// Starts playback.
  void play() {
    if (_state == ReplayState.playing) return;
    _state = ReplayState.playing;
    _startTimer();
    notifyListeners();
  }

  /// Pauses playback.
  void pause() {
    _state = ReplayState.paused;
    _playbackTimer?.cancel();
    notifyListeners();
  }

  /// Sets the playback speed.
  void setSpeed(double speed) {
    _speed = speed;
    if (_state == ReplayState.playing) {
      _startTimer();
    }
    notifyListeners();
  }

  /// Scrubs to a specific timestamp.
  void scrub(int timestamp) {
    _state = ReplayState.scrubbing;
    _currentTimestamp = timestamp;
    _updateTruncatedFrame();
  }

  void _startTimer() {
    _playbackTimer?.cancel();
    // In a real implementation, we would move candle by candle or tick by tick.
    // For now, let's assume one candle per 'second / speed'.
    _playbackTimer = Timer.periodic(
      Duration(milliseconds: (1000 / _speed).round()),
      (timer) {
        _stepForward();
      },
    );
  }

  void _stepForward() {
    final full = _fullFrame;
    if (full == null || _currentTimestamp == null) return;

    final timestamps = full.series.timestamps;
    int currentIndex = _findTimestampIndex(_currentTimestamp!);

    if (currentIndex < timestamps.length - 1) {
      _currentTimestamp = timestamps[currentIndex + 1];
      _updateTruncatedFrame();
    } else {
      pause();
    }
  }

  int _findTimestampIndex(int timestamp) {
    final timestamps = _fullFrame?.series.timestamps;
    if (timestamps == null) return -1;
    return _findLastIndexLeq(timestamps, timestamp);
  }

  int _findTimestampIndexForSeries(Series series, int timestamp) {
    return _findLastIndexLeq(series.timestamps, timestamp);
  }

  /// Finds the last index whose value is <= [timestamp].
  int _findLastIndexLeq(Int64List timestamps, int timestamp) {
    if (timestamps.isEmpty) return -1;
    int low = 0;
    int high = timestamps.length - 1;
    int result = -1;

    while (low <= high) {
      int mid = low + ((high - low) >> 1);
      if (timestamps[mid] <= timestamp) {
        result = mid;
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }
    return result;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _playbackTimer?.cancel();
    super.dispose();
  }
}
