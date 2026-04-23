import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/src/painting/main_panel_painter.dart';

void main() {
  /// US 3.02: Performance Lab - Benchmark
  /// Ensures paint() execution remains under 16ms for 50k candles dataset.
  test('Benchmark - MainPanelPainter.paint() with 50k candles', () async {
    final file = File('test/fixtures/candles_50k.json');
    final jsonString = await file.readAsString();
    final List<dynamic> jsonList = jsonDecode(jsonString);

    final n = jsonList.length;
    final timestamps = Int64List(n);
    final open = Float64List(n);
    final high = Float64List(n);
    final low = Float64List(n);
    final close = Float64List(n);
    final volume = Float64List(n);

    for (int i = 0; i < n; i++) {
      final Map<String, dynamic> item = jsonList[i];
      timestamps[i] = item['timestamp'] as int;
      open[i] = (item['open'] as num).toDouble();
      high[i] = (item['high'] as num).toDouble();
      low[i] = (item['low'] as num).toDouble();
      close[i] = (item['close'] as num).toDouble();
      volume[i] = (item['volume'] as num).toDouble();
    }

    final series = Series(
      timestamps: timestamps,
      open: open,
      high: high,
      low: low,
      close: close,
      volume: volume,
    );

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final size = const Size(800, 600);

    // Extended warmup phase to ensure JIT optimization
    for (int i = 0; i < 100; i++) {
      final frame = ChartFrame(
        series: series,
        indicators: {},
        viewport: Viewport(
          startIdx: (i * 10) % (n - 200),
          endIdx: ((i * 10) % (n - 200)) + 200,
          scale: 1.0,
          scrollX: 0.0,
        ),
        overlays: [],
        sequenceNumber: -1 - i,
      );
      final painter = MainPanelPainter(frame: frame);
      painter.paint(canvas, size);
    }

    final int windowSize = 200;
    final int step = 100;
    final List<int> times = [];

    for (int start = 0; start <= n - windowSize; start += step) {
      final frame = ChartFrame(
        series: series,
        indicators: {},
        viewport: Viewport(
          startIdx: start,
          endIdx: start + windowSize - 1,
          scale: 1.0,
          scrollX: 0.0,
        ),
        overlays: [],
        sequenceNumber: start,
      );

      final painter = MainPanelPainter(frame: frame);

      final sw = Stopwatch()..start();
      painter.paint(canvas, size);
      sw.stop();

      times.add(sw.elapsedMicroseconds);
    }

    // Sort times and ignore the top 1% slowest (potential system spikes)
    times.sort();
    final int countToKeep = (times.length * 0.99).floor();
    final List<int> filteredTimes = times.take(countToKeep).toList();

    final double avgTimeMs =
        filteredTimes.reduce((a, b) => a + b) / filteredTimes.length / 1000.0;
    final double maxTimeMs =
        filteredTimes.reduce((a, b) => a > b ? a : b) / 1000.0;
    final double absoluteMaxTimeMs = times.last / 1000.0;

    print('Average paint time: ${avgTimeMs.toStringAsFixed(3)}ms');
    print(
        'Filtered Maximum paint time (99th percentile): ${maxTimeMs.toStringAsFixed(3)}ms');
    print(
        'Absolute Maximum paint time: ${absoluteMaxTimeMs.toStringAsFixed(3)}ms');

    expect(maxTimeMs, lessThan(16.0),
        reason: '99th percentile paint time exceeded 16ms');
  });
}
