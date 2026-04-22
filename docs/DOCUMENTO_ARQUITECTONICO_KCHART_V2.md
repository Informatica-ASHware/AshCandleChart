# K-Chart V2 — Documento Arquitectónico y Backlog de Épicas

> **Nombre provisional del paquete:** `kchart` (monorepo: `kchart_core` + `kchart_flutter` + adaptador opcional `kchart_riverpod`)
> **Tipo de entregable:** Librería Flutter de visualización financiera, publicable en **pub.dev**.
> **Licencia objetivo:** MIT o Apache-2.0 (a decidir).
> **Posicionamiento:** Sucesor espiritual de `k_chart` / `k_chart_plus` y análogo en Flutter de TradingView Lightweight Charts — con énfasis en extensibilidad de indicadores, paneles componibles y rendimiento a 60fps con datasets grandes.
> **Consumidores objetivo:** apps de trading retail, dashboards de análisis cuantitativo, herramientas educativas, monitores DeFi.

---

## 0. Preámbulo — Identidad del proyecto

K-Chart V2 no es "el chart de CryptBot extraído". Es un paquete **genérico** que cualquier app Flutter pueda adoptar en 5 minutos para mostrar velas, indicadores y overlays de dominio con calidad de industria. El hecho de que nació de una auditoría al motor gráfico de CryptBot es coincidencia histórica; su valor reside en ser **reutilizable, extensible y publicable**.

Tres promesas públicas que condicionan todo el diseño:

1. **60fps sostenidos** en datasets de hasta 100.000 velas en viewport virtualizado, sobre dispositivos mid-range (Snapdragon 7-gen, Apple A14).
2. **API estable** compatible con semver. Un upgrade minor no rompe consumidores.
3. **Cero opinión ideológica**: el consumidor decide su state management, su stack de testing, su esquema de build.

---

## 1. Invariantes arquitectónicas no negociables

Cualquier propuesta de diseño futura que viole alguno de estos puntos se rechaza en revisión.

### 1.1 Separación estricta compute ↔ render

El motor de cálculo de indicadores vive en **Dart puro** (`kchart_core`, sin dependencia de Flutter). Esto permite:
- Ejecutar en Isolates sin restricciones de `BuildContext`.
- Hacer benchmarks y tests numéricos sin framework gráfico.
- Reutilizar el motor para backtesting offline, server-side, CLIs.

El motor de renderizado vive en **Flutter** (`kchart_flutter`) y consume artefactos inmutables del core. Nunca accede a tipos mutables compartidos con el cálculo.

### 1.2 Inmutabilidad radical del frame

La unidad atómica de comunicación compute→render es `ChartFrame`:

```dart
@freezed
sealed class ChartFrame with _$ChartFrame {
  const factory ChartFrame({
    required Series series,                    // Float64List columnares
    required IndicatorMatrix indicators,        // Map<IndicatorId, Float64List>
    required Viewport viewport,                 // {startIdx, endIdx, scale, scrollX}
    required OverlayBundle overlays,            // markers, positions, drawings
    required int sequenceNumber,                // monotónico para identity check
  }) = _ChartFrame;
}
```

`identical(oldFrame, newFrame)` es un invariante explotado: `shouldRepaint` devuelve `false` si los frames son idénticos por referencia. Esto es la base del rendimiento.

### 1.3 Riverpod v3 — respuesta explícita

**Decisión: Riverpod 3 NO es dependencia obligatoria del núcleo público. SÍ se ofrece como adaptador opcional aparte.**

Desglose:

| Paquete | Depende de Riverpod v3? | Justificación |
|---|---|---|
| `kchart_core` | **No.** Pure Dart. | Un paquete de cálculo numérico con dependencia de state management sería absurdo. |
| `kchart_flutter` | **No.** ChangeNotifier / ValueNotifier / Stream internos. | Forzar Riverpod excluiría usuarios de BLoC, Provider, GetX, setState vanilla, signals_flutter. Un paquete de pub.dev serio se consume desde cualquier arquitectura. |
| `kchart_riverpod` (opcional, aparte) | **Sí, ^3.0.0.** | Expone `StreamProvider<ChartFrame>`, `NotifierProvider<IndicatorRegistry>`, helpers idiomáticos para apps Riverpod. |

**Dónde Riverpod 3 SÍ aporta valor si el consumidor lo usa** (y por eso justifica un adaptador):
- `StreamProvider.autoPause` (nuevo en v3): el feed de frames se pausa cuando el chart no está visible, sin código manual.
- `Ref.mounted`: evita errores de "setState después de dispose" en callbacks async de gestures.
- `TickerMode` integrado: animaciones del crosshair y fling-scroll se pausan automáticamente cuando el widget está off-screen.
- `@mutation` (experimental): modelo limpio para acciones del usuario (`addTrendLine`, `removeIndicator`) con estado loading/error.

**Dónde Riverpod 3 NO aporta valor al núcleo** y por eso queda afuera:
- El ciclo de vida del chart (attach stream → render → detach) es simple y encapsulable en un `KChartController` con `ChangeNotifier` + `Stream`. Meter providers añade indirección sin beneficio.
- El motor de indicadores es un registry plano; sobredimensionar con providers family solo complica tests.

### 1.4 Extensibilidad como ciudadana de primera clase

Todo lo que suena a "integrado en el core" — indicadores, tipos de panel, herramientas de dibujo, overlays, temas — debe tener un **contrato público extensible**. Si el consumidor quiere un indicador propietario (ej. un MACD modificado con IA), un panel custom (ej. order flow footprint), o una herramienta de dibujo exótica (ej. Elliott Waves asistido), debe poder **añadirlo sin fork**. Los built-ins son solo la implementación de referencia de sus propios contratos.

### 1.5 Testabilidad determinista

Los indicadores son funciones puras `(Series, Config) → IndicatorSeries`. Dado el mismo input, siempre el mismo output. El renderizado se testea con **golden images** (`flutter_test` + `matchesGoldenFile`). No hay "flaky tests" aceptables en un paquete de charting — la regresión visual se captura automáticamente.

---

## 2. Estructura del monorepo propuesta

