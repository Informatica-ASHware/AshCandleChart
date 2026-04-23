import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kchart_riverpod/kchart_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ChartFrame testFrame;

  setUp(() {
    testFrame = ChartFrame(
      series: Series(
        timestamps: Int64List.fromList([1000]),
        open: Float64List.fromList([100.0]),
        high: Float64List.fromList([110.0]),
        low: Float64List.fromList([90.0]),
        close: Float64List.fromList([105.0]),
        volume: Float64List.fromList([1000.0]),
      ),
      indicators: {},
      viewport: const Viewport(startIdx: 0, endIdx: 0, scale: 1.0, scrollX: 0.0),
      overlays: [],
      sequenceNumber: 0,
      panelSequenceNumbers: const {'main': 0},
    );
  });

  group('kchartControllerProvider', () {
    test('initializes with frame and disposes correctly', () {
      final container = ProviderContainer();
      final controller = container.read(kchartControllerProvider(testFrame));

      expect(controller.frame, testFrame);

      container.dispose();

      expect(() => controller.addListener(() {}), throwsFlutterError);
    });
  });

  group('chartFrameProvider', () {
    test('emits frames from controller', () async {
      final container = ProviderContainer();
      final controller = KChartController(frame: testFrame);

      container.listen(
        chartFrameProvider(controller),
        (previous, next) {},
      );

      // We use .future to wait for the first data
      final initialFrame = await container.read(chartFrameProvider(controller).future);
      expect(initialFrame, testFrame);

      // Update frame
      final newFrame = testFrame.copyWith(sequenceNumber: 1);
      controller.frame = newFrame;

      // Wait for the next value from the stream
      await Future.delayed(Duration.zero);
      expect(container.read(chartFrameProvider(controller)).value, newFrame);

      container.dispose();
    });

    test('manual autoPause: removes listener on cancel and re-adds on resume', () async {
      final container = ProviderContainer();
      final controller = KChartController(frame: testFrame);

      // We can track if the controller has listeners
      // ignore: invalid_use_of_protected_member
      expect(controller.hasListeners, isFalse);

      final subscription = container.listen(
        chartFrameProvider(controller),
        (previous, next) {},
      );

      // ignore: invalid_use_of_protected_member
      expect(controller.hasListeners, isTrue);

      // Cancel (pause)
      subscription.pause();
      await Future.delayed(Duration.zero);

      // Resume
      subscription.resume();
      await Future.delayed(Duration.zero);
      // ignore: invalid_use_of_protected_member
      expect(controller.hasListeners, isTrue);

      subscription.close();
      await Future.delayed(Duration.zero);
      // ignore: invalid_use_of_protected_member
      expect(controller.hasListeners, isFalse);

      container.dispose();
    });
  });
}

// Helper to catch FlutterError
final throwsFlutterError = throwsA(isA<FlutterError>());
