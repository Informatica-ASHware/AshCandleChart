import 'dart:ui' as ui;
import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_flutter/src/painting/layer_cache.dart';

void main() {
  group('LayerCache', () {
    test('initially has no picture', () {
      final cache = LayerCache();
      expect(cache.picture, isNull);
    });

    test('updates cache when key changes', () {
      final cache = LayerCache();
      int paintCount = 0;
      const size = ui.Size(100, 100);

      cache.updateIfNeeded(
        cacheKey: 'key1',
        size: size,
        paint: (canvas) => paintCount++,
      );

      expect(paintCount, 1);
      expect(cache.picture, isNotNull);
      final firstPicture = cache.picture;

      cache.updateIfNeeded(
        cacheKey: 'key2',
        size: size,
        paint: (canvas) => paintCount++,
      );

      expect(paintCount, 2);
      expect(cache.picture, isNot(same(firstPicture)));
    });

    test('does not update cache when key is the same', () {
      final cache = LayerCache();
      int paintCount = 0;
      const size = ui.Size(100, 100);

      cache.updateIfNeeded(
        cacheKey: 'key1',
        size: size,
        paint: (canvas) => paintCount++,
      );

      expect(paintCount, 1);
      final firstPicture = cache.picture;

      cache.updateIfNeeded(
        cacheKey: 'key1',
        size: size,
        paint: (canvas) => paintCount++,
      );

      expect(paintCount, 1);
      expect(cache.picture, same(firstPicture));
    });

    test('dispose clears picture', () {
      final cache = LayerCache();
      cache.updateIfNeeded(
        cacheKey: 'key1',
        size: const ui.Size(100, 100),
        paint: (canvas) {},
      );

      expect(cache.picture, isNotNull);
      cache.dispose();
      expect(cache.picture, isNull);
    });
  });
}
