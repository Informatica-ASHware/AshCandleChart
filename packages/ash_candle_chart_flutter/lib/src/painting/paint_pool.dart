import 'dart:ui';

/// A pool of [Paint] objects to reduce GC pressure.
///
/// Reusing [Paint] objects avoids frequent allocations and helps maintain
/// a stable memory profile during high-frequency rendering (e.g., scrolling).
class PaintPool {
  final List<Paint> _pool = [];
  int _inUseCount = 0;

  /// Borrows a [Paint] object from the pool.
  ///
  /// The returned [Paint] object should be configured by the caller
  /// as it may contain properties from a previous usage.
  Paint borrow() {
    if (_inUseCount < _pool.length) {
      return _pool[_inUseCount++];
    }

    final paint = Paint();
    _pool.add(paint);
    _inUseCount++;
    return paint;
  }

  /// Releases all borrowed [Paint] objects back to the pool.
  ///
  /// This should be called at the end of each painting cycle to make
  /// the [Paint] objects available for the next frame.
  void releaseAll() {
    _inUseCount = 0;
  }

  /// The total number of [Paint] objects currently in the pool.
  int get capacity => _pool.length;
}