```
kchart/                               (raíz gestionada con Melos)
├── melos.yaml
├── packages/
│   ├── kchart_core/                  Pure Dart
│   │   ├── lib/src/
│   │   │   ├── series/               Series, Viewport, ChartFrame
│   │   │   ├── indicators/           Indicator interface + built-ins
│   │   │   ├── compute/              IsolatePool, worker protocol
│   │   │   └── drawing_primitives/   Abstract Canvas-agnostic primitives
│   │   └── test/                     Unit + property-based tests
│   ├── kchart_flutter/               Flutter
│   │   ├── lib/src/
│   │   │   ├── widgets/              KChart, KChartController
│   │   │   ├── painting/             Painters, layer cache, shaders
│   │   │   ├── panels/               Panel system
│   │   │   ├── interaction/          Gestures, crosshair, selection
│   │   │   ├── drawing_tools/        Trend lines, Fib, rectangles, text
│   │   │   ├── overlays/             Markers, positions, events
│   │   │   └── theme/                ChartTheme, typography, palettes
│   │   └── test/                     Widget + golden tests
│   └── kchart_riverpod/              Optional adapter (Flutter + Riverpod 3)
│       └── lib/src/
│           ├── providers.dart         StreamProvider<ChartFrame>, etc.
│           └── widgets.dart           Consumer-style widgets
├── examples/
│   ├── minimal/                      10-line quickstart
│   ├── crypto_dashboard/             Full-featured showcase app
│   ├── custom_indicator/             Tutorial: write your own indicator
│   ├── custom_panel/                 Tutorial: write your own panel
│   └── backtester_visualizer/        Non-Flutter use of kchart_core
├── tools/
│   └── golden_generator/             Regenerate golden fixtures
└── doc/
    ├── architecture/                 ADRs
    ├── cookbook/                     Recipes
    └── reference/                    Dartdoc output (CI-generated)
```

---

## 3. Overview arquitectónico

### 3.1 Diagrama de capas y flujo de datos

```
┌──────────────────────────────────────────────────────────────────────┐
│                      CONSUMER APP (any Flutter app)                   │
│                                                                       │
│   Stream<Candle>  ─────────────┐                                     │
│   Stream<Trade>   ─────┐       │                                     │
│   List<Position>  ──┐  │       │                                     │
│                     ▼  ▼       ▼                                     │
│            ┌─────────────────────────────┐                           │
│            │    KChartController          │  ← public API surface    │
│            │  (vanilla Dart/Flutter,      │                           │
│            │   ChangeNotifier-based)      │                           │
│            └──────────────┬───────────────┘                           │
└───────────────────────────┼───────────────────────────────────────────┘
                            │ (inbound: candles + config)
                            ▼
┌───────────────────────────────────────────────────────────────────────┐
│                      kchart_core  (pure Dart)                         │
│                                                                       │
│   ┌─────────────────┐    ┌─────────────────────────────────────┐     │
│   │ IndicatorRegistry│───▶│ IsolatePool (1..N workers)          │     │
│   │   - built-ins   │    │   each runs IndicatorPipeline         │     │
│   │   - user-added  │    │   on Series → emits IndicatorMatrix  │     │
│   └─────────────────┘    └──────────────────┬──────────────────┘     │
│                                              │                        │
│                                              ▼                        │
│                           ┌──────────────────────────────┐           │
│                           │  ChartFrame (immutable)       │           │
│                           │  {series, indicators,          │           │
│                           │   overlays, viewport, seq#}    │           │
│                           └──────────────┬───────────────┘           │
└──────────────────────────────────────────┼───────────────────────────┘
                                           │ (via SendPort, zero-copy
                                           │  TransferableTypedData)
                                           ▼
┌───────────────────────────────────────────────────────────────────────┐
│                    kchart_flutter  (Flutter)                          │
│                                                                       │
│   ┌───────────────────────────────────────────────────────────┐      │
│   │ PanelStack   (vertical stack of panels, each a panel slot)│      │
│   │                                                            │      │
│   │   ┌──────────────────────────────────────────────────┐    │      │
│   │   │ MainPanel      (candles + price-scale MAs/BOLL)  │    │      │
│   │   │ ├── BackgroundLayer (cached grid)                │    │      │
│   │   │ ├── SeriesLayer    (candles via drawVertices)    │    │      │
│   │   │ ├── IndicatorLayer (overlay indicators)          │    │      │
│   │   │ ├── OverlayLayer   (markers, positions)          │    │      │
│   │   │ ├── DrawingLayer   (user-drawn trend lines)      │    │      │
│   │   │ └── CrosshairLayer (interactive, pointer-following)│   │      │
│   │   └──────────────────────────────────────────────────┘    │      │
│   │   ┌──────────────────────────────────────────────────┐    │      │
│   │   │ VolumePanel    (bars, MA of volume)              │    │      │
│   │   └──────────────────────────────────────────────────┘    │      │
│   │   ┌──────────────────────────────────────────────────┐    │      │
│   │   │ SecondaryPanel (MACD / RSI / KDJ ... selectable) │    │      │
│   │   └──────────────────────────────────────────────────┘    │      │
│   │   ┌──────────────────────────────────────────────────┐    │      │
│   │   │ TimeAxis       (always anchored bottom)          │    │      │
│   │   └──────────────────────────────────────────────────┘    │      │
│   └───────────────────────────────────────────────────────────┘      │
│                                                                       │
│   GestureArbiter  (pan, pinch-zoom, long-press, tap, hover, drag      │
│                    with priority rules — drawings beat pan, pinch      │
│                    beats pan, crosshair overrides all on long-press)  │
│                                                                       │
└───────────────────────────────────────────────────────────────────────┘
```

### 3.2 Principios de rendering

