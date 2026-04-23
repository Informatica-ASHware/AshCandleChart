import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_flutter/src/gestures/gesture_arbiter.dart';

void main() {
  group('GestureArbiter', () {
    late GestureArbiter arbiter;
    final List<Offset> panDeltas = [];
    final List<double> zoomScales = [];
    Offset? zoomFocalPoint;
    Offset? longPressPosition;
    bool longPressEnded = false;
    Offset? tapPosition;

    setUp(() {
      panDeltas.clear();
      zoomScales.clear();
      zoomFocalPoint = null;
      longPressPosition = null;
      longPressEnded = false;
      tapPosition = null;

      arbiter = GestureArbiter(
        onPanUpdate: (delta) => panDeltas.add(delta),
        onZoomUpdate: (scale, focalPoint) {
          zoomScales.add(scale);
          zoomFocalPoint = focalPoint;
        },
        onLongPressStart: (position) => longPressPosition = position,
        onLongPressEnd: () => longPressEnded = true,
        onTap: (position) => tapPosition = position,
        longPressTimeout: const Duration(milliseconds: 100),
      );
    });

    test('handles tap', () {
      arbiter.handleEvent(const PointerDownEvent(pointer: 1, position: Offset(10, 10)));
      arbiter.handleEvent(const PointerUpEvent(pointer: 1, position: Offset(10, 10)));

      expect(tapPosition, const Offset(10, 10));
      expect(panDeltas, isEmpty);
    });

    test('handles pan', () {
      arbiter.handleEvent(const PointerDownEvent(pointer: 1, position: Offset(10, 10)));
      arbiter.handleEvent(const PointerMoveEvent(
        pointer: 1,
        position: Offset(25, 10),
        delta: Offset(15, 0),
      ));

      expect(panDeltas.last, const Offset(15, 0));
      expect(tapPosition, isNull);
    });

    test('handles long press', () async {
      arbiter.handleEvent(const PointerDownEvent(pointer: 1, position: Offset(10, 10)));

      await Future.delayed(const Duration(milliseconds: 150));

      expect(longPressPosition, const Offset(10, 10));

      arbiter.handleEvent(const PointerUpEvent(pointer: 1, position: Offset(10, 10)));
      expect(longPressEnded, isTrue);
    });

    test('handles long press cancel', () async {
      arbiter.handleEvent(const PointerDownEvent(pointer: 1, position: Offset(10, 10)));
      await Future.delayed(const Duration(milliseconds: 150));
      expect(longPressPosition, const Offset(10, 10));

      arbiter.handleEvent(const PointerCancelEvent(pointer: 1, position: Offset(10, 10)));
      expect(longPressEnded, isTrue);
    });

    test('handles multi-touch zoom', () {
      arbiter.handleEvent(const PointerDownEvent(pointer: 1, position: Offset(10, 10)));
      arbiter.handleEvent(const PointerDownEvent(pointer: 2, position: Offset(20, 10)));

      // Initial distance is 10.
      arbiter.handleEvent(const PointerMoveEvent(
        pointer: 1,
        position: Offset(10, 10),
        delta: Offset(0, 0),
      ));

      arbiter.handleEvent(const PointerMoveEvent(
        pointer: 2,
        position: Offset(30, 10),
        delta: Offset(10, 0),
      ));

      expect(zoomScales.last, 2.0);
      expect(zoomFocalPoint, const Offset(20, 10)); // (10,10) and (30,10)
    });

    test('handles mouse scroll zoom', () {
      arbiter.handleEvent(const PointerScrollEvent(
        position: Offset(50, 50),
        scrollDelta: Offset(0, 10), // Scroll down -> zoom out
      ));

      expect(zoomScales.last, 0.9);
      expect(zoomFocalPoint, const Offset(50, 50));

      arbiter.handleEvent(const PointerScrollEvent(
        position: Offset(50, 50),
        scrollDelta: Offset(10, 0), // Scroll right -> pan left
      ));
      expect(panDeltas.last, const Offset(-10, 0));
    });

    test('handles trackpad pan zoom with scale delta', () {
      arbiter.handleEvent(const PointerPanZoomStartEvent(pointer: 1));

      // Scale from 1.0 to 1.5 -> delta 1.5
      arbiter.handleEvent(const PointerPanZoomUpdateEvent(
        pointer: 1,
        panDelta: Offset(10, 0),
        scale: 1.5,
        position: Offset(100, 100),
      ));

      expect(panDeltas.last, const Offset(10, 0));
      expect(zoomScales.last, 1.5);

      // Scale from 1.5 to 3.0 -> delta 2.0
      arbiter.handleEvent(const PointerPanZoomUpdateEvent(
        pointer: 1,
        panDelta: Offset(5, 0),
        scale: 3.0,
        position: Offset(100, 100),
      ));

      expect(zoomScales.last, 2.0);

      arbiter.handleEvent(const PointerPanZoomEndEvent(pointer: 1));
    });

    test('dispose clears state', () {
      arbiter.handleEvent(const PointerDownEvent(pointer: 1, position: Offset(10, 10)));
      arbiter.dispose();
      arbiter.handleEvent(const PointerUpEvent(pointer: 1, position: Offset(10, 10)));
      expect(tapPosition, isNull);
    });

    test('ignores move events for pointers not tracked from start', () {
      // Move event without Down event
      arbiter.handleEvent(const PointerMoveEvent(
        pointer: 1,
        position: Offset(20, 20),
        delta: Offset(10, 10),
      ));

      expect(panDeltas, isEmpty);
    });
  });
}
