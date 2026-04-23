# Backlog_Cool_Features.md

Este es el **Backlog de Producto Suplementario (Fase 2)**, diseñado específicamente para ser consumido por el **Agente de Desarrollo IA**.

Contiene las historias de usuario correspondientes a las características diferenciadoras avanzadas (Épica 9), la accesibilidad omitida previamente (Épica 10) y la resiliencia/QA avanzado (Épica 11).

---

# 🤖 INSTRUCCIONES GLOBALES PARA EL AGENTE IA (Definition of Done)

Para **CADA** Historia de Usuario (US) generada mediante PR, el Agente IA debe cumplir estrictamente este `Definition of Done` (DoD). Si falta un punto, el PR será rechazado.

1.  **Código Limpio:** Cero advertencias del linter (basado en `flutter_lints` y custom rules).
2.  **Testing Obligatorio:** Unit tests para lógica pura; Golden tests para UI. Cobertura de la US > 90%.
3.  **Documentación:** Todo método/clase pública debe tener `/// Dartdoc`.
4.  **Inmutabilidad:** Uso de `@freezed` o `final` con `copyWith`. Cero estado mutable compartido.
5.  **Performance:** Uso estricto de `double` (IEEE 754), nunca `Decimal`. Colecciones numéricas deben ser `Float64List` / `Int64List`.
6.  **ChangeLog:** Actualizar `CHANGELOG.md` en el paquete correspondiente bajo la cabecera `## [Unreleased]`.
7.  **Platform Target (Native-First):** Las implementaciones UI asumen Desktop/Mobile nativo. El uso de Isolates y rendimiento de Canvas/Skia/Impeller es prioritario.

---

# 🚀 SPRINT 9: Características Diferenciadoras "Cool" (Épica 9)
**Objetivo:** Implementar las funcionalidades avanzadas que posicionan al paquete por encima de la competencia en escenarios de trading institucional, auditoría algorítmica y análisis comparativo.

### US 9.01: Time Machine / Replay Mode
*   **Contexto:** Permitir el escrutinio histórico reproduciendo la acción del precio pasada vela por vela o tick a tick, crucial para backtesting visual y auditoría de bots.
*   **Especificación Técnica (`kchart_flutter/lib/src/interaction/replay/`):**
    *   Implementar `ReplayCoordinator` que intercepte el `Stream<ChartFrame>` original.
    *   Crear un controlador UI (Slider temporal) anclado en la parte inferior del KChart.
    *   Estados de reproducción: Play, Pause, Scrubbing. Soporte para velocidades múltiples (1x, 2x, 10x).
    *   Asegurar que los recálculos de indicadores respeten el "falso ahora" (truncando las series en el IsolatePool).
*   **Criterios de Aceptación:**
    *   [ ] Mover el slider hacia la izquierda oculta visual y lógicamente todos los datos futuros sin fugas de memoria.
    *   [ ] Los overlays de dominio (trades) futuros no se renderizan en el modo replay.

### US 9.02: Multi-Chart Grid y Sincronización
*   **Contexto:** Soportar flujos de trabajo de multi-timeframe o pares correlacionados en la misma vista.
*   **Especificación Técnica (`kchart_flutter/lib/src/widgets/grid/`):**
    *   Implementar `KChartGrid` configurable (ej. 2x2, 1 principal + 3 secundarios).
    *   Implementar `SyncEngine` opcional que actúe sobre múltiples `KChartController`.
    *   Configuraciones de sincronización: `syncTimeAxis` (el paneo/zoom X se refleja en todos los charts de la cuadrícula), `syncCrosshair` (mostrar la cruz en todos los gráficos exactamente en el mismo timestamp).
*   **Criterios de Aceptación:**
    *   [ ] El paneo horizontal (swipe) en un gráfico desencadena un repaint sincronizado a 60fps en los gráficos vinculados.

### US 9.03: Catálogo de Paneles Institucionales
*   **Contexto:** Añadir herramientas visuales para análisis de Order Flow y liquidez.
*   **Especificación Técnica (`kchart_flutter/lib/src/panels/advanced/`):**
    *   Implementar `VolumeProfilePanel`: Histograma renderizado horizontalmente sobre el eje Y (precio), calculado a partir del rango temporal visible.
    *   Implementar `DepthPanel`: Renderizado lateral en tiempo real de un Order Book bid/ask sincronizado al crosshair.
    *   Implementar `LiquidationHeatmapPanel`: Capa densa renderizada mediante shaders (si es soportado) o gradientes escalados sobre áreas de precio para representar zonas de alta liquidación.
*   **Criterios de Aceptación:**
    *   [ ] El `VolumeProfilePanel` se actualiza dinámicamente usando O(N visible) al hacer scroll/zoom sin trabar el frame principal.

