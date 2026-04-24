import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:flutter/material.dart' hide Viewport;

void main() {
  late KChartController controller1;
  late KChartController controller2;
  late SyncEngine syncEngine;

  Series createSeries(int count, {int startTs = 0}) {
    return Series(
      timestamps:
          Int64List.fromList(List.generate(count, (i) => startTs + i * 1000)),
      open: Float64List(count),
      high: Float64List(count),
      low: Float64List(count),
      close: Float64List(count),
      volume: Float64List(count),
    );
  }

  ChartFrame createFrame(Series series) {
    return ChartFrame(
      series: series,
      indicators: {},
      viewport: const Viewport(startIdx: 0, endIdx: 10, scale: 1.0, scrollX: 0),
      overlays: [],
      sequenceNumber: 0,
      panelSequenceNumbers: {'main': 0},
    );
  }

  setUp(() {
    controller1 = KChartController(frame: createFrame(createSeries(100)));
    controller1.lastViewSize = const Size(1000, 500);

    controller2 = KChartController(frame: createFrame(createSeries(100)));
    controller2.lastViewSize = const Size(1000, 500);

    syncEngine = SyncEngine();
    syncEngine.addController(controller1);
    syncEngine.addController(controller2);
  });

  test('SyncEngine synchronizes time axis', () async {
    // Manually update viewport of controller1
    controller1.setVisibleTimeRange(10000, 20000);

    // Give some time for microtasks
    await Future.delayed(Duration.zero);

    final range1 = controller1.getVisibleTimeRange();
    final range2 = controller2.getVisibleTimeRange();

    expect(range1.$1, equals(10000));
    expect(range1.$2, equals(20000));
    expect(range2.$1, equals(10000));
    expect(range2.$2, equals(20000));
  });

  test('SyncEngine synchronizes crosshair', () async {
    final timestamp = controller1.frame.series.timestamps[5];
    final dx = controller1.getDxAt(timestamp)!;

    controller1.crosshair.update(CrosshairState(
      dx: dx,
      dy: 100,
      timestamp: timestamp,
    ));

    // Crosshair sync happens immediately usually, but let's be safe
    final state2 = controller2.crosshair.state.value;

    expect(state2, isNotNull);
    expect(state2!.timestamp, equals(timestamp));
    expect(state2.dx, equals(controller2.getDxAt(timestamp)));
  });

  test('SyncEngine avoids infinite loops', () async {
    // Both controllers update each other, should settle
    controller1.setVisibleTimeRange(10000, 20000);
    await Future.delayed(Duration.zero);

    expect(controller2.getVisibleTimeRange().$1, equals(10000));

    controller2.setVisibleTimeRange(30000, 40000);
    await Future.delayed(Duration.zero);

    expect(controller1.getVisibleTimeRange().$1, equals(30000));
  });

  test('KChartController handles empty series gracefully', () {
    final emptyController = KChartController(
      frame: ChartFrame(
        series: Series(
          timestamps: Int64List(0),
          open: Float64List(0),
          high: Float64List(0),
          low: Float64List(0),
          close: Float64List(0),
          volume: Float64List(0),
        ),
        indicators: {},
        viewport:
            const Viewport(startIdx: 0, endIdx: 0, scale: 1.0, scrollX: 0),
        overlays: [],
        sequenceNumber: 0,
        panelSequenceNumbers: {},
      ),
    );
    emptyController.lastViewSize = const Size(1000, 500);

    expect(emptyController.getTimestampAt(100), isNull);
    expect(emptyController.getDxAt(1000), isNull);
    expect(emptyController.getVisibleTimeRange(), equals((0, 0)));

    // Should not throw
    emptyController.setVisibleTimeRange(0, 1000);
  });
}
