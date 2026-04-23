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