| Principio | Mecanismo concreto | Ganancia |
|---|---|---|
| **Virtualización del viewport** | En `paint()`, búsqueda binaria sobre `times[]` para encontrar `[startIdx, endIdx]` visibles; solo ese rango se itera. | O(log N) setup + O(visible) paint, independiente del tamaño total del dataset. |
| **Layer caching** | Grid, ejes, y las velas que quedan a la izquierda del cursor de "now" se renderizan una vez a un `Picture` mediante `PictureRecorder`. Se invalidan solo cuando cambia scroll/scale. | Evita re-dibujar contenido estático en cada tick de precio. |
| **RepaintBoundary por panel** | Cada panel (main, volume, secondary, time axis) envuelto en su propio `RepaintBoundary`. | Un cambio en el panel de volumen no repinta el panel principal. Flutter compose en GPU. |
| **drawVertices para masa** | Velas → batched `canvas.drawVertices(VertexMode.triangles, ...)` en lugar de N `drawRect`. | 10-50× más rápido para N>1000 velas. |
| **Paint pool** | `Paint` objetos pre-instanciados en el controller, reusados por cada render. | Elimina allocation pressure en hot path. |
| **shouldRepaint identity check** | `shouldRepaint(old) => !identical(old.frame, frame)`. | Salto inmediato del paint si el frame no cambió. |
| **Typed data columnar** | `Float64List` / `Int64List` para series, compartibles entre isolates vía `TransferableTypedData` sin copy. | Cache locality + zero-copy handoff. |

---

## 4. Sistema de inyección de indicadores

Esta sección responde explícitamente a la pregunta: **"¿Cómo se inyectaría el sistema de indicadores adicionales?"**.

### 4.1 Contrato público del indicador

```dart
/// En kchart_core — pure Dart.
abstract class Indicator {
  /// ID estable (ej. "macd", "my.company.custom_rsi"). Usado para
  /// persistencia, referencia en panels, resolución en el registry.
  String get id;

  /// Metadata humano-legible + hints para el renderer.
  IndicatorMetadata get metadata;

  /// Input schema. Declara qué series necesita (close, OHLC, volume,
  /// otra indicator precomputada). El engine resuelve dependencias.
  IndicatorInputSpec get inputs;

  /// Output schema. Declara qué series produce y a qué panel afín van
  /// (main overlay, secondary pane, volume pane, custom pane).
  IndicatorOutputSpec get outputs;

  /// Cálculo puro. Recibe inputs resueltos, devuelve outputs.
  /// Debe ser determinista y Isolate-safe (no captura closures de UI).
  IndicatorOutput compute(IndicatorInput input, IndicatorConfig config);

  /// Capacidad de cálculo incremental: dada la última vela nueva,
  /// actualizar solo la cola sin recomputar todo.
  /// Si null, el engine fallback a full-recompute (lento pero correcto).
  IncrementalComputation? get incremental;

  /// Renderer opcional. Si null, se usa el default renderer por
  /// output kind (line, histogram, band, area, heatmap).
  IndicatorRenderer? get customRenderer;
}
```

### 4.2 Registry y resolución

```dart
// Registro al inicializar la app.
final registry = IndicatorRegistry()
  ..register(MacdIndicator())              // built-in
  ..register(BollingerBandsIndicator())    // built-in
  ..register(MyCustomVwapIndicator());     // user-defined

// Uso en un panel:
final chart = KChartController(
  indicatorRegistry: registry,
  activePanels: [
    MainPanel(indicators: ['boll', 'ma:20', 'ma:55']),
    VolumePanel(),
    SecondaryPanel(indicators: ['macd']),
  ],
);
```

El `IndicatorRegistry` es un simple `Map<String, IndicatorFactory>` con capacidades:
- **Resolución de dependencias**: si `IndicatorA.inputs` requiere `IndicatorB`, el engine las computa en orden topológico.
- **Caching por config**: dos paneles que piden `ma:20` sobre la misma serie comparten el mismo cómputo.
- **Invalidación granular**: modificar `MACD(fast:12→8)` solo recomputa MACD, no toca BOLL.
- **Lazy loading**: indicadores no activos no consumen recursos aunque estén registrados.

### 4.3 Composición de indicadores

Un indicador compuesto es otro indicador más:

```dart
class MacdOfRsi extends Indicator {
  @override
  IndicatorInputSpec get inputs => IndicatorInputSpec(
    dependsOn: [IndicatorRef('rsi', config: {'period': 14})],
  );

  @override
  IndicatorOutput compute(IndicatorInput input, IndicatorConfig config) {
    final rsiSeries = input.getSeries('rsi');
    return _computeMacd(rsiSeries, /*...*/);
  }
}
```

El engine detecta el ciclo `macd_of_rsi → rsi → close` y computa en orden. Caché transversal garantiza que `rsi` se compute una sola vez aunque varios indicadores lo pidan.

### 4.4 Inyección vía DI del consumidor

La **inyección** no la dicta el SDK. El `KChartController` recibe el `IndicatorRegistry` por constructor. Eso es todo. El consumidor lo cablea con:

- Vanilla Dart: `final registry = IndicatorRegistry()..register(...)` en main.
- BLoC: `RepositoryProvider<IndicatorRegistry>.value(...)`.
- Provider: `Provider<IndicatorRegistry>(create: (_) => ...)`.
- Riverpod (via adapter): `final indicatorRegistryProvider = Provider((_) => IndicatorRegistry()..register(...));`.
- get_it: `GetIt.I.registerSingleton<IndicatorRegistry>(...)`.

Esta es la forma idiomática de no imponer DI.

### 4.5 Isolate safety

Los indicadores corren en el `IsolatePool`. El engine serializa `IndicatorInput` + `IndicatorConfig` (ambos `@freezed` con `toJson`/`fromJson` o `TransferableTypedData` para series grandes) y los envía al worker. El worker deserializa, instancia el `Indicator` desde el registry (que debe registrarse también en el worker al boot), computa, y retorna el `IndicatorOutput`.

**Restricción que esto impone sobre los indicadores**: no pueden capturar `BuildContext`, `Stream` vivos, sockets, archivos. Solo inputs puros. Esto no es limitación sino garantía — evita bugs terribles de estado compartido cross-isolate.

---

## 5. Panel system — "¿Podemos tener paneles con funciones cool?"

**Sí, y el sistema de paneles es uno de los diferenciadores principales del paquete.** Cada panel es una unidad composable con su propio:

- **Rango vertical** independiente (auto o manual).
- **Eje de escala** (lineal, log, percent).
- **RepaintBoundary** para repintado aislado.
- **GestureRecognizer stack** configurable.
- **Set de capas (layers)** ordenadas.
- **Metadata** para persistencia.

### 5.1 Catálogo de paneles "cool" planeados

Los siguientes paneles van **integrados** como built-ins opcionales (tree-shaken si no se usan):

