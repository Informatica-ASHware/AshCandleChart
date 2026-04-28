import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ash_candle_chart_core/ash_candle_chart_core.dart';
import 'package:ash_candle_chart_flutter/ash_candle_chart_flutter.dart';

export 'package:ash_candle_chart_core/ash_candle_chart_core.dart';
export 'package:ash_candle_chart_flutter/ash_candle_chart_flutter.dart';

/// Provider that manages a [KChartController] initialized with a [ChartFrame].
///
/// This provider handles the lifecycle of the controller, ensuring it is properly
/// disposed of when the provider is no longer used.
final kchartControllerProvider =
    Provider.family<KChartController, ChartFrame>((ref, initialFrame) {
  final controller = KChartController(frame: initialFrame);
  ref.onDispose(controller.dispose);
  return controller;
});

/// StreamProvider that exposes the current [ChartFrame] of a [KChartController].
///
/// This provider automatically adds a listener to the controller to emit new
/// [ChartFrame] snapshots whenever the chart state changes.
///
/// It implements a manual "autoPause" mechanism:
/// - When the provider has no active listeners (e.g., chart not visible), it
///   removes the listener from the controller to save resources.
/// - When a listener is re-attached, it resumes listening to the controller.
final chartFrameProvider =
    StreamProvider.family<ChartFrame, KChartController>((ref, controller) {
  final streamController = StreamController<ChartFrame>();

  void listener() {
    if (!streamController.isClosed) {
      streamController.add(controller.frame);
    }
  }

  // Initial value
  streamController.add(controller.frame);

  controller.addListener(listener);

  ref.onCancel(() {
    controller.removeListener(listener);
  });

  ref.onResume(() {
    controller.addListener(listener);
    // Push the latest state upon resumption to ensure consistency
    listener();
  });

  ref.onDispose(() {
    controller.removeListener(listener);
    streamController.close();
  });

  return streamController.stream;
});
