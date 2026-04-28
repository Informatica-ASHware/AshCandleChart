import 'dart:ui' as ui;

/// A cache for rendering results using [ui.Picture].
///
/// This class helps optimize performance by recording expensive drawing
/// commands once and replaying them in subsequent frames as long as the
/// cache key remains the same.
class LayerCache {
  ui.Picture? _picture;
  Object? _cacheKey;

  /// The cached [ui.Picture], if any.
  ui.Picture? get picture => _picture;

  /// Updates the cache if the [cacheKey] has changed or if the cache is empty.
  ///
  /// [size] defines the bounds of the recording.
  /// [paint] is the function that performs the actual drawing commands.
  void updateIfNeeded({
    required Object cacheKey,
    required ui.Size size,
    required void Function(ui.Canvas canvas) paint,
  }) {
    if (_cacheKey == cacheKey && _picture != null) {
      return;
    }

    _picture?.dispose();
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(
      recorder,
      ui.Rect.fromLTWH(0, 0, size.width, size.height),
    );

    paint(canvas);

    _picture = recorder.endRecording();
    _cacheKey = cacheKey;
  }

  /// Disposes of the cached [ui.Picture].
  void dispose() {
    _picture?.dispose();
    _picture = null;
    _cacheKey = null;
  }
}
