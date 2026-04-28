Este es el **Backlog de Producto detallado en Sprints**, diseñado específicamente para ser consumido por un **Agente de Desarrollo IA**.

Las historias están redactadas con rigor técnico algorítmico, rutas de archivos explícitas, y precondiciones inyectadas basadas en el análisis de riesgos previo (eliminación de `Decimal`, uso de Punteros Crudos para gestos, Mock Render temprano, y orquestación inteligente de Isolates).

---

# 🤖 INSTRUCCIONES GLOBALES PARA EL AGENTE IA (Definition of Done)

Para **CADA** Historia de Usuario (US) generada mediante PR, el Agente IA debe cumplir estrictamente este `Definition of Done` (DoD). Si falta un punto, el PR será rechazado.

1.  **Código Limpio:** Cero advertencias del linter (basado en `flutter_lints` y custom rules).
2.  **Testing Obligatorio:** Unit tests para lógica pura; Golden tests para UI. Cobertura de la US > 90%.
3.  **Documentación:** Todo método/clase pública debe tener `/// Dartdoc`.
4.  **Inmutabilidad:** Uso de `@freezed` o `final` con `copyWith`. Cero estado mutable compartido.
5.  **Performance:** Uso estricto de `double` (IEEE 754), nunca `Decimal`. Colecciones numéricas deben ser `Float64List` / `Int64List`.
6.  **ChangeLog:** Actualizar `CHANGELOG.md` en el paquete correspondiente bajo la cabecera `## [Unreleased]`.
7.  **Platform Target (Native-First):** Las implementaciones UI y el rendimiento del motor de cálculo asumen como objetivo principal **Desktop (MacOS primero)** y **Mobile (Android/iOS)** renderizando sobre Impeller/Skia. El código debe exprimir las capacidades de multihilo nativo (Isolates reales) y eventos de puntero de hardware (trackpad/touch). El soporte Web queda relegado para el futuro y ninguna limitación de la web (como la emulación de hilos) debe condicionar la arquitectura del componente.

---

# 🏃 SPRINT 1: Fundación, CI y Primitivas (ash_candle_chart_core)
**Objetivo:** Establecer el monorepo y las estructuras de datos columnares y zero-copy.

### US 1.01: Setup del Monorepo Melos y CI/CD Pipeline
*   **Contexto:** Preparar la infraestructura base para los paquetes e integrarla con GitHub Actions.
*   **Especificación Técnica:**
    *   Crear `melos.yaml` en la raíz. Definir scripts para `format`, `analyze`, `test` y `pana`.
    *   Crear directorios: `packages/ash_candle_chart_core`, `packages/ash_candle_chart_flutter`, `packages/ash_candle_chart_state`.
    *   Crear archivos `pubspec.yaml` iniciales. Restricción SDK: `>=3.24.0 <4.0.0`.
    *   Crear `.github/workflows/ci.yml` ejecutando los scripts de melos en matrices (Ubuntu/Mac/Windows).
*   **Criterios de Aceptación:**
    *   [ ] `melos bootstrap` funciona sin errores.
    *   [ ] CI pasa en GitHub Actions.
    *   [ ] CHANGELOG.md creado en todos los paquetes.

### US 1.02: Modelos Primitivos Inmutables y Estructuras Columnares
*   **Contexto:** Definir cómo viajan los datos. Evitar listas de objetos pesados; usar arrays contiguos en memoria.
*   **Especificación Técnica (`ash_candle_chart_core/lib/src/series/`):**
    *   Implementar `Candle` (timestamp, open, high, low, close, volume). Todos `double` excepto timestamp (`int` ms).
    *   Implementar `Series`: Un wrapper inmutable alrededor de 6 `Float64List` (y 1 `Int64List` para tiempo). Incluir fábrica estática `Series.fromCandles(List<Candle>)`.
    *   Implementar `Viewport`: `int startIdx`, `int endIdx`, `double scale`, `double scrollX`.
    *   Implementar `ChartFrame`: `@freezed` (Series, map de indicators, Viewport, overlays, `int sequenceNumber`).
*   **Criterios de Aceptación:**
    *   [ ] Tests unitarios demostrando la conversión O(N) de `List<Candle>` a `Series` columnar.
    *   [ ] Dartdoc explica la ventaja de caché del CPU.
    *   [ ] `CHANGELOG.md` actualizado.

---

# 🏃 SPRINT 2: Motor de Cómputo Isolate & Batching (ash_candle_chart_core)
**Objetivo:** Ejecutar cálculos en background sin trabar la UI, mitigando el overhead del IPC (Inter-Process Communication).

