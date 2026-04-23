import 'package:freezed_annotation/freezed_annotation.dart';
import 'annotation.dart';
import 'series.dart';
import 'viewport.dart';

part 'chart_frame.freezed.dart';

/// Represents a complete snapshot of the chart state for a single frame.
///
/// This model is immutable and contains all the necessary data to render
/// the chart, including the main series, indicators, and the current viewport.
@freezed
class ChartFrame with _$ChartFrame {
  /// Creates a [ChartFrame] with the given parameters.
  const factory ChartFrame({
    /// The main price [Series].
    required Series series,

    /// Map of indicator names to their respective [Series].
    required Map<String, Series> indicators,

    /// The current [Viewport] state.
    required Viewport viewport,

    /// The collection of annotations (drawings) in the chart.
    @Default(AnnotationDocument()) AnnotationDocument annotations,

    /// List of overlays (e.g., drawings, alerts, etc.) to be rendered.
    required List<dynamic> overlays,

    /// Sequential number to track frame updates and ensure consistent state.
    required int sequenceNumber,

    /// Granular sequence numbers per panel to optimize repaints.
    /// Key can be 'main', 'volume', or indicator IDs.
    required Map<String, int> panelSequenceNumbers,
  }) = _ChartFrame;
}
