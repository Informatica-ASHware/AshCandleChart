import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:ash_candle_chart_core/ash_candle_chart_core.dart';
import 'package:ash_candle_chart_flutter/src/interaction/replay/replay_coordinator.dart';
import 'package:ash_candle_chart_flutter/src/interaction/replay/replay_slider.dart';
import 'dart:async';
import 'dart:typed_data';

void main() {
  group('ReplaySlider', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      final streamController = StreamController<ChartFrame>();
      final series = Series(
        timestamps: Int64List.fromList([100, 200, 300]),
        open: Float64List.fromList([1.0, 1.1, 1.2]),
        high: Float64List.fromList([1.5, 1.6, 1.7]),
        low: Float64List.fromList([0.5, 0.6, 0.7]),
        close: Float64List.fromList([1.1, 1.2, 1.3]),
        volume: Float64List.fromList([100, 200, 300]),
      );
      final frame = ChartFrame(
        series: series,
        indicators: {},
        viewport:
            const Viewport(startIdx: 0, endIdx: 2, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 1,
        panelSequenceNumbers: {'main': 1},
      );

      final coordinator =
          ReplayCoordinator(inputStream: streamController.stream);
      streamController.add(frame);
      await tester.pump();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: ReplaySlider(coordinator: coordinator),
          ),
        ),
      );

      expect(find.byType(ReplaySlider), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
      expect(find.byType(Slider), findsOneWidget);
    });
  });
}