| Panel | Descripción | Utilidad |
|---|---|---|
| **MainPanel (candles)** | Velas OHLC o heikin-ashi o line-chart, con overlays de MA/BOLL. | Base estándar. |
| **VolumePanel** | Histograma de volumen + MA de volumen, coloreado por dirección de la vela. | Base estándar. |
| **SecondaryPanel** | Contenedor genérico para MACD/RSI/KDJ/DMI/CCI/WR/ATR, con tabs para switchear. | Base estándar. |
| **DepthPanel** | Orderbook depth chart lateral, sincronizado con el crosshair (muestra depth al momento puntual). | Análisis microestructura. |
| **VolumeProfilePanel** | Barras horizontales de volumen por rango de precio, overlay lateral del MainPanel. | Soporte/resistencia por volumen. |
| **FootprintPanel** | Footprint chart (delta buy/sell por vela, bid vs ask). | Order flow analysis. |
| **LiquidationHeatmapPanel** | Heatmap lateral mostrando clusters de liquidación esperada a distintos precios. | DeFi / derivatives. |
| **FundingRatePanel** | Barras de funding rate histórico alineadas temporalmente. | Perpetuals. |
| **OpenInterestPanel** | Línea de OI con delta vs vela, detectando divergencias. | Derivatives. |
| **CorrelationPanel** | Muestra N símbolos normalizados sobre el mismo eje temporal. | Pair trading, beta. |
| **EventTimelinePanel** | Timeline horizontal debajo del chart con markers de eventos (news, earnings, on-chain). | Fundamental overlay. |
| **AIAnnotationsPanel** | Panel lateral donde un LLM genera comentarios contextuales ("esta vela cruza la MA20 con volumen 3σ") al seleccionar un rango. | Diferenciador 2026. |

### 5.2 Funciones transversales de paneles

Estas features aplican a cualquier panel, built-in o custom:

1. **Drag-to-resize dividers.** Barras entre paneles son arrastrables; los tamaños relativos persisten en `ChartLayoutConfig`.
2. **Crosshair sincronizado.** Un solo crosshair cruza todos los paneles verticalmente; su posición temporal se propaga a todos los paneles simultáneamente.
3. **Scroll/scale sincronizados.** El eje temporal es compartido; hacer zoom en un panel zoomea todos. Configurable para desincronizar ejes Y.
4. **Panel collapse/expand.** Click en un icono reduce el panel a una barra de 20px sin perderlo.
5. **Panel pin/unpin.** Un panel puede "flotar" sobre los demás para quedar siempre visible aunque se scrollee el stack.
6. **Panel reorder.** Drag-and-drop del header para reordenar verticalmente.
7. **Layout presets.** `LayoutPreset.dayTrader`, `.swingTrader`, `.crypto`, `.options` — presets de combinaciones de paneles guardables y compartibles.
8. **Export as PNG/SVG** de un panel individual o el layout completo.
9. **Replay mode ("time machine").** Un slider scrubea el tiempo hacia atrás; el chart se re-renderiza como si fuera "ese momento", útil para auditoría post-mortem de decisiones.
10. **Annotation persistence.** Líneas de tendencia, anotaciones de texto, rectángulos, se serializan a `AnnotationDocument` (JSON) y se rehidratan. Compartibles entre dispositivos.
11. **Magnet mode.** Las herramientas de dibujo snappean a OHLC/HL2/HLC3/OHLC4 con feedback visual.
12. **Measurement tool.** Drag desde punto A a punto B muestra distancia en $, %, pips, número de velas, duración.

### 5.3 Contrato público para paneles custom

Crear un panel custom es un ejercicio de implementar:

```dart
abstract class ChartPanel {
  String get id;
  PanelMetadata get metadata;

  /// Altura sugerida (puede ser sobrepasada por el layout engine).
  double get preferredHeight;

  /// Declara qué inputs del ChartFrame consume.
  /// El engine optimiza dependencias.
  Set<String> get indicatorDependencies;

  /// Lista ordenada de capas dentro del panel.
  List<PanelLayer> buildLayers(BuildContext context, PanelContext ctx);

  /// Handlers de gestos específicos del panel (opcional; por default
  /// hereda los del root controller).
  PanelGestureHandler? get gestureHandler;

  /// Contribuye overlays al crosshair compartido (ej. value tooltip).
  CrosshairContribution? contributeCrosshair(double x, double y, ChartFrame frame);
}
```

Un panel custom típico (ej. `OrderBookHeatmapPanel`) escribe ~200-400 líneas: una implementación de `ChartPanel`, una o dos `PanelLayer` pintando en el `Canvas`, y opcionalmente un `IndicatorRenderer` si produce datos computados. El engine hace el resto (virtualización, caching, sync crosshair).

---

## 6. Estrategia de publicación en pub.dev

Checklist y decisiones que condicionan el backlog:

- **Semver estricto, dos dígitos**. `kchart_core: 1.0.0`, `kchart_flutter: 1.0.0`, publicados en lockstep en el primer año; después versiones independientes por paquete.
- **Pub score objetivo ≥ 140/160** al primer release. Dartdoc 100%, ejemplos en `example/`, `CHANGELOG.md`, `LICENSE`, `README.md` con GIFs en acción.
- **Flutter SDK constraint**: `>=3.24.0 <4.0.0` al lanzamiento (ventana conservadora), avanzando con Flutter stable.
- **Platform support declarado**: Android, iOS, macOS, Windows, Linux, Web. Web requiere testing especial (canvas, gestures táctiles, scroll wheel).
- **Ejemplos**: un `example/` mínimo como requiere pub.dev + apps de showcase full-featured en `examples/` (fuera del package publicado; en el monorepo como demos deployables a web para que el prospecto vea antes de instalar).
- **CI**: GitHub Actions con matriz (Android, iOS, macOS, Web), golden tests, benchmark regression tracking, `pana` score check en cada PR.
- **Documentación**: sitio estático con `docusaurus` o equivalente, desplegado en GitHub Pages, con cookbook, API reference, migration guides, y un "playground" web (Flutter Web build de los ejemplos).
- **Comunidad**: repo público, issue templates, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, Discord/GitHub Discussions.
- **Patrocinio/sostenibilidad**: GitHub Sponsors button desde día 1; si se gana tracción, evaluar open-collective.

---

