## [0.1.0-dev.1]

- Added `KChartController` to manage chart state.
- Implemented `KChart` widget for high-performance rendering.
- Added `MainPanelPainter` using `canvas.drawVertices` with `VertexMode.triangles` for optimized candle rendering.
- Implemented O(log N) binary search for visible range determination.
- Verified 100,000 candles rendering performance with golden tests.
