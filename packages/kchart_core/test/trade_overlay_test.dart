import 'package:kchart_core/kchart_core.dart';
import 'package:test/test.dart';

void main() {
  group('TradeOverlay', () {
    test('TradeMarker JSON serialization', () {
      final marker = TradeOverlay.marker(
        id: 't1',
        point: const AnnotationPoint(timestamp: 1000, price: 50000.0),
        color: 0xFF4CAF50,
        size: 10.0,
        label: 'Buy',
      );

      final json = marker.toJson();
      expect(json['type'], 'marker');
      expect(json['id'], 't1');
      expect(json['label'], 'Buy');
      // Verify point is a Map
      expect(json['point'], isA<Map<String, dynamic>>());

      final fromJson = TradeOverlay.fromJson(json);
      expect(fromJson, isA<TradeMarker>());
      final decoded = fromJson as TradeMarker;
      expect(decoded.id, 't1');
      expect(decoded.point.timestamp, 1000);
      expect(decoded.point.price, 50000.0);
    });

    test('PositionOverlay JSON serialization', () {
      final position = TradeOverlay.position(
        id: 'p1',
        entryPrice: 50000.0,
        takeProfit: 55000.0,
        stopLoss: 48000.0,
      );

      final json = position.toJson();
      expect(json['type'], 'position');
      expect(json['entryPrice'], 50000.0);
      expect(json['takeProfit'], 55000.0);

      final fromJson = TradeOverlay.fromJson(json);
      expect(fromJson, isA<PositionOverlay>());
      final decoded = fromJson as PositionOverlay;
      expect(decoded.entryPrice, 50000.0);
      expect(decoded.takeProfit, 55000.0);
      expect(decoded.stopLoss, 48000.0);
    });

    test('TradeOverlayDocument JSON serialization', () {
      final doc = TradeOverlayDocument(
        overlays: [
          TradeOverlay.marker(
            id: 't1',
            point: const AnnotationPoint(timestamp: 1000, price: 50000.0),
          ),
          TradeOverlay.position(
            id: 'p1',
            entryPrice: 50000.0,
          ),
        ],
      );

      final json = doc.toJson();
      expect(json['overlays'], hasLength(2));
      expect(json['overlays'][0], isA<Map<String, dynamic>>());

      final fromJson = TradeOverlayDocument.fromJson(json);
      expect(fromJson.overlays, hasLength(2));
      expect(fromJson.overlays[0], isA<TradeMarker>());
      expect(fromJson.overlays[1], isA<PositionOverlay>());
    });
  });
}