## 7. Backlog Nivel 1 — Épicas

Doce épicas. Cada una es un corte vertical deployable. Ordenadas por dependencia técnica.

---

### Épica 1 — Fundación del Monorepo y Primitivas de `kchart_core`

**Objetivo y alcance.** Establecer el workspace Melos con tres paquetes (`kchart_core`, `kchart_flutter`, placeholder `kchart_riverpod`), convenciones de código, lints estrictos, formatters, git hooks, CI inicial (build + test + analyze + pana). Construir el paquete `kchart_core` puro Dart con los tipos primitivos: `Candle` (OHLCV inmutable), `Series` (column-store sobre `Float64List`/`Int64List`), `Interval`, `TimeRange`, `Viewport` (startIdx/endIdx/scale/scrollX), `ChartFrame` inmutable con sequence number, y el enum `IndicatorOutputKind` (line, histogram, band, area, heatmap). Mecanismo de `TransferableTypedData` para handoff zero-copy.

**NO incluye.** Cálculo de indicadores concretos (Épica 3). Rendering (Épica 4). Widget Flutter (Épica 4).

**Argumentación.** Sin primitivas tipadas columnares, los indicadores y el renderer inventarían sus propios tipos y se perdería la ventaja de compartir buffers entre isolates. El setup de monorepo desde día 1 evita el escenario de "extraer core después" que históricamente resulta en código entrelazado imposible de separar.

**Dependencias.** Ninguna. Primera épica.

---

### Épica 2 — Isolate Pool y Runtime de Cómputo

**Objetivo y alcance.** En `kchart_core`, implementar el `IsolatePool` configurable (N workers, typical 2-4 según plataforma y CPU cores). Protocolo de mensajes `ComputeRequest` / `ComputeResponse` serializables, con identificador de correlación y soporte de cancelación (si el consumidor cambia el rango antes de que termine el cómputo, se aborta). `IndicatorPipeline` que toma un grafo de indicadores, resuelve dependencias topológicamente, y despacha trabajo entre workers balanceando carga. Caching interno por `(indicatorId, config, inputFingerprint)`. Mecanismo de **cómputo incremental**: al añadir una vela nueva al final, solo se recomputa la cola, no toda la serie. Fallback a full-recompute si el indicador no declara `IncrementalComputation`.

**NO incluye.** Indicadores concretos. Dependencia en Flutter. UI.

**Argumentación.** El cuello de botella del motor legacy auditado era ejecutar indicadores O(N·K) en el hilo UI en cada tick. Sacar esto a isolates con cómputo incremental es la diferencia entre 5fps y 60fps en datasets grandes. Construir la infraestructura antes de los indicadores fuerza a que cada indicador respete el contrato Isolate-safe desde el primer día (no puede capturar UI state porque no existe UI accesible).

**Dependencias.** Épica 1.

---

### Épica 3 — Catálogo de Indicadores Built-in

**Objetivo y alcance.** Implementar como `Indicator` (contrato ya definido en épicas 1-2) los indicadores clásicos que hacen al paquete "baterías incluidas":

- **Overlay (price scale):** SMA, EMA, WMA, Bollinger Bands, VWAP, Ichimoku Cloud, Parabolic SAR, SuperTrend, Keltner Channels, Donchian Channels.
- **Oscillators (secondary panels):** RSI, MACD, MACD(signal-line variant), Stochastic, Stochastic RSI, KDJ, CCI, Williams %R, ATR, ADX/DMI, OBV, Chaikin Money Flow, ROC, Momentum.
- **Volume-scale:** Volume bars, Volume MA, Volume Profile (side overlay).

Cada uno con: test numérico golden contra valores de referencia (TradingView o TA-Lib), soporte de `IncrementalComputation` donde sea matemáticamente posible, config inmutable, documentación inline con fórmula y parámetros.

**NO incluye.** Patrones de velas (evaluar para épica futura). Indicadores propietarios o experimentales. Renderers custom (se usan los defaults).

**Argumentación.** El diferenciador del paquete frente a "un chart library genérico" es tener este catálogo sólido y matemáticamente correcto out-of-the-box. Un consumidor que evalúa pub.dev descartará un paquete que no traiga BOLL y MACD por default, aunque el sistema de plugins permita añadirlos — la UX inicial importa.

**Dependencias.** Épicas 1, 2.

---

### Épica 4 — Engine de Renderizado y Widget Raíz

**Objetivo y alcance.** En `kchart_flutter`, el corazón visual del paquete:

- `KChart` widget stateless de consumo (`KChart(controller: controller)`).
- `KChartController` con API pública: `pushFrame(ChartFrame)`, `updateViewport(Viewport)`, `addOverlay(...)`, `removeOverlay(...)`, `dispose()`. `ChangeNotifier`-based, zero-Riverpod.
- `ChartPainter` que dibuja capas con virtualización de viewport.
- `LayerCache` que pre-renderiza grid, ejes, y bloques de velas "congeladas" (históricas) a `Picture` reusables.
- `PaintPool` con `Paint` pre-instanciados.
- Renderers default por `IndicatorOutputKind` (line, histogram, band, area).
- Uso de `drawVertices` para masa de velas; `drawPath` cacheado para indicators de línea.
- `shouldRepaint` con identity check sobre `ChartFrame.sequenceNumber`.

Benchmarks acompañantes: debe alcanzar 60fps sostenidos con 10.000 velas visibles en viewport sobre un Pixel 6 equivalente.

**NO incluye.** Panels (épica 5). Interacción (épica 6). Drawing tools (épica 7). Overlays de dominio (épica 8).

**Argumentación.** Esta es la épica técnicamente más difícil. Sin un renderer eficiente, el resto del paquete es un framework para animaciones lentas. Establecer benchmarks medibles como criterio de cierre evita la trampa de "parece rápido en mi máquina".

**Dependencias.** Épicas 1, 2, 3 (necesita algún indicador para tener qué dibujar en secundarios; en la práctica SMA y BOLL son suficientes durante desarrollo de esta épica).

---

### Épica 5 — Sistema de Paneles y Motor de Layout

**Objetivo y alcance.** Implementar el `PanelStack` vertical con:

