import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter/rendering.dart';
import 'package:kchart_core/kchart_core.dart';
import 'accessibility/chart_semantics_builder.dart';
import 'i18n/number_formatters.dart';
import 'panels/ai/ai_models.dart';
import 'panels/ai/ai_provider.dart';
import 'interaction/replay/replay_coordinator.dart';
import 'crosshair_coordinator.dart';
import 'panels/chart_panel.dart';
import 'panels/main_panel.dart';
import 'panels/volume_panel.dart';
import 'panels/secondary_panel.dart';
import 'panels/advanced/volume_profile_panel.dart';
import 'panels/advanced/depth_panel.dart';
import 'panels/advanced/liquidation_heatmap_panel.dart';
import 'utils/export/export_config.dart';
import 'utils/export/image_exporter.dart';

/// Controller for the KChart widget.
///
/// Manages the [ChartFrame] and notifies listeners of changes.
class KChartController extends ChangeNotifier {
  ChartFrame _frame;

  /// Provider for AI-based insights.
  AiAnnotationProvider? aiProvider;

  /// Range of timestamps currently selected on the chart.
  (int, int)? _selectionRange;

  /// Tracks the ID of the current selection request to avoid race conditions.
  int _currentSelectionRequestId = 0;

  /// Debounce timer for selection updates.
  Timer? _selectionDebounceTimer;

  /// The current selection range of timestamps.
  (int, int)? get selectionRange => _selectionRange;

  /// Notifier for insights generated for the current selection.
  final ValueNotifier<List<AiInsight>> insights = ValueNotifier([]);

  /// Notifier for the loading state of insights.
  final ValueNotifier<bool> isInsightsLoading = ValueNotifier(false);

  /// The last measured size of the chart widget.
  Size? lastViewSize;

  /// Global key to access the [RenderRepaintBoundary] for exporting images.
  final GlobalKey exportKey = GlobalKey();

