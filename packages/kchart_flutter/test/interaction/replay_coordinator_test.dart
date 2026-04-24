import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/src/interaction/replay/replay_coordinator.dart';

void main() {
  group('ReplayCoordinator', () {
    late StreamController<ChartFrame> streamController;
    late Series initialSeries;
    late ChartFrame initialFrame;

    setUp(() {
      streamController = StreamController<ChartFrame>();
      initialSeries = Series(
        timestamps: Int64List.fromList([100, 200, 300, 400, 500]),
        open: Float64List.fromList([1.0, 1.1, 1.2, 1.3, 1.4]),
        high: Float64List.fromList([1.5, 1.6, 1.7, 1.8, 1.9]),
        low: Float64List.fromList([0.5, 0.6, 0.7, 0.8, 0.9]),
        close: Float64List.fromList([1.1, 1.2, 1.3, 1.4, 1.5]),
        volume: Float64List.fromList([100, 200, 300, 400, 500]),
      );
      initialFrame = ChartFrame(
        series: initialSeries,
        indicators: {},
        viewport: const Viewport(
          startIdx: 0,
          endIdx: 4,
          scale: 1.0,
          scrollX: 0.0,
        ),
        overlays: [],
        sequenceNumber: 1,
        panelSequenceNumbers: {'main': 1},
      );
    });

    test('truncates data based on currentTimestamp', () async {
      final coordinator =
          ReplayCoordinator(inputStream: streamController.stream);
      streamController.add(initialFrame);

      await Future.delayed(Duration.zero);
      expect(coordinator.currentTimestamp, 500);
      expect(coordinator.truncatedFrame?.series.length, 5);

      coordinator.scrub(300);
      expect(coordinator.currentTimestamp, 300);
      expect(coordinator.truncatedFrame?.series.length, 3);
      expect(coordinator.truncatedFrame?.series.timestamps.last, 300);
    });

    test('hides future annotations', () async {
      final frameWithAnnotations = initialFrame.copyWith(
        annotations: AnnotationDocument(
          annotations: [
            Annotation.trendLine(
              id: '1',
              start: const AnnotationPoint(timestamp: 100, price: 1.0),
              end: const AnnotationPoint(timestamp: 200, price: 1.1),
            ),
            Annotation.trendLine(
              id: '2',
              start: const AnnotationPoint(timestamp: 300, price: 1.2),
              end: const AnnotationPoint(timestamp: 400, price: 1.3),
            ),
          ],
        ),
      );

      final coordinator =
          ReplayCoordinator(inputStream: streamController.stream);
      streamController.add(frameWithAnnotations);

      await Future.delayed(Duration.zero);
      coordinator.scrub(250); // Between 200 and 300

      expect(coordinator.truncatedFrame?.annotations.annotations.length, 1);
      expect(coordinator.truncatedFrame?.annotations.annotations.first.id, '1');
    });

    test('hides future trade overlays', () async {
      final frameWithOverlays = initialFrame.copyWith(
        tradeOverlays: TradeOverlayDocument(
          overlays: [
            TradeOverlay.marker(
              id: '1',
              point: const AnnotationPoint(timestamp: 100, price: 1.0),
            ),
            TradeOverlay.marker(
              id: '2',
              point: const AnnotationPoint(timestamp: 400, price: 1.3),
            ),
          ],
        ),
      );

      final coordinator =
          ReplayCoordinator(inputStream: streamController.stream);
      streamController.add(frameWithOverlays);

      await Future.delayed(Duration.zero);
      coordinator.scrub(300);

      expect(coordinator.truncatedFrame?.tradeOverlays.overlays.length, 1);
      expect(coordinator.truncatedFrame?.tradeOverlays.overlays.first.id, '1');
    });
  });
}