- Interfaz pública `ChartPanel` (ya esbozada en §5.3) que cualquiera puede extender.
- Built-ins: `MainPanel`, `VolumePanel`, `SecondaryPanel`, `TimeAxisPanel`.
- Dividers arrastrables entre paneles con persistencia del tamaño.
- `RepaintBoundary` automático por panel.
- `CrosshairCoordinator` que sincroniza la posición horizontal (temporal) entre paneles.
- Scroll/scale compartidos sobre el eje X; eje Y independiente por panel (con opción de compartir).
- Colapsar/expandir paneles, reordenar por drag-and-drop del header.
- `LayoutPreset` serializable a JSON con presets named (`dayTrader`, `crypto`, etc.).

**NO incluye.** Paneles "cool" avanzados (épica 9). Drawing tools (épica 7). Interacción avanzada más allá de sync básico (épica 6).

**Argumentación.** Esta épica convierte "un chart con un panel" en "un workspace de análisis". Es lo que permite a un consumidor armar un layout complejo sin reinventar gestión de splitters, sincronización de ejes, o event dispatch entre paneles.

**Dependencias.** Épica 4.

---

### Épica 6 — Sistema de Interacción y Gestos

**Objetivo y alcance.** Arquitectura unificada de gestos con `GestureArbiter` que media entre:

- Pan horizontal (scroll temporal).
- Pinch-to-zoom (ejes X e Y independientes en desktop con Ctrl-modifier).
- Long-press → crosshair inmersivo con value readouts.
- Tap → selección de entidad (vela, marker, drawing).
- Hover (desktop/web) con tooltip contextual.
- Double-tap → fit to viewport.
- Mouse wheel (web/desktop) → zoom con punto de anclaje en el cursor.
- Trackpad gestures (macOS).
- Keyboard shortcuts opcionales (←/→ scroll, +/− zoom, Del borrar drawing seleccionado, Ctrl+Z undo).

Cada interaction emite eventos tipados que el `KChartController` expone como streams. El consumidor puede interceptar antes del handling default (ej. para lanzar bottom sheets custom on tap).

`Smooth scroll` con animaciones inerciales (fling), `scroll-to-latest` button que aparece cuando el usuario scrollea hacia atrás, snap-to-candle opcional.

**NO incluye.** Drawing tools interactivos (son gestos pero se enmarcan en su propia épica 7 por la especialización). Selección multi-elemento con rectangle marquee.

**Argumentación.** Un chart que no se deja explorar con dedos o mouse fluidamente es un chart inservible en producción. La arbitración de gestos es compleja: ¿un drag vertical es pan del panel o inicio de una línea de tendencia? La política explícita y configurable evita las peleas entre `GestureDetector` de Flutter que plagan los intentos ingenuos.

**Dependencias.** Épicas 4, 5.

---

### Épica 7 — Drawing Tools y Anotaciones

**Objetivo y alcance.** Capa de herramientas de dibujo interactivas:

- **Trend Line** (2 puntos, snappable a OHLC).
- **Horizontal / Vertical Line** (1 punto).
- **Rectangle** (2 puntos, bordes + fill configurable).
- **Fibonacci Retracement** (2 puntos, niveles configurables).
- **Fibonacci Extension / Fans / Arcs / Time Zones**.
- **Pitchfork** (3 puntos, Andrews).
- **Channel** (paralelo, 3 puntos).
- **Text annotation** (anclada a precio+tiempo).
- **Arrow / Callout**.
- **Measurement tool** (delta precio / porcentaje / tiempo / número de velas).
- **Drawing plugin contract** para que el consumidor añada herramientas custom (ej. Elliott Waves, Gann).

Cada drawing es serializable (`AnnotationDocument` JSON), se selecciona con tap, se modifica con drag de los handles, se elimina con keyboard Del o menú contextual. **Magnet mode** snappea handles al `close`/`high`/`low`/`open` de la vela más cercana con feedback visual. **Undo/redo stack** a nivel de chart con límite configurable.

**NO incluye.** Collaborative drawing (sync entre devices) — posible épica futura. Librería de patrones automáticos reconocidos por IA (out of scope inicial).

**Argumentación.** Sin drawing tools, el paquete es un "price viewer" y no un "technical analysis workspace". La serialización permite que el consumidor persista las anotaciones del usuario a su backend (Firestore, API propia) sin que el paquete dicte el storage. El plugin contract preserva el principio de extensibilidad.

**Dependencias.** Épicas 4, 5, 6.

---

### Épica 8 — Overlays de Dominio (Markers, Positions, Events)

**Objetivo y alcance.** Sistema de overlays que renderiza entidades de dominio sobre el chart, decoupled de la lógica de precio:

- **`TradeMarker`**: icono + tooltip en el tiempo exacto, con color por dirección y tamaño proporcional a quantity.
- **`PositionOverlay`**: banda horizontal entre entry y exit, con TP/SL lines extendidas hacia el futuro virtual; actualización en vivo del unrealized PnL label.
- **`SignalMarker`**: flechas ↑/↓ para señales de compra/venta con customización de shape y color.
- **`EventMarker`**: marker sobre el eje temporal para eventos externos (news, earnings, on-chain events, funding).
- **`AlertLine`**: línea horizontal de precio que dispara callback + visual feedback al ser cruzada.
- **`LiquidityZone`**: región sombreada (precio+tiempo) para zonas de interés.
- **`CustomOverlay`**: contrato público para que el consumidor añada tipos propios.

Todos los overlays consumen el mismo viewport del chart y se repintan sincronizados. Persisten posición lógica (precio+tiempo) y se mapean a pixels en render time.

**NO incluye.** Cálculo automático de TP/SL (dominio del consumidor). Gestión de alertas persistentes con notificaciones push (fuera del paquete).

**Argumentación.** El chart como visualizador puro no es interesante; lo que lo hace valioso en apps de trading es superponer el estado del sistema (mis posiciones, mis órdenes, eventos relevantes). El contrato abierto de overlays permite que cada consumidor cablee sus propios tipos de dominio sin hackear el paquete.

**Dependencias.** Épicas 4, 5, 6.

---

### Épica 9 — Cool Features: Replay, Multi-Chart, AI Annotations, Advanced Panels

**Objetivo y alcance.** Esta épica consolida las "funciones cool" diferenciadoras que mueven el paquete de "correcto" a "encantador":

