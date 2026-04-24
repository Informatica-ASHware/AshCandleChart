import 'dart:typed_data';
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';

void main() {
  testWidgets('Snapshot export returns a valid Uint8List', (tester) async {
    // 1. Setup minimal data
    final series = Series(
      timestamps: Int64List.fromList([1000, 2000, 3000]),
      open: Float64List.fromList([10, 11, 12]),
      high: Float64List.fromList([15, 16, 17]),
      low: Float64List.fromList([5, 6, 7]),
      close: Float64List.fromList([12, 13, 14]),
      volume: Float64List.fromList([100, 200, 300]),
    );

    final frame = ChartFrame(
      series: series,
      viewport:
          const Viewport(startIdx: 0, endIdx: 2, scale: 1.0, scrollX: 0.0),
      indicators: {},
      overlays: [],
      sequenceNumber: 0,
      panelSequenceNumbers: {'main': 0, 'volume': 0},
    );

    final controller = KChartController(frame: frame);

    // 2. Build the widget
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

    // Initial pump to layout
    await tester.pumpAndSettle();

    // 3. Perform export
    Uint8List? imageBytes;
    await tester.runAsync(() async {
      imageBytes = await controller.exportToImage(
        config: const ExportConfig(
          watermark: 'TEST WATERMARK',
          pixelRatio: 1.0,
        ),
      );
    });

    // 4. Verify output
    expect(imageBytes, isNotNull);
    expect(imageBytes!, isNotEmpty);
    // PNG signature: 137 80 78 71 13 10 26 10
    expect(imageBytes!.sublist(0, 8), [137, 80, 78, 71, 13, 10, 26, 10]);
  });
}
