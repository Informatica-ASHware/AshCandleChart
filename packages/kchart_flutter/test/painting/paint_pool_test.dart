import 'package:flutter_test/flutter_test.dart';
import 'package:kchart_flutter/src/painting/paint_pool.dart';
import 'dart:ui';

void main() {
  group('PaintPool', () {
    test('borrows new Paint objects when pool is empty', () {
      final pool = PaintPool();
      final p1 = pool.borrow();
      final p2 = pool.borrow();

      expect(p1, isA<Paint>());
      expect(p2, isA<Paint>());
      expect(p1, isNot(same(p2)));
      expect(pool.capacity, 2);
    });

    test('reuses Paint objects after releaseAll', () {
      final pool = PaintPool();
      final p1 = pool.borrow();
      final p2 = pool.borrow();

      expect(pool.capacity, 2);

      pool.releaseAll();

      final p3 = pool.borrow();
      final p4 = pool.borrow();

      expect(p3, same(p1));
      expect(p4, same(p2));
      expect(pool.capacity, 2);
    });

    test('grows when more Paint objects are needed than currently in pool', () {
      final pool = PaintPool();
      pool.borrow();
      pool.borrow();
      expect(pool.capacity, 2);

      pool.releaseAll();
      pool.borrow();
      pool.borrow();
      pool.borrow(); // Needs a new one

      expect(pool.capacity, 3);
    });
  });
}