1. **Time Machine / Replay Mode**: slider temporal que scrubea hacia atrás; el chart se re-renderiza "como si fuera ese momento". Útil para revisar por qué el bot abrió cierta posición, para entrenamiento de traders, para storytelling en posts. Reproduce tick-by-tick o candle-by-candle con control de velocidad.

2. **Multi-Chart Grid**: widget `KChartGrid` que renderiza múltiples charts en grid configurable (2×2, 1+3, custom), con opciones de sincronización selectiva: sync time axis Y/N, sync crosshair Y/N, sync symbol change Y/N, sync drawings Y/N. Útil para comparar correlacionados o diferentes timeframes del mismo símbolo.

3. **Correlation Overlay**: modo donde el `MainPanel` normaliza y superpone N símbolos sobre el mismo eje Y (base-100 desde un tiempo-origen), con líneas de distinto color y leyenda.

4. **AI Annotations Panel**: panel lateral que recibe un `AiAnnotationProvider` pluggable (el paquete no integra LLM; provee el contrato). Al seleccionar un rango temporal, el provider genera insights textuales contextuales; renderizados como cards con link a las velas relevantes.

5. **Advanced Cool Panels**: `VolumeProfilePanel`, `FootprintPanel`, `LiquidationHeatmapPanel`, `DepthPanel` sincronizado al crosshair (muestra orderbook al momento seleccionado), `FundingRatePanel`, `OpenInterestPanel`.

6. **Smart Zoom Presets**: chips con "1H, 4H, 1D, 1W, 1M, YTD, All" que ajustan viewport + interval automáticamente.

7. **Snapshot Export**: captura PNG/SVG/PDF del chart o de un panel específico, con opciones de resolución y watermark.

**NO incluye.** Integración con LLMs específicos (el paquete solo expone el contrato; un adapter con OpenAI o Claude es paquete aparte). Collaborative features multi-usuario.

**Argumentación.** Estas features son el "wow factor" que convierte el paquete de "uno más" a "el elegido". Time Machine es especialmente valiosa en el contexto de bots auditables. Multi-Chart habilita flujos de trading profesionales. AI Annotations es diferencial 2026. Todas son opt-in (no imponen overhead si no se usan) gracias al diseño de paneles componibles de la Épica 5.

**Dependencias.** Épicas 4, 5, 6, 7, 8.

---

### Épica 10 — Theming, Accesibilidad e Internacionalización

**Objetivo y alcance.**

- `ChartTheme` inmutable con design tokens: palette de velas (bull/bear, wick colors), background (plain o gradient), grid, ejes, tipografía, indicadores (color por defecto por indicator id), overlays, drawings.
- Integración con `Theme.of(context)` para light/dark/high-contrast automático.
- Themes predefinidos: `light`, `dark`, `darkAccentBlue`, `darkAccentGreen`, `tradingView-ish`, `minimal`, `highContrast`.
- API `ChartTheme.copyWith(...)` y merge semántico.
- **Accesibilidad**: Semantics labels en markers y values, soporte de screen readers (lee "candela de 14 de marzo, open 65000, close 65800"), navegación keyboard completa, respeto de `MediaQuery.disableAnimations`, contrast ratio AA/AAA validado.
- **Internacionalización**: números con locale (separadores de miles, decimales), fechas con locale, strings de UI extraídos a `ChartLocalizations` con fallback a inglés, soporte RTL para ejes y leyendas.

**NO incluye.** Theme editor visual (tool externa). Traducciones a idiomas específicos (el paquete provee la infraestructura; las traducciones son PRs de comunidad).

**Argumentación.** Un paquete de pub.dev que no respeta el theme de la app que lo consume es un paquete de pub.dev que no se adopta. Accesibilidad no es opcional en 2026. La i18n permite que apps en España, Brasil, Japón, etc. adopten sin fork.

**Dependencias.** Épicas 4, 5.

---

### Épica 11 — Suite de Pruebas y Performance Lab

**Objetivo y alcance.** Infraestructura de aseguramiento de calidad:

- **Unit tests** sobre `kchart_core` con cobertura >90%. Golden numerical tests de indicadores contra datasets de referencia.
- **Property-based tests** (`glados` o custom) sobre series: roundtrip serialización, invariantes de viewport (nunca startIdx > endIdx), conservación bajo merge.
- **Widget tests** sobre `kchart_flutter` con `flutter_test`.
- **Golden image tests** por cada combinación (panel × theme × data fixture). Regeneración controlada con aprobación manual. Tolerancia de difference por pixel calibrada.
- **Performance Lab**: benchmarks automatizados (`flutter_benchmark` o custom) que miden tiempo por paint, tiempo por compute, memoria, dropped frames. Resultados guardados por commit; alertas en CI si regresión > umbral.
- **Integration tests** en dispositivos (android emulator, iOS simulator, macOS, web) con `patrol` o `integration_test` de Flutter.
- **Fuzz tests** sobre el parser de `ChartFrame` (no debe crashear con inputs malformados).

**NO incluye.** Tests de rendimiento sobre hardware ajeno al CI. Load testing con datasets reales de producción (responsabilidad del consumidor).

**Argumentación.** Un chart library sin golden tests es un chart library que regresiona visualmente en cada commit. El performance lab automatizado convierte la promesa de 60fps en métrica verificable en CI, no en deseo. Sin esto, el paquete pierde credibilidad a los 3 meses de vida.

**Dependencias.** Todas las épicas anteriores. Crece incrementalmente.

---

### Épica 12 — Documentación, Ejemplos y Publicación en pub.dev

**Objetivo y alcance.**

- **Dartdoc 100%** en API pública, validado en CI.
- **README principal** con value proposition en 30 segundos, quickstart, GIF animado, matriz de features, comparación honesta con alternativas (`fl_chart`, `syncfusion_flutter_charts`, `candlesticks`).
- **READMEs por paquete** (`kchart_core`, `kchart_flutter`, `kchart_riverpod`).
- **Cookbook** con recipes: "add a custom indicator", "build a custom panel", "persist user annotations", "connect to Binance klines", "hook Riverpod providers", "customize theme", "add a drawing tool".
- **Site de documentación** estático (docusaurus/mkdocs-material) con API reference cross-linked a Dartdoc.
- **Playground web**: Flutter Web build desplegado en GitHub Pages o Vercel, mostrando los ejemplos en vivo, editable (con `flutter_dartpad` embed si posible).
- **Examples deployables**:
  - `minimal/`: 15 líneas, muestra vela + una MA.
  - `crypto_dashboard/`: showcase full-featured con todos los paneles "cool".
  - `custom_indicator/`: tutorial paso-a-paso escribiendo un indicador desde cero.
  - `custom_panel/`: tutorial escribiendo `OrderBookHeatmapPanel`.
  - `backtester_visualizer/`: uso de `kchart_core` sin Flutter (CLI).
  - `riverpod_integration/`: uso del adapter `kchart_riverpod`.