### US 2.01: IsolatePool y Protocolo de Transferencia Zero-Copy
*   **Contexto:** Infraestructura para enviar data columnar entre aislamientos.
*   **Especificación Técnica (`ash_candle_chart_core/lib/src/compute/`):**
    *   Implementar `IsolatePool` (por defecto `Platform.numberOfProcessors - 1`, min 1, max 4).
    *   Implementar payload de envío usando `TransferableTypedData` para evitar que Dart copie los arrays de 100k velas RAM-to-RAM.
    *   Protocolo request/response con correlación por `requestId`.
*   **Criterios de Aceptación:**
    *   [ ] Unit test enviando 500,000 floats de ida y vuelta al isolate; verificar que el main thread no dropea frames.
    *   [ ] Soporte explícito de cancelación por `requestId`.

### US 2.02: Grafo de Dependencias de Indicadores (DAG) y Batching
*   **Contexto:** Resolver qué indicador corre primero e instruir al worker.
*   **Especificación Técnica:**
    *   Implementar interface abstracta `Indicator`.
    *   Implementar `IndicatorRegistry` y `IndicatorPipeline`.
    *   *Implementación de Mitigación de Riesgo:* El pipeline debe analizar el DAG. Si "MACD" depende de "EMA", el pipeline DEBE empaquetar ambas tareas en el *mismo* Isolate worker request, para no pagar el costo de IPC de devolver EMA al hilo principal solo para enviarlo de vuelta al Isolate del MACD.
*   **Criterios de Aceptación:**
    *   [ ] Test de resolución topológica (Topological Sort).
    *   [ ] Test verificando que nodos acoplados se ejecutan en batch en el mismo worker.

---

# 🏃 SPRINT 3: Validación Visual Temprana y Perf Lab (ash_candle_chart_flutter)
**Objetivo:** Probar el cuello de botella visual antes de codificar la matemática final. Mitigación de riesgos arquitectónicos.

### US 3.01: KChart Render Mock y prueba de drawVertices
*   **Contexto:** Validar que Flutter puede pintar 100,000 velas en 60fps usando primitivas de bajo nivel.
*   **Especificación Técnica (`ash_candle_chart_flutter/lib/src/painting/`):**
    *   Crear `KChartController` (ChangeNotifier).
    *   Implementar `KChart` (Widget).
    *   Implementar `MainPanelPainter`. Usar `canvas.drawVertices` con `VertexMode.triangles` para crear los quads de las velas directamente sobre el GPU. **NO USAR** `canvas.drawRect` en bucle.
    *   Renderizar leyendo del `ChartFrame.series` columnar (mockeado). Búsqueda binaria O(log N) para renderizar solo lo visible del `Viewport`.
*   **Criterios de Aceptación:**
    *   [ ] Renderiza velas simuladas en pantalla.
    *   [ ] El método `shouldRepaint` evalúa rigurosamente el `sequenceNumber`.

### US 3.02: Performance Lab y Golden Tests Base
*   **Contexto:** Asegurar el pipeline de CI contra regresiones de rendimiento visual.
*   **Especificación Técnica (`ash_candle_chart_flutter/test/` y `tools/`):**
    *   Generar un fixture JSON determinista de 50k velas de ejemplo.
    *   Crear Golden Test con `matchesGoldenFile`.
    *   Crear script de benchmark (`flutter drive` o custom test) que haga scroll programático de lado a lado y registre tiempos promedios del `paint()`.
*   **Criterios de Aceptación:**
    *   [ ] Golden files commiteados en el repo.
    *   [ ] Benchmark corre en CI y falla si el `paint()` toma > 16ms.

---

# 🏃 SPRINT 4: Indicadores Base y Renderer Real Completo
**Objetivo:** Baterías incluidas de matemática financiera y pintura cacheada.

### US 4.01: Catálogo Base de Indicadores (Full double)
*   **Contexto:** Implementar la lógica matemática estricta para indicadores universales.
*   **Especificación Técnica (`ash_candle_chart_core/lib/src/indicators/built_ins/`):**
    *   Implementar: SMA, EMA, MACD, Bollinger Bands, RSI.
    *   *Regla estricta:* Toda matemática se hace en `double`. Cero `Decimal`.
    *   Implementar cómputo incremental: método `computeAppend` que solo toma la última vela para actualizar la última posición de salida, evitando el O(N).
