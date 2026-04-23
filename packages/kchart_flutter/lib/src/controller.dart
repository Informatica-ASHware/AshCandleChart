import 'package:flutter/foundation.dart';
import 'package:kchart_core/kchart_core.dart';

/// Controller for the KChart widget.
///
/// Manages the [ChartFrame] and notifies listeners of changes.
class KChartController extends ChangeNotifier {
  ChartFrame _frame;

  /// Creates a [KChartController] with an initial [ChartFrame].
  KChartController({required ChartFrame frame}) : _frame = frame;

  /// The current [ChartFrame].
  ChartFrame get frame => _frame;

  /// Updates the current [ChartFrame] and notifies listeners.
  set frame(ChartFrame newFrame) {
    if (_frame == newFrame) return;
    _frame = newFrame;
    notifyListeners();
  }

  /// Updates the viewport of the current frame.
  void updateViewport(Viewport viewport) {
    frame = _frame.copyWith(
      viewport: viewport,
      sequenceNumber: _frame.sequenceNumber + 1,
    );
  }
}
