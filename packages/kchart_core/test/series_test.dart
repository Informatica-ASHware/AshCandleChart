import 'dart:typed_data';
import 'package:kchart_core/kchart_core.dart';
import 'package:test/test.dart';

void main() {
  group('Candle', () {
    test('should create a Candle with correct values', () {
      const candle = Candle(
        timestamp: 1625097600000,
        open: 100.0,
        high: 110.0,
        low: 90.0,
        close: 105.0,
        volume: 1000.0,
      );

      expect(candle.timestamp, 1625097600000);
      expect(candle.open, 100.0);
      expect(candle.high, 110.0);
      expect(candle.low, 90.0);
      expect(candle.close, 105.0);
      expect(candle.volume, 1000.0);
    });

    test('equality and copyWith', () {
      const candle1 = Candle(
        timestamp: 1,
        open: 1,
        high: 1,
        low: 1,
        close: 1,
        volume: 1,
      );
      const candle2 = Candle(
        timestamp: 1,
        open: 1,
        high: 1,
        low: 1,
        close: 1,
        volume: 1,
      );

      expect(candle1, equals(candle2));
      expect(candle1.hashCode, equals(candle2.hashCode));

      final candle3 = candle1.copyWith(open: 2);
      expect(candle3.open, 2);
      expect(candle3.timestamp, 1);
    });
  });

  group('Series', () {
    test('Series.fromCandles should perform O(N) conversion to columnar format',
        () {
      final candles = List.generate(
        100,
        (i) => Candle(
          timestamp: i,
          open: i.toDouble(),
          high: (i + 1).toDouble(),
          low: (i - 1).toDouble(),
          close: i.toDouble(),
          volume: (i * 10).toDouble(),
        ),
      );

      final series = Series.fromCandles(candles);

      expect(series.length, 100);
      expect(series.timestamps, isA<Int64List>());
      expect(series.open, isA<Float64List>());
      expect(series.high, isA<Float64List>());
      expect(series.low, isA<Float64List>());
      expect(series.close, isA<Float64List>());
      expect(series.volume, isA<Float64List>());

      for (var i = 0; i < 100; i++) {
        expect(series.timestamps[i], i);
        expect(series.open[i], i.toDouble());
        expect(series.high[i], (i + 1).toDouble());
        expect(series.low[i], (i - 1).toDouble());
        expect(series.close[i], i.toDouble());
        expect(series.volume[i], (i * 10).toDouble());
      }
    });

    test('Series should throw if lists have different lengths', () {
      expect(
        () => Series(
          timestamps: Int64List(5),
          open: Float64List(5),
          high: Float64List(5),
          low: Float64List(5),
          close: Float64List(5),
          volume: Float64List(4), // Different length
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('copyWith should create a new Series with updated fields', () {
      final series = Series(
        timestamps: Int64List(1),
        open: Float64List(1),
        high: Float64List(1),
        low: Float64List(1),
        close: Float64List(1),
        volume: Float64List(1),
      );
      final newTimestamps = Int64List(1);
      final updated = series.copyWith(timestamps: newTimestamps);

      expect(updated.timestamps, equals(newTimestamps));
      expect(updated.open, equals(series.open));
    });
  });

  group('Viewport', () {
    test('should create a Viewport and support copyWith', () {
      const viewport = Viewport(
        startIdx: 0,
        endIdx: 100,
        scale: 1.0,
        scrollX: 0.0,
      );

      final updated = viewport.copyWith(startIdx: 10, scale: 1.5);

      expect(updated.startIdx, 10);
      expect(updated.endIdx, 100);
      expect(updated.scale, 1.5);
      expect(updated.scrollX, 0.0);
    });
  });

  group('ChartFrame', () {
    test('should create a ChartFrame with all required components', () {
      final series = Series.fromCandles([]);
      const viewport = Viewport(
        startIdx: 0,
        endIdx: 0,
        scale: 1.0,
        scrollX: 0.0,
      );

      final frame = ChartFrame(
        series: series,
        indicators: {'MA20': series},
        viewport: viewport,
        overlays: [],
        sequenceNumber: 1,
      );

      expect(frame.series, series);
      expect(frame.indicators['MA20'], series);
      expect(frame.viewport, viewport);
      expect(frame.sequenceNumber, 1);

      final frame2 = frame.copyWith(sequenceNumber: 2);
      expect(frame2.sequenceNumber, 2);
      expect(frame2.series, series);
    });
  });
}