### US 9.04: AI Annotations Plugin Contract
*   **Contexto:** Preparar el paquete para la integración de LLMs, proveyendo un espacio UI estandarizado para "insights".
*   **Especificación Técnica (`kchart_flutter/lib/src/panels/ai/`):**
    *   Implementar la interfaz abstracta `AiAnnotationProvider`. (El paquete *no* incluye el cliente HTTP para OpenAI/Anthropic, solo el contrato).
    *   Crear un panel lateral/inferior `AiInsightsPanel` que reaccione a la selección de rangos en el gráfico (Drag selection).
    *   El provider recibe el chunk columnar del rango seleccionado y retorna un listado estructurado de `AiInsight` (texto, tipo de patrón, severidad).
*   **Criterios de Aceptación:**
    *   [ ] Un provider de simulación (Mock) puede inyectar y renderizar textos contextuales al seleccionar 10 velas en el gráfico principal.

### US 9.05: Snapshot Export (PNG/SVG)
*   **Contexto:** Funcionalidad social y de reportes; permitir al usuario guardar una captura del análisis.
*   **Especificación Técnica (`kchart_flutter/lib/src/utils/export/`):**
    *   Implementar método `exportToImage()` en `KChartController`.
    *   Usar `RenderRepaintBoundary.toImage()` para el layout visible.
    *   Implementar opciones de configuración: Marca de agua (watermark), background color (transparente u opaco), y resolución (pixel ratio).
*   **Criterios de Aceptación:**
    *   [ ] La función retorna un `Uint8List` válido representativo de la imagen que puede ser escrito al disco físico con el mismo aspecto visual que en pantalla.

---

# 🛡️ SPRINT 10: Calidad Enterprise, A11y y Resiliencia Estructural
**Objetivo:** Cubrir el déficit técnico en materia de Accesibilidad e Internacionalización de la arquitectura base, y blindar el pipeline con pruebas de resiliencia avanzadas.

### US 10.01: Accesibilidad Nativa (a11y) y Semántica
*   **Contexto:** Los gráficos en canvas ignoran por defecto a los lectores de pantalla. Un paquete comercial en 2026 debe cumplir normativas AA/AAA de accesibilidad. (Completa el déficit de la US 8.01).
*   **Especificación Técnica (`kchart_flutter/lib/src/accessibility/`):**
    *   Inyectar nodos `Semantics` virtuales para el gráfico.
    *   Al mover el crosshair o hacer tap sobre una vela, exponer un `SemanticsEvent` que anuncie los datos relevantes ("14 de marzo, apertura 65000, cierre 65800, alcista").
    *   Soporte completo de navegación por teclado (Flechas izq/der para mover un crosshair virtual paso a paso temporalmente).
    *   Respetar internamente `MediaQuery.disableAnimations` para animaciones inerciales.
*   **Criterios de Aceptación:**
    *   [ ] Un lector de pantalla nativo (VoiceOver/TalkBack) lee coherentemente los valores de la vela enfocada.
    *   [ ] Soporte tab-focus en los controles interactivos del chart (paneles secundarios, botones de cierre de panel).

### US 10.02: Property-based Testing y Protección Fuzzing
*   **Contexto:** Los websockets cripto pueden enviar payloads corruptos; el parser Cero-Copia y las estructuras columnares no deben crashear el Isolate o la UI.
*   **Especificación Técnica (`kchart_core/test/resilience/`):**
    *   Implementar fuzz testing enviando flujos de bytes aleatorios a los reconstructores de `ChartFrame` y `TransferableTypedData`.
    *   Integrar pruebas basadas en propiedades (e.g. `glados` o equivalente). Definir invariantes como: "Independientemente del `scale` o `scrollX` generado, `startIdx` siempre es <= `endIdx` y ambos están dentro de `0..N`".
*   **Criterios de Aceptación:**
    *   [ ] Los tests aleatorios corren al menos 1000 iteraciones en CI sin generar excepciones no controladas o desbordes de buffer (IndexOutOfRange).

### US 10.03: Cross-Device Integration Tests
*   **Contexto:** Garantizar que los gestos arbitrados por `Listener` funcionen consistentemente a través de motores de renderizado y hardware distinto.
*   **Especificación Técnica (`kchart_flutter/integration_test/`):**
    *   Usar `integration_test` (o `patrol`) para lanzar una app de prueba con la vista pre-cargada.
    *   Simular eventos táctiles nativos de pan (arrastre), pinch (pellizco) y long-press, verificando los cambios resultantes en el `Viewport`.
*   **Criterios de Aceptación:**
    *   [ ] Los tests de integración pasan exitosamente simulando interacciones táctiles en un entorno de integración continua (CI) para emulador de Android/iOS.