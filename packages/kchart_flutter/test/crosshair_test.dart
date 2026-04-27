import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/src/crosshair_coordinator.dart';
import 'package:kchart_flutter/src/controller.dart';
import 'package:kchart_flutter/src/panels/crosshair_overlay.dart';
import 'dart:typed_data';

void main() {
  group('CrosshairCoordinator', () {
    test('should initial state be null', () {
      final coordinator = CrosshairCoordinator();
      expect(coordinator.state.value, isNull);
    });

    test('should update state', () {
      final coordinator = CrosshairCoordinator();
      const newState = CrosshairState(dx: 10, dy: 20, timestamp: 1000);
      coordinator.update(newState);
      expect(coordinator.state.value, newState);
    });

    test('should clear state', () {
      final coordinator = CrosshairCoordinator();
      coordinator.update(const CrosshairState(dx: 10));
      coordinator.clear();
      expect(coordinator.state.value, isNull);
    });
  });

  group('KChartController with Crosshair', () {
    test('should dispose crosshair when controller is disposed', () {
      final series = Series(
        timestamps: Int64List.fromList([1000]),
        open: Float64List.fromList([10.0]),
        high: Float64List.fromList([11.0]),
        low: Float64List.fromList([9.0]),
        close: Float64List.fromList([10.5]),
        volume: Float64List.fromList([100.0]),
      );
      final frame = ChartFrame(
        series: series,
        indicators: {},
        viewport:
            const Viewport(startIdx: 0, endIdx: 0, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 0,
        panelSequenceNumbers: {'main': 0},
      );
      final controller = KChartController(frame: frame);

      // We can't easily check if it's disposed without a mock or exposing internals,
      // but we can ensure it doesn't throw when calling dispose.
      controller.dispose();
    });
  });

  group('CrosshairOverlay', () {
    testWidgets('should render without error', (WidgetTester tester) async {
      const state = CrosshairState(dx: 50, dy: 50);
      final series = Series(
        timestamps: Int64List.fromList([1000]),
        open: Float64List.fromList([10.0]),
        high: Float64List.fromList([11.0]),
        low: Float64List.fromList([9.0]),
        close: Float64List.fromList([10.5]),
        volume: Float64List.fromList([100.0]),
      );
      final frame = ChartFrame(
        series: series,
        indicators: {},
        viewport:
            const Viewport(startIdx: 0, endIdx: 0, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 0,
        panelSequenceNumbers: {'main': 0},
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 100,
              child: CrosshairOverlay(state: state, frame: frame),
            ),
          ),
        ),
      );
      expect(find.byType(CrosshairOverlay), findsOneWidget);
    });
  });
}
