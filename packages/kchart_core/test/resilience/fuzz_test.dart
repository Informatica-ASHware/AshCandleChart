import 'dart:typed_data';
import 'package:glados/glados.dart';
import 'package:kchart_core/kchart_core.dart';

void main() {
  group('Fuzz Testing Binary Reconstructors', () {
    // 1000 iterations as requested in the US
    Glados<Uint8List>(any.list(any.uint8).map(Uint8List.fromList)).test(
      'Series.fromBinary should not crash on random bytes',
      (bytes) {
        try {
          Series.fromBinary(bytes);
        } catch (e) {
          // Exceptions are expected for random data, but it should never crash with IndexOutOfRange or similar
          expect(e, isA<SeriesDeserializationException>());
        }
      },
    );

    Glados<Uint8List>(any.list(any.uint8).map(Uint8List.fromList)).test(
      'ChartFrame.fromBinary should not crash on random bytes',
      (bytes) {
        try {
          ChartFrame.fromBinary(bytes);
        } catch (e) {
          // Exceptions are expected, but no unhandled crashes
          expect(
            e,
            anyOf(
              isA<ChartFrameDeserializationException>(),
              isA<SeriesDeserializationException>(),
              isA<FormatException>(), // From jsonDecode or utf8.decode
              isA<TypeError>(), // From jsonDecode map casting
              isA<RangeError>(),
            ),
          );
        }
      },
    );
  });

  group('Explicit 1000 Iterations Fuzz', () {
    test('Series.fromBinary 1000 random samples', () {
      final random = Random(42);
      for (var i = 0; i < 1000; i++) {
        final length = random.nextInt(1000);
        final bytes = Uint8List(length);
        for (var j = 0; j < length; j++) {
          bytes[j] = random.nextInt(256);
        }

        try {
          Series.fromBinary(bytes);
        } catch (e) {
          expect(e, isA<SeriesDeserializationException>());
        }
      }
    });

    test('ChartFrame.fromBinary 1000 random samples', () {
      final random = Random(42);
      for (var i = 0; i < 1000; i++) {
        final length = random.nextInt(2000);
        final bytes = Uint8List(length);
        for (var j = 0; j < length; j++) {
          bytes[j] = random.nextInt(256);
        }

        try {
          ChartFrame.fromBinary(bytes);
        } catch (e) {
          expect(
            e,
            anyOf(
              isA<ChartFrameDeserializationException>(),
              isA<SeriesDeserializationException>(),
              isA<FormatException>(),
              isA<TypeError>(),
              isA<RangeError>(),
            ),
          );
        }
      }
    });
  });

  group('Round-trip tests', () {
    test('Series binary round-trip', () {
      final series = Series.fromCandles([
        const Candle(
            timestamp: 1, open: 1, high: 2, low: 0, close: 1, volume: 10),
        const Candle(
            timestamp: 2, open: 1, high: 3, low: 1, close: 2, volume: 20),
      ]);

      final bytes = series.toBinary();
      final reconstructed = Series.fromBinary(bytes);

      expect(reconstructed.length, series.length);
      expect(reconstructed.timestamps, series.timestamps);
      expect(reconstructed.open, series.open);
    });

    test('ChartFrame binary round-trip', () {
      final series = Series.fromCandles([
        const Candle(
            timestamp: 1, open: 1, high: 2, low: 0, close: 1, volume: 10),
      ]);
      final frame = ChartFrame(
        series: series,
        indicators: {},
        viewport: const Viewport(startIdx: 0, endIdx: 0, scale: 1.0, scrollX: 0.0),
        overlays: [],
        sequenceNumber: 42,
        panelSequenceNumbers: {'main': 42},
      );

      final bytes = frame.toBinary();
      final reconstructed = ChartFrame.fromBinary(bytes);

      expect(reconstructed.sequenceNumber, frame.sequenceNumber);
      expect(reconstructed.series.length, frame.series.length);
      expect(reconstructed.viewport.startIdx, frame.viewport.startIdx);
    });
  });
}
