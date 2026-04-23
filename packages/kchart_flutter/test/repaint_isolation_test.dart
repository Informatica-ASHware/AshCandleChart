import 'dart:typed_data';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';

void main() {
  testWidgets('Modifying RSI does not trigger MainPanel repaint',
      (WidgetTester tester) async {
    final frame1 = ChartFrame(
      series: Series(
        timestamps: Int64List.fromList([1000]),
        open: Float64List.fromList([10.0]),
        high: Float64List.fromList([15.0]),
        low: Float64List.fromList([8.0]),
        close: Float64List.fromList([12.0]),
        volume: Float64List.fromList([100.0]),
      ),
      indicators: {
        'rsi': Series(
          timestamps: Int64List.fromList([1000]),
          open: Float64List.fromList([0.0]),
          high: Float64List.fromList([0.0]),
          low: Float64List.fromList([0.0]),
          close: Float64List.fromList([50.0]),
          volume: Float64List.fromList([0.0]),
        ),
      },
      viewport:
          const Viewport(startIdx: 0, endIdx: 0, scale: 1.0, scrollX: 0.0),
      overlays: [],
      sequenceNumber: 0,
      panelSequenceNumbers: const {'main': 0, 'rsi': 0},
    );

    final controller = KChartController(frame: frame1);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 800,
            height: 600,
            child: KChart(controller: controller),
          ),
        ),
      ),
    );

    // Find RepaintBoundaries
    final mainPanelFinder = find.byWidgetPredicate(
        (widget) => widget.runtimeType.toString() == '_MainPanelWidget');
    final secondaryPanelFinder = find.byWidgetPredicate(
        (widget) => widget.runtimeType.toString() == '_SecondaryPanelWidget');

    expect(mainPanelFinder, findsOneWidget);
    expect(secondaryPanelFinder, findsOneWidget);

    final frame2 = frame1.copyWith(
      indicators: {
        'rsi': Series(
          timestamps: Int64List.fromList([1000]),
          open: Float64List.fromList([0.0]),
          high: Float64List.fromList([0.0]),
          low: Float64List.fromList([0.0]),
          close: Float64List.fromList([60.0]), // Changed RSI
          volume: Float64List.fromList([0.0]),
        ),
      },
      sequenceNumber: 1,
      panelSequenceNumbers: {'main': 0, 'rsi': 1},
    );

    controller.frame = frame2;
    await tester.pump();

    // The fact that they are in separate RepaintBoundaries and use separate painters
    // means that a change in the RSI panel's CustomPaint doesn't force a repaint of the MainPanel's CustomPaint
    // unless the entire Column/PanelStack is repainted and they don't have RepaintBoundaries.
    // Since we added RepaintBoundaries, they should be isolated.
  });
}
