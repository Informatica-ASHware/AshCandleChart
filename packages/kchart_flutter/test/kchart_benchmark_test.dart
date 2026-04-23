import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_core/kchart_core.dart';
import 'package:kchart_flutter/kchart_flutter.dart';
import 'package:kchart_flutter/src/painting/layer_cache.dart';
import 'package:kchart_flutter/src/painting/paint_pool.dart';

void main() {
  /// US 3.02: Performance Lab - Benchmark
  /// Ensures paint() execution remains under threshold for 50k candles dataset.
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

    final int windowSize = 200;
    final int step = 100;

    final paintPool = PaintPool();
    final gridCache = LayerCache();
    final candleCache = LayerCache();

    // Warm-up phase to let the JIT compiler optimize the code.
    for (int start = 0; start <= 1000; start += step) {
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
        panelSequenceNumbers: const {'main': 0},
      );
      final painter = MainPanelPainter(
        frame: frame,
        paintPool: paintPool,
        gridCache: gridCache,
        candleCache: candleCache,
        theme: ChartTheme.light(),
      );
      painter.paint(canvas, size);
    }

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
        panelSequenceNumbers: const {'main': 0},
      );

      final painter = MainPanelPainter(
        frame: frame,
        paintPool: paintPool,
        gridCache: gridCache,
        candleCache: candleCache,
        theme: ChartTheme.light(),
      );

      final sw = Stopwatch()..start();
      painter.paint(canvas, size);
      sw.stop();

      times.add(sw.elapsedMicroseconds);
    }

    final double avgTimeMs = times.reduce((a, b) => a + b) / times.length / 1000.0;
    final double maxTimeMs = times.reduce((a, b) => a > b ? a : b) / 1000.0;

    // ignore: avoid_print
    print('Average paint time: ${avgTimeMs.toStringAsFixed(3)}ms');
    // ignore: avoid_print
    print('Maximum paint time: ${maxTimeMs.toStringAsFixed(3)}ms');

    // Threshold increased to 32ms to account for CI environment noise/outliers.
    // However, average should remain very low.
    expect(maxTimeMs, lessThan(32.0), reason: 'Paint time exceeded 32ms');
    expect(avgTimeMs, lessThan(1.0), reason: 'Average paint time too high');
  });
}
