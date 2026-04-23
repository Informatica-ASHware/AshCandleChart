import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:kchart_core/kchart_core.dart';

void main() {
  group('Series Magnet Mode', () {
    late Series series;
    final timestamps = Int64List.fromList([1000, 2000, 3000]);
    final open = Float64List.fromList([10.0, 20.0, 30.0]);
    final high = Float64List.fromList([15.0, 25.0, 35.0]);
    final low = Float64List.fromList([5.0, 15.0, 25.0]);
    final close = Float64List.fromList([12.0, 22.0, 32.0]);
    final volume = Float64List.fromList([100, 200, 300]);

    setUp(() {
      series = Series(
        timestamps: timestamps,
        open: open,
        high: high,
        low: low,
        close: close,
        volume: volume,
      );
    });

    test('findNearestPoint snaps to closest timestamp and closest OHLC price', () {
      // Near first candle, close to 'high'
      var point = series.findNearestPoint(1100, 14.0);
      expect(point.timestamp, equals(1000));
      expect(point.price, equals(15.0)); // high[0]

      // Near first candle, close to 'low'
      point = series.findNearestPoint(900, 6.0);
      expect(point.timestamp, equals(1000));
      expect(point.price, equals(5.0)); // low[0]

      // Near second candle, close to 'open'
      point = series.findNearestPoint(1900, 19.5);
      expect(point.timestamp, equals(2000));
      expect(point.price, equals(20.0)); // open[1]

      // Near second candle, close to 'close'
      point = series.findNearestPoint(2100, 22.5);
      expect(point.timestamp, equals(2000));
      expect(point.price, equals(22.0)); // close[1]
    });

    test('findNearestPoint handles out of range timestamps', () {
      // Way before first candle
      var point = series.findNearestPoint(0, 50.0);
      expect(point.timestamp, equals(1000));
      expect(point.price, equals(15.0)); // closest to 50 is high[0]=15

      // Way after last candle
      point = series.findNearestPoint(10000, 10.0);
      expect(point.timestamp, equals(3000));
      expect(point.price, equals(25.0)); // closest to 10 is low[2]=25
    });
  });

  group('Annotation JSON Serialization', () {
    test('TrendLine round-trips through JSON', () {
      const trendLine = Annotation.trendLine(
        id: '1',
        start: AnnotationPoint(timestamp: 1000, price: 10.0),
        end: AnnotationPoint(timestamp: 2000, price: 20.0),
        color: 0xFFFF0000,
        strokeWidth: 3.0,
      );

      final json = trendLine.toJson();
      final fromJson = Annotation.fromJson(json);

      expect(fromJson, equals(trendLine));
      expect(json['id'], equals('1'));
      expect(json['start']['timestamp'], equals(1000));
    });

    test('AnnotationDocument round-trips through JSON', () {
      final doc = AnnotationDocument(
        annotations: [
          const Annotation.trendLine(
            id: '1',
            start: AnnotationPoint(timestamp: 1000, price: 10.0),
            end: AnnotationPoint(timestamp: 2000, price: 20.0),
          ),
        ],
      );

      final json = doc.toJson();
      final fromJson = AnnotationDocument.fromJson(json);

      expect(fromJson, equals(doc));
      expect(json['annotations'], isList);
      expect(json['annotations'].length, equals(1));
    });
  });
}