  /// Exports the current chart view to a PNG image.
  ///
  /// Returns a [Uint8List] containing the PNG data.
  Future<Uint8List> exportToImage({ExportConfig? config}) async {
    final boundary =
        exportKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      throw Exception(
          'Could not find RenderRepaintBoundary. Is the KChart widget mounted?');
    }
    return ImageExporter.export(boundary, config ?? const ExportConfig());
  }

  /// Coordinator for the synchronized crosshair.
  final CrosshairCoordinator crosshair = CrosshairCoordinator();

  /// Optional coordinator for replay mode.
  ReplayCoordinator? _replayCoordinator;

  /// The current replay coordinator, if any.
  ReplayCoordinator? get replayCoordinator => _replayCoordinator;

  /// Enables or disables replay mode.
  set replayCoordinator(ReplayCoordinator? coordinator) {
    if (_replayCoordinator == coordinator) return;
    _replayCoordinator?.removeListener(_onReplayUpdate);
    _replayCoordinator = coordinator;
    _replayCoordinator?.addListener(_onReplayUpdate);
    _onReplayUpdate();
  }

  void _onReplayUpdate() {
    final truncated = _replayCoordinator?.truncatedFrame;
    if (truncated != null) {
      frame = truncated;
    }
  }

  /// Sets the current selection range and fetches insights if a provider is set.
  ///
  /// This method includes debouncing and race condition protection.
  void setSelection(int startTimestamp, int endTimestamp) {
    if (startTimestamp > endTimestamp) {
      final temp = startTimestamp;
      startTimestamp = endTimestamp;
      endTimestamp = temp;
    }

    if (_selectionRange?.$1 == startTimestamp &&
        _selectionRange?.$2 == endTimestamp) {
      return;
    }

    _selectionRange = (startTimestamp, endTimestamp);
    notifyListeners();

    final provider = aiProvider;
    if (provider == null) return;

    _selectionDebounceTimer?.cancel();
    _selectionDebounceTimer =
        Timer(const Duration(milliseconds: 300), () async {
      final requestId = ++_currentSelectionRequestId;
      isInsightsLoading.value = true;

      try {
        final startIdx = _findTimestampIndex(startTimestamp, nearest: true);
        final endIdx = _findTimestampIndex(endTimestamp, nearest: true);

        // Ensure at least one element if startIdx == endIdx
        final sliceEnd = (endIdx + 1).clamp(0, _frame.series.length);
        if (startIdx < sliceEnd) {
          final data = _frame.series.slice(startIdx, sliceEnd);
          final result = await provider.getInsights(data);

          if (requestId == _currentSelectionRequestId) {
            insights.value = result;
          }
        } else {
          if (requestId == _currentSelectionRequestId) {
            insights.value = [];
          }
        }
      } catch (e) {
        if (requestId == _currentSelectionRequestId) {
          insights.value = [];
        }
      } finally {
        if (requestId == _currentSelectionRequestId) {
          isInsightsLoading.value = false;
        }
      }
    });
  }

  /// Clears the current selection and its insights.
  void clearSelection() {
    if (_selectionRange == null) return;
    _selectionRange = null;
    insights.value = [];
    isInsightsLoading.value = false;
    notifyListeners();
  }

  /// Flexible factors for panel heights.
  List<double> _panelFlexFactors = [3.0, 1.0];

  /// Creates a [KChartController] with an initial [ChartFrame].
  KChartController({required ChartFrame frame}) : _frame = frame {
    _ensureFlexFactors();
  }

  /// The current [ChartFrame].
  ChartFrame get frame => _frame;

  /// Updates the current [ChartFrame] and notifies listeners.
  set frame(ChartFrame newFrame) {
    if (_frame == newFrame) return;
    _frame = newFrame;
    _ensureFlexFactors();
    notifyListeners();
  }

  /// Whether magnet mode (snapping) is enabled.
  bool magnetMode = true;

  /// Enabled institutional panels.
  final Set<String> enabledInstitutionalPanels = {};

  /// Toggles an institutional panel.
  void toggleInstitutionalPanel(String id) {
    if (enabledInstitutionalPanels.contains(id)) {
      enabledInstitutionalPanels.remove(id);
    } else {
      enabledInstitutionalPanels.add(id);
    }
    _ensureFlexFactors();
    notifyListeners();
  }

  /// Adds or updates an annotation.
  void setAnnotation(Annotation annotation) {
    final annotations = List<Annotation>.from(_frame.annotations.annotations);
    final index = annotations.indexWhere((a) => a.id == annotation.id);
    if (index != -1) {
      annotations[index] = annotation;
    } else {
      annotations.add(annotation);
    }

    final newPanelSeqs = Map<String, int>.from(_frame.panelSequenceNumbers);
    newPanelSeqs['main'] = (newPanelSeqs['main'] ?? 0) + 1;

    frame = _frame.copyWith(
      annotations: _frame.annotations.copyWith(annotations: annotations),
      panelSequenceNumbers: newPanelSeqs,
      sequenceNumber: _frame.sequenceNumber + 1,
    );
  }

  /// Adds or updates a trade overlay.
  void setTradeOverlay(TradeOverlay overlay) {
    final overlays = List<TradeOverlay>.from(_frame.tradeOverlays.overlays);
    final index = overlays.indexWhere((o) => o.id == overlay.id);
    if (index != -1) {
      overlays[index] = overlay;
    } else {
      overlays.add(overlay);
    }

    final newPanelSeqs = Map<String, int>.from(_frame.panelSequenceNumbers);
    newPanelSeqs['main'] = (newPanelSeqs['main'] ?? 0) + 1;

    frame = _frame.copyWith(
      tradeOverlays: _frame.tradeOverlays.copyWith(overlays: overlays),
      panelSequenceNumbers: newPanelSeqs,
      sequenceNumber: _frame.sequenceNumber + 1,
    );
  }

  /// Removes a trade overlay by ID.
  void removeTradeOverlay(String id) {
    final overlays = List<TradeOverlay>.from(_frame.tradeOverlays.overlays);
    overlays.removeWhere((o) => o.id == id);

    final newPanelSeqs = Map<String, int>.from(_frame.panelSequenceNumbers);
    newPanelSeqs['main'] = (newPanelSeqs['main'] ?? 0) + 1;

    frame = _frame.copyWith(
      tradeOverlays: _frame.tradeOverlays.copyWith(overlays: overlays),
      panelSequenceNumbers: newPanelSeqs,
      sequenceNumber: _frame.sequenceNumber + 1,
    );
  }

  /// Removes an annotation by ID.
  void removeAnnotation(String id) {
    final annotations = List<Annotation>.from(_frame.annotations.annotations);
    annotations.removeWhere((a) => a.id == id);

    final newPanelSeqs = Map<String, int>.from(_frame.panelSequenceNumbers);
    newPanelSeqs['main'] = (newPanelSeqs['main'] ?? 0) + 1;

    frame = _frame.copyWith(
      annotations: _frame.annotations.copyWith(annotations: annotations),
      panelSequenceNumbers: newPanelSeqs,
      sequenceNumber: _frame.sequenceNumber + 1,
    );
  }

  /// Converts a local pixel position to an [AnnotationPoint].
  ///
  /// If [magnetMode] is enabled, it snaps to the nearest OHLC value.
  AnnotationPoint pixelToPoint(Offset localOffset, Size size) {
    final series = _frame.series;
    final viewport = _frame.viewport;

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);
    final int visibleCount = endIdx - startIdx + 1;
    final double candleWidth = size.width / visibleCount;

    // 1. Calculate approximate index and price from pixels
    final double relativeIdx = localOffset.dx / candleWidth;
    final int index = (startIdx + relativeIdx.floor()).clamp(
      0,
      series.length - 1,
    );
    final int timestamp = series.timestamps[index];

    // Need price range for Y calculation
    double minPrice = double.infinity;
    double maxPrice = double.negativeInfinity;
    for (int i = startIdx; i <= endIdx; i++) {
      if (series.low[i] < minPrice) minPrice = series.low[i];
      if (series.high[i] > maxPrice) maxPrice = series.high[i];
    }
    if (minPrice == maxPrice) {
      minPrice -= 1.0;
      maxPrice += 1.0;
    }
    final double priceRange = maxPrice - minPrice;
    final double price = maxPrice - (localOffset.dy / size.height * priceRange);

    if (magnetMode) {
      return series.findNearestPoint(timestamp, price);
    } else {
      return AnnotationPoint(timestamp: timestamp, price: price);
    }
  }

  void _ensureFlexFactors() {
    final panelCount = 2 +
        enabledInstitutionalPanels.length +
        _frame.indicators.keys.where((k) => k != 'volume').length;
    if (_panelFlexFactors.length < panelCount) {
      final additionalNeeded = panelCount - _panelFlexFactors.length;
      _panelFlexFactors.addAll(List.generate(additionalNeeded, (_) => 1.0));
    } else if (_panelFlexFactors.length > panelCount) {
      _panelFlexFactors = _panelFlexFactors.sublist(0, panelCount);
    }
  }

  /// Pans the viewport by the given delta in pixels.
  void pan(double deltaX, double viewWidth) {
    if (viewWidth <= 0) return;
    final viewport = _frame.viewport;
    final int visibleCount = viewport.endIdx - viewport.startIdx + 1;
    if (visibleCount <= 0) return;

    final double candleWidth = viewWidth / visibleCount;
    double newScrollX = viewport.scrollX + deltaX;
    int indexDelta = (newScrollX / candleWidth).truncate();

    if (indexDelta != 0) {
      int newStartIdx = viewport.startIdx - indexDelta;
      int newEndIdx = viewport.endIdx - indexDelta;

      final maxIdx = _frame.series.length - 1;
      if (newStartIdx < 0) {
        newEndIdx -= newStartIdx;
        newStartIdx = 0;
      }
      if (newEndIdx > maxIdx) {
        newStartIdx -= (newEndIdx - maxIdx);
        newEndIdx = maxIdx;
      }
      newStartIdx = newStartIdx.clamp(0, maxIdx);
      newEndIdx = newEndIdx.clamp(0, maxIdx);

      newScrollX -= indexDelta * candleWidth;

      updateViewport(
        viewport.copyWith(
          startIdx: newStartIdx,
          endIdx: newEndIdx,
          scrollX: newScrollX,
        ),
      );
    } else {
      updateViewport(viewport.copyWith(scrollX: newScrollX));
    }
  }

  /// Zooms the viewport by the given scale factor around a focal point.
  void zoom(double scaleFactor, double focalPointX, double viewWidth) {
    if (viewWidth <= 0 || scaleFactor == 1.0) return;
    final viewport = _frame.viewport;
    final int visibleCount = viewport.endIdx - viewport.startIdx + 1;
    if (visibleCount <= 0) return;

    int newVisibleCount = (visibleCount / scaleFactor).round();
    if (newVisibleCount == visibleCount) {
      if (scaleFactor > 1.0) {
        newVisibleCount--;
      } else {
        newVisibleCount++;
      }
    }

    newVisibleCount = newVisibleCount.clamp(5, _frame.series.length);
    if (newVisibleCount == visibleCount) return;

    final double candleWidth = viewWidth / visibleCount;
    final double focalIdx = viewport.startIdx + (focalPointX / candleWidth);
    final double relativePos = focalPointX / viewWidth;

    int newStartIdx = (focalIdx - relativePos * newVisibleCount).round();
    int newEndIdx = newStartIdx + newVisibleCount - 1;

    final maxIdx = _frame.series.length - 1;
    if (newStartIdx < 0) {
      newEndIdx -= newStartIdx;
      newStartIdx = 0;
    }
    if (newEndIdx > maxIdx) {
      newStartIdx -= (newEndIdx - maxIdx);
      newEndIdx = maxIdx;
    }
    newStartIdx = newStartIdx.clamp(0, maxIdx);
    newEndIdx = newEndIdx.clamp(0, maxIdx);

    updateViewport(
      viewport.copyWith(
        startIdx: newStartIdx,
        endIdx: newEndIdx,
        scale: (viewport.scale * scaleFactor).clamp(0.1, 10.0),
      ),
    );
  }

  /// Updates the viewport of the current frame and increments all panel sequences.
  void updateViewport(Viewport viewport) {
    final newPanelSeqs = Map<String, int>.from(_frame.panelSequenceNumbers);
    newPanelSeqs.updateAll((key, value) => value + 1);

    frame = _frame.copyWith(
      viewport: viewport,
      sequenceNumber: _frame.sequenceNumber + 1,
      panelSequenceNumbers: newPanelSeqs,
    );
  }

  /// Converts a horizontal pixel position to a timestamp.
  int? getTimestampAt(double dx) {
    final size = lastViewSize;
    if (size == null || size.width <= 0) return null;

    final series = _frame.series;
    if (series.length == 0) return null;

    final viewport = _frame.viewport;
    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);
    final int visibleCount = endIdx - startIdx + 1;
    final double candleWidth = (size.width / visibleCount);

    final double relativeIdx = dx / candleWidth;
    final int index = (startIdx + relativeIdx.floor()).clamp(
      0,
      series.length - 1,
    );
    return series.timestamps[index];
  }

  /// Converts a timestamp to a horizontal pixel position.
  double? getDxAt(int timestamp) {
    final size = lastViewSize;
    if (size == null || size.width <= 0) return null;

    final series = _frame.series;
    if (series.length == 0) return null;

    final viewport = _frame.viewport;
    final index = _findTimestampIndex(timestamp);

    if (index == -1) return null;

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);
    final int visibleCount = endIdx - startIdx + 1;
    final double candleWidth = (size.width / visibleCount);

    return (index - startIdx) * candleWidth + candleWidth / 2;
  }

  /// Returns the start and end timestamps of the visible range.
  (int, int) getVisibleTimeRange() {
    final series = _frame.series;
    final viewport = _frame.viewport;
    if (series.length == 0) return (0, 0);

    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);

    return (series.timestamps[startIdx], series.timestamps[endIdx]);
  }

  /// Updates the viewport to match the given time range as closely as possible.
  void setVisibleTimeRange(int startTimestamp, int endTimestamp) {
    final series = _frame.series;
    if (series.length == 0) return;

    final int startIdx = _findTimestampIndex(startTimestamp, nearest: true);
    final int endIdx = _findTimestampIndex(endTimestamp, nearest: true);

    updateViewport(
      _frame.viewport.copyWith(
        startIdx: startIdx,
        endIdx: endIdx,
        scrollX: 0, // Reset scroll offset when syncing by time
      ),
    );
  }

  int _findTimestampIndex(int timestamp, {bool nearest = false}) {
    final series = _frame.series;
    int low = 0;
    int high = series.length - 1;
    while (low <= high) {
      final int mid = low + ((high - low) >> 1);
      if (series.timestamps[mid] == timestamp) return mid;
      if (series.timestamps[mid] < timestamp) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }
    return nearest ? low.clamp(0, series.length - 1) : -1;
  }

  /// Updates a specific indicator and only its sequence number.
  void updateIndicator(String id, Series indicatorSeries) {
    final newIndicators = Map<String, Series>.from(_frame.indicators);
    newIndicators[id] = indicatorSeries;

    final newPanelSeqs = Map<String, int>.from(_frame.panelSequenceNumbers);
    newPanelSeqs[id] = (newPanelSeqs[id] ?? 0) + 1;

    frame = _frame.copyWith(
      indicators: newIndicators,
      sequenceNumber: _frame.sequenceNumber + 1,
      panelSequenceNumbers: newPanelSeqs,
    );
  }

  /// Returns the list of active panels.
  List<ChartPanel> get panels {
    final List<ChartPanel> result = [
      MainPanel(controller: this, flex: _panelFlexFactors[0]),
      VolumePanel(controller: this, flex: _panelFlexFactors[1]),
    ];

    int flexIdx = 2;

    // Add institutional panels if enabled
    if (enabledInstitutionalPanels.contains('volume_profile')) {
      result.add(VolumeProfilePanel(
          controller: this,
          flex: _panelFlexFactors.length > flexIdx
              ? _panelFlexFactors[flexIdx++]
              : 1.0));
    }
    if (enabledInstitutionalPanels.contains('depth')) {
      result.add(DepthPanel(
          controller: this,
          flex: _panelFlexFactors.length > flexIdx
              ? _panelFlexFactors[flexIdx++]
              : 1.0));
    }
    if (enabledInstitutionalPanels.contains('liquidation_heatmap')) {
      result.add(LiquidationHeatmapPanel(
          controller: this,
          flex: _panelFlexFactors.length > flexIdx
              ? _panelFlexFactors[flexIdx++]
              : 1.0));
    }

    for (final entry in _frame.indicators.entries) {
      if (entry.key != 'volume') {
        result.add(
          SecondaryPanel(
            controller: this,
            indicatorId: entry.key,
            flex: _panelFlexFactors.length > flexIdx
                ? _panelFlexFactors[flexIdx++]
                : 1.0,
          ),
        );
      }
    }

    return result;
  }

  /// Announces candle data for accessibility.
  void announceCandle(int timestamp, ChartNumberFormatters formatters) {
    final index = _findTimestampIndex(timestamp, nearest: true);
    if (index == -1) return;

    final label = ChartSemanticsBuilder.buildCandleDescription(
      timestamp: timestamp,
      open: _frame.series.open[index],
      high: _frame.series.high[index],
      low: _frame.series.low[index],
      close: _frame.series.close[index],
      formatters: formatters,
    );

    // ignore: deprecated_member_use
    SemanticsService.announce(label, TextDirection.ltr);
  }

  /// Resizes panels based on a drag delta.
  void resizePanels(int index, double deltaPixels, double totalHeight) {
    if (totalHeight <= 0) return;
    if (index < 0 || index >= _panelFlexFactors.length - 1) return;

    final totalFlex = _panelFlexFactors.reduce((a, b) => a + b);
    final deltaFlex = (deltaPixels / totalHeight) * totalFlex;

    final newFlexAbove = _panelFlexFactors[index] + deltaFlex;
    final newFlexBelow = _panelFlexFactors[index + 1] - deltaFlex;

    if (newFlexAbove > 0.1 && newFlexBelow > 0.1) {
      _panelFlexFactors[index] = newFlexAbove;
      _panelFlexFactors[index + 1] = newFlexBelow;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _selectionDebounceTimer?.cancel();
    crosshair.dispose();
    super.dispose();
  }
}
