## [Unreleased]

- Implemented `PaintPool` to reuse `Paint` objects and reduce GC pressure.
- Implemented `LayerCache` using `ui.Picture` to cache static components like grid and candle history.
- Added grid rendering to `MainPanelPainter`.
- Optimized `KChart` widget to manage the lifecycle of pools and caches.
- Implemented `PanelStack` and `DraggableDivider` architecture for vertical chart stacking.
- Added granular repaint isolation using `RepaintBoundary` and `panelSequenceNumbers`.
- Implemented `GestureArbiter` using raw `PointerEvent`s to handle Pan, Zoom, and Long Press gestures without `GestureDetector`.
- Added support for Trackpad gestures and Mouse scroll wheel for chart navigation.
- Replaced `GestureDetector` in `DraggableDivider` with raw pointer handling for panel resizing.
- Implemented synchronized crosshair across all panels using `CrosshairCoordinator`.
- Optimized crosshair rendering to avoid invalidating the underlying candle layer.
- Implemented inertial fling (fling) using `FrictionSimulation`.
- Added Snap-to-Candle functionality to ensure the chart always aligns with candle boundaries when movement ends.
- [US 7.02] Implementation of Domain Overlays (Trades and Positions).
    - Added `TradeOverlayPainter` using `canvas.drawVertices` for high-performance zone rendering.
    - Integrated trade overlays into `MainPanelPainter` with logical price/time anchoring.
    - Added overlay management methods to `KChartController`.
- [US 8.01] Implementation of Theming and i18n system.
    - Introduced `ChartTheme` for light/dark modes and custom visual configuration.
    - Added `ChartNumberFormatters` for locale-aware price and volume formatting.
    - Injected theme and formatters via `KChartScope` (InheritedWidget).
    - Updated all painters and UI components to respect the current theme.
    - Added comprehensive Golden tests for Light and Dark themes.

## [0.1.0-dev.1]

- Added `KChartController` to manage chart state.
- Implemented `KChart` widget for high-performance rendering.
- Added `MainPanelPainter` using `canvas.drawVertices` with `VertexMode.triangles` for optimized candle rendering.
- Implemented O(log N) binary search for visible range determination.
- Verified 100,000 candles rendering performance with golden tests.
