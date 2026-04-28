import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ash_candle_chart_flutter/src/panels/draggable_divider.dart';

void main() {
  testWidgets('DraggableDivider handles drag via raw pointers',
      (WidgetTester tester) async {
    double dragDelta = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DraggableDivider(
            onDragUpdate: (details) {
              dragDelta += details.primaryDelta ?? 0;
            },
          ),
        ),
      ),
    );

    final dividerFinder = find.byType(DraggableDivider);
    expect(dividerFinder, findsOneWidget);

    final Offset center = tester.getCenter(dividerFinder);

    // Simulate drag using pointers
    final TestGesture gesture = await tester.startGesture(center,
        kind: PointerDeviceKind.mouse, buttons: kPrimaryButton);
    await gesture.moveBy(const Offset(0, 50));
    await gesture.up();

    expect(dragDelta, 50);
  });
}
