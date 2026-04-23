import 'package:kchart_core/kchart_core.dart';
import 'package:test/test.dart';

void main() {
  group('TradeOverlay', () {
    test('TradeMarker manual Map round-trip', () {
      final marker = TradeOverlay.marker(
        id: 't1',
        point: const AnnotationPoint(timestamp: 1000, price: 50000.0),
        color: 0xFF4CAF50,
        size: 10.0,
        label: 'Buy',
      );

      // We test the manual Map conversion we implemented in TradeOverlay
      final map = marker.toJson();
      expect(map['type'], 'marker');
      expect(map['id'], 't1');
      expect(map['label'], 'Buy');

      final fromMap = TradeOverlay.fromJson(map);
      expect(fromMap, isA<TradeMarker>());
      final decoded = fromMap as TradeMarker;
      expect(decoded.id, 't1');
      expect(decoded.point.timestamp, 1000);
      expect(decoded.point.price, 50000.0);
    });

    test('PositionOverlay manual Map round-trip', () {
      final position = TradeOverlay.position(
        id: 'p1',
        entryPrice: 50000.0,
        takeProfit: 55000.0,
        stopLoss: 48000.0,
      );

      final map = position.toJson();
      expect(map['type'], 'position');
      expect(map['entryPrice'], 50000.0);
      expect(map['takeProfit'], 55000.0);

      final fromMap = TradeOverlay.fromJson(map);
      expect(fromMap, isA<PositionOverlay>());
      final decoded = fromMap as PositionOverlay;
      expect(decoded.entryPrice, 50000.0);
      expect(decoded.takeProfit, 55000.0);
      expect(decoded.stopLoss, 48000.0);
    });

    test('TradeOverlayDocument manual Map round-trip', () {
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

      final map = doc.toJson();
      expect(map['overlays'], hasLength(2));

      final fromMap = TradeOverlayDocument.fromJson(map);
      expect(fromMap.overlays, hasLength(2));
      expect(fromMap.overlays[0], isA<TradeMarker>());
      expect(fromMap.overlays[1], isA<PositionOverlay>());
    });
  });
}
