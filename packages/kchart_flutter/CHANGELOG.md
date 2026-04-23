## [Unreleased]

- Implemented `PaintPool` to reuse `Paint` objects and reduce GC pressure.
- Implemented `LayerCache` using `ui.Picture` to cache static components like grid and candle history.
- Added grid rendering to `MainPanelPainter`.
- Optimized `KChart` widget to manage the lifecycle of pools and caches.
- Implemented `PanelStack` and `DraggableDivider` architecture for vertical chart stacking.
- Added granular repaint isolation using `RepaintBoundary` and `panelSequenceNumbers`.

## [0.1.0-dev.1]

- Added `KChartController` to manage chart state.
- Implemented `KChart` widget for high-performance rendering.
- Added `MainPanelPainter` using `canvas.drawVertices` with `VertexMode.triangles` for optimized candle rendering.
- Implemented O(log N) binary search for visible range determination.
- Verified 100,000 candles rendering performance with golden tests.