*   **Criterios de Aceptación:**
    *   [ ] Output validado bit-a-bit (con tolerancia epsilon flotante) contra valores exportados de TradingView o TA-Lib.

### US 4.02: LayerCache y Paint Pool
*   **Contexto:** Optimizar basura de recolección (GC) y re-renderizado estático.
*   **Especificación Técnica (`ash_candle_chart_flutter/lib/src/painting/`):**
    *   Implementar `LayerCache` usando `PictureRecorder`. Todo lo que está fuera de la vela actual (histórico) y los grids de fondo, se graban en un `ui.Picture` estático.
    *   Implementar `PaintPool` para reusar objetos `Paint` y evitar instanciación masiva por frame.
*   **Criterios de Aceptación:**
    *   [ ] Profiler no debe mostrar *memory allocations* significativas de objetos UI en `paint()` continuo.

---

# 🏃 SPRINT 5: Sistema de Paneles Componibles
**Objetivo:** Partir el canvas gigante en zonas lógicas e independientes.

### US 5.01: Arquitectura de PanelStack y Divisores
*   **Contexto:** Soporte para múltiples gráficos apilados (Velas arriba, Volumen medio, RSI abajo).
*   **Especificación Técnica (`ash_candle_chart_flutter/lib/src/panels/`):**
    *   Implementar `PanelStack` y protocolo `ChartPanel`.
    *   Construir Widgets separadores (`DraggableDivider`) para modificar alturas.
    *   Cada Panel debe envolverse automáticamente en un `RepaintBoundary`.
*   **Criterios de Aceptación:**
    *   [ ] El resize de un panel actualiza el layout persistente pero no recomputa datos algorítmicos.
    *   [ ] Cambio en RSI (volumen inferior) no repinta velasarriba (verificable vía DevTools).

### US 5.02: Crosshair Sincronizado
*   **Contexto:** La línea de tracking del mouse/dedo debe cruzar todos los paneles.
*   **Especificación Técnica:**
    *   Implementar `CrosshairCoordinator` a nivel de `KChartController`.
    *   El crosshair inyecta su estado al top layer de TODOS los paneles simultáneamente vía `ValueNotifier<CrosshairState>`.
*   **Criterios de Aceptación:**
    *   [ ] Dibujar crosshair no invalida el render de las velas subyacentes.

---

# 🏃 SPRINT 6: Máquina de Gestos Raw Pointers
**Objetivo:** Interacción fluida multi-touch sin los fallos típicos del `GestureDetector` de Flutter.

### US 6.01: Arbitro de Gestos con Raw Pointer Events
*   **Contexto:** Mitigar competencia entre paneo, zoom, y toques de dibujos.
*   **Especificación Técnica (`ash_candle_chart_flutter/lib/src/interaction/`):**
    *   **NO** usar `GestureDetector`.
    *   Implementar `GestureArbiter` usando el widget `Listener` para capturar `PointerDownEvent`, `PointerMoveEvent`, `PointerUpEvent`, `PointerCancelEvent`.
    *   Construir máquina de estados manual: Paneo (1 dedo), Zoom (2 dedos), Crosshair (1 dedo presionado > 300ms), Click/Tap.
*   **Criterios de Aceptación:**
    *   [ ] Transición fluida de paneo a zoom sin saltos bruscos.
    *   [ ] Soporte nativo de `PointerSignalEvent` para scrollwheel de mouse (zoom).

### US 6.02: Fling y Snap-to-Candle
*   **Contexto:** Paneo inercial.
*   **Especificación Técnica:**
    *   Usar `AnimationController` acoplado al `GestureArbiter` para calcular la desaceleración usando físicas de simulación (`FrictionSimulation`).
*   **Criterios de Aceptación:**
    *   [ ] Soltar el dedo a velocidad causa scroll inercial hasta detenerse suavemente.

---

# 🏃 SPRINT 7: Herramientas de Dibujo y Dominio
**Objetivo:** Anotaciones persistentes y capas de dominio del negocio.

### US 7.01: Abstracciones de Drawing y Líneas de Tendencia
*   **Contexto:** Permitir al usuario rayar el gráfico y guardarlo.
*   **Especificación Técnica (`ash_candle_chart_flutter/lib/src/drawing_tools/`):**
    *   Definir serialización JSON (in/out).
    *   Implementar clase base interactiva. Los endpoints de las líneas (`handles`) deben tener áreas de impacto expandidas (hitboxes grandes) para touch.
    *   Implementar `TrendLine`. Funcionalidad de *Magnet Mode*: Si el handle está a < N pixeles lógicos de una vela, se acopla a su Close o High.