- **Pipeline de publicación**:
  - Semver estricto por paquete.
  - Changelog automático desde Conventional Commits.
  - Release protegida detrás de CI verde + tag firmado GPG.
  - `dart pub publish --dry-run` en CI bloqueante.
  - Monitoreo de `pana` score, alerta si baja de umbral.
- **`SECURITY.md`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`**, issue templates, PR templates.
- **Adapter `kchart_riverpod`** completamente implementado con `StreamProvider<ChartFrame>`, `NotifierProvider<IndicatorRegistry>`, widgets consumer, tests específicos, documentación y ejemplo.

**NO incluye.** Traducciones completas de la documentación (se acepta contribución comunitaria). Cursos en video. Libros.

**Argumentación.** Es la diferencia entre "un paquete con 12 stars en GitHub" y "un paquete adoptado por 500 apps". El trabajo técnico está inútil si el consumidor no logra adoptarlo en 15 minutos. El playground web es especialmente crítico porque permite al prospecto probar el paquete sin instalar nada.

**Dependencias.** Todas. Se ejecuta incrementalmente desde Épica 1 pero se consolida y se presiona el botón "publish" al final.

---

## 8. Resumen visual de dependencias

```
                        ┌──────────────────────────┐
                        │ Épica 1 — Monorepo + Core│
                        │            Primitives     │
                        └────────────┬─────────────┘
                                     │
                        ┌────────────┴─────────────┐
                        │ Épica 2 — Isolate Pool   │
                        │        + Compute Runtime │
                        └────────────┬─────────────┘
                                     │
                        ┌────────────┴─────────────┐
                        │ Épica 3 — Built-in       │
                        │            Indicators    │
                        └────────────┬─────────────┘
                                     │
                        ┌────────────┴─────────────┐
                        │ Épica 4 — Rendering      │
                        │          Engine + Widget │
                        └────────────┬─────────────┘
                                     │
                        ┌────────────┴─────────────┐
                        │ Épica 5 — Panel System   │
                        └────────────┬─────────────┘
                                     │
                        ┌────────────┴─────────────┐
                        │ Épica 6 — Interaction    │
                        │            & Gestures    │
                        └────────────┬─────────────┘
                                     │
           ┌─────────────┬───────────┴───────────┬─────────────┐
           ▼             ▼                       ▼             ▼
     ┌──────────┐  ┌──────────┐           ┌──────────┐   ┌──────────┐
     │ Épica 7  │  │ Épica 8  │           │ Épica 10 │   │ Épica 11 │
     │ Drawing  │  │ Domain   │           │ Theme/   │   │ Testing/ │
     │ Tools    │  │ Overlays │           │ a11y/i18n│   │ Perf Lab │
     └────┬─────┘  └────┬─────┘           └─────┬────┘   └─────┬────┘
          └────────┬────┘                       │              │
                   ▼                            │              │
             ┌─────────────┐                    │              │
             │  Épica 9    │                    │              │
             │ Cool        │                    │              │
             │ Features    │                    │              │
             └──────┬──────┘                    │              │
                    │                           │              │
                    └───────────────┬───────────┴──────────────┘
                                    ▼
                          ┌──────────────────────┐
                          │ Épica 12 — Docs +     │
                          │   Examples + Publish  │
                          └──────────────────────┘
```

---

## 9. Decisiones de diseño controversiales a resolver antes de comenzar

Estas son preguntas a debatir formalmente (posiblemente como ADRs en `doc/architecture/`) antes de arrancar la Épica 1:

1. **¿Impeller fragment shaders desde día 1?** Beneficio: blending GPU gratuito. Costo: complejidad de shaders + riesgo de issues por plataforma. Recomendación: no en v1.0; abstraer el renderer para migrar en v2.0 sin breaking change en API pública.

2. **¿Web support "first class" o "best effort"?** Flutter Web tiene limitaciones reales (canvas kit vs HTML renderer, gestures wheel). Recomendación: first class para Canvas Kit, best effort para HTML renderer.

3. **¿Soportar COIN-M candlesticks (precio en BTC en vez de USDT) con decimales extremos?** Decimal.parse vs double. Recomendación: `Price` usa `Decimal` cuando se requiera precisión > 10 decimales, con conversión a `double` solo para render.

4. **¿El registry de indicadores es global singleton o por-controller?** Recomendación: por-controller, con constructor de conveniencia `IndicatorRegistry.defaults()` que trae los built-ins.

5. **¿Drawings en JSON vs binario?** JSON gana en debuggability + compatibilidad; binario gana en size. Recomendación: JSON por default, binary adapter como plugin opcional.

6. **¿Integrar notificaciones de alertas (`AlertLine`) nativamente?** Recomendación: no; el paquete expone `Stream<AlertCrossedEvent>` y el consumidor decide qué hacer.

---

## 10. Qué pasa si todo sale bien

Al cierre de la Épica 12, el repositorio contiene:

- Tres paquetes publicados en pub.dev con pana score ≥ 140/160.
- ~25.000-35.000 líneas de código Dart productivo + ~15.000 líneas de tests.
- Una demo web en vivo, deployada y linkeada desde los READMEs, que actúa como "try-before-you-install".
- Documentación cruzada, cookbook con 15-20 recipes, y 6 ejemplos ejecutables.
- Una suite de golden tests y benchmarks que protege a los consumidores de regresiones.

El éxito del paquete no se mide en stars de GitHub sino en si, 12 meses después del primer release, existe al menos una app de trading de terceros en producción que lo adopte por sobre las alternativas. Esa es la métrica de verdad.

---

*Fin del documento.*
