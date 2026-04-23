import 'package:flutter/foundation.dart';
import 'package:kchart_core/kchart_core.dart';
import 'panels/chart_panel.dart';
import 'panels/main_panel.dart';
import 'panels/volume_panel.dart';
import 'panels/secondary_panel.dart';

/// Controller for the KChart widget.
///
/// Manages the [ChartFrame] and notifies listeners of changes.
class KChartController extends ChangeNotifier {
  ChartFrame _frame;

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

  void _ensureFlexFactors() {
    final panelCount = 2 + _frame.indicators.keys.where((k) => k != 'volume').length;
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

      updateViewport(viewport.copyWith(
        startIdx: newStartIdx,
        endIdx: newEndIdx,
        scrollX: newScrollX,
      ));
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

    updateViewport(viewport.copyWith(
      startIdx: newStartIdx,
      endIdx: newEndIdx,
      scale: (viewport.scale * scaleFactor).clamp(0.1, 10.0),
    ));
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
    for (final entry in _frame.indicators.entries) {
      if (entry.key != 'volume') {
        result.add(
          SecondaryPanel(
            controller: this,
            indicatorId: entry.key,
            flex: _panelFlexFactors[flexIdx++],
          ),
        );
      }
    }

    return result;
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
}