*   **Criterios de Aceptación:**
    *   [ ] Una línea creada puede ser arrastrada por sus extremos o desde el centro.
    *   [ ] Parseo y volcado a JSON de `AnnotationDocument` íntegro y sin pérdida de precisión.

### US 7.02: Overlays de Dominio (Trades y Posiciones)
*   **Contexto:** Mostrar entradas, stop losses y take profits.
*   **Especificación Técnica (`ash_candle_chart_flutter/lib/src/overlays/`):**
    *   Implementar `TradeMarker` (Point en Time X, Price Y).
    *   Implementar `PositionOverlay` (Zona de rango Y con línea extendida al infinito en X).
*   **Criterios de Aceptación:**
    *   [ ] Overlays se mantienen anclados al precio/tiempo lógico independientemente del zoom/scroll temporal.

---

# 🏃 SPRINT 8: Ecosistema y Preparación de Publicación
**Objetivo:** Calidad de producto final, themes, riverpod y documentación para `pub.dev`.

### US 8.01: Sistema de Theming e i18n
*   **Contexto:** Inserción limpia en cualquier aplicación Flutter.
*   **Especificación Técnica:**
    *   `ChartTheme` implementado. Variables para colores de velas alcistas/bajistas, textos, grids.
    *   Formateadores numéricos dependientes de `Locale` inyectado.
*   **Criterios de Aceptación:**
    *   [ ] Golden tests cubriendo al menos `lightTheme` y `darkTheme`.

### US 8.02: Adaptador Riverpod 3 (ash_candle_chart_state)
*   **Contexto:** Exponer adaptadores idiomáticos sin contaminar el core.
*   **Especificación Técnica (`packages/ash_candle_chart_state/`):**
    *   Dependencia explícita: `riverpod: ^3.0.0` y `flutter_riverpod: ^3.0.0`.
    *   Exponer `kchartFrameProvider` basado en `StreamProvider`.
    *   Uso de `.autoPause` de Riverpod 3.
*   **Criterios de Aceptación:**
    *   [ ] Paquete independiente analizable sin errores.
    *   [ ] Ejemplo con `Ref.watch`.

### US 8.03: Documentación y Ejemplo Definitivo
*   **Contexto:** Alcanzar los 140 puntos en `pub.dev` y habilitar adopción comunitaria.
*   **Especificación Técnica:**
    *   100% comentarios Dartdoc públicos.
    *   Proyecto `example/` mínimo.
    *   Proyecto en raíz `examples/crypto_dashboard/` complejo.
    *   README.md con GIFs integrados y guía de inicio de 3 minutos.
*   **Criterios de Aceptación:**
    *   [ ] Ejecutar script de validación local: `pana --no-warning` devuelve puntuación máxima.
    *   [ ] La app de ejemplo compila para Web (Wasm) sin errores en consola gráfica.

---

### MODO DE OPERACIÓN DEL AGENTE IA:
1. **Sincronización y Branching:** Iniciar siempre desde el HEAD actualizado de la rama `main`. Crear una rama de trabajo siguiendo estrictamente la convención `feature/US-X.XX-nombre-corto`.
2. **Ciclo de Código:** Escribir los tests. Escribir la implementación. Ejecutar comandos de validación locales (`dart format .` y `dart analyze fatal-infos`).
3. **Registro de Cambios:** Actualizar el archivo `CHANGELOG.md` del paquete correspondiente, documentando los cambios bajo la etiqueta `## [Unreleased]`.
4. **Creación Estricta del Pull Request:** Hacer commit usando *Conventional Commits* (ej. `feat(core): US 1.01 setup inicial`). Hacer push al origen remoto y abrir un PR hacia la rama `main`. El cuerpo del PR **debe** contener obligatoriamente:
    - Referencia explícita a la Historia de Usuario (ej. "Ejecución de la US 1.01").
    - Un listado tipo *checkbox* del `Definition of Done` (DoD) marcado como completado.
    - Un breve resumen técnico (3-4 viñetas) explicando las decisiones algorítmicas o estructuras de datos utilizadas.
5. **Halt (Detención):** Una vez abierto el PR en GitHub, el Agente IA da por concluida su tarea para esa iteración y se detiene. Queda a la espera de recibir tu próxima instrucción para iniciar la siguiente US (una vez tú hayas revisado, delegado al CI/CD y fusionado el código).
