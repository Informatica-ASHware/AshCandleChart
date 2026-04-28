#!/bin/bash
# =============================================================================
# K-Chart V2 — Generador de Issues para Agente IA (Fase 2: Cool Features)
# =============================================================================
# Compatibilidad: macOS / Linux
# Requisito: gh (GitHub CLI) instalado y autenticado (`gh auth login`)
# Uso: chmod +x create_kchart_cool_features.sh && ./create_kchart_cool_features.sh
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# CONFIGURACIÓN — Edita estas variables con tu usuario/organización y repo
# ---------------------------------------------------------------------------
OWNER="Informatica-ASHware"
REPO="AshCandleChart"
FULL_REPO="${OWNER}/${REPO}"

# Colores para output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Contadores
SUCCESS_COUNT=0
FAIL_COUNT=0

# Plantilla Global de Definition of Done (DoD) para el Agente IA
DOD_TEMPLATE="
### 🤖 Definition of Done (DoD) Obligatorio para el Agente IA
1. **Código Limpio:** Cero advertencias del linter.
2. **Testing:** Unit tests (core) o Golden tests (UI) con cobertura >90%.
3. **Documentación:** \`/// Dartdoc\` en toda API pública.
4. **Inmutabilidad:** Uso de \`@freezed\` o \`final\` con \`copyWith\`.
5. **Performance:** Uso estricto de \`double\` (IEEE 754) o Listas Tipadas. NUNCA \`Decimal\`.
6. **ChangeLog:** Actualizar \`CHANGELOG.md\` del paquete afectado.
7. **Platform Target:** Asumir Desktop (macOS) y Mobile (Android/iOS) nativo. Ninguna limitación Web debe comprometer el rendimiento de los Isolates o Punteros Crudos."

# ---------------------------------------------------------------------------
# FUNCIONES AUXILIARES
# ---------------------------------------------------------------------------

create_labels() {
    echo -e "${BLUE}[SETUP] Creando etiquetas en ${FULL_REPO}...${NC}"

    LABELS=(
        "agent-ready|0E8A16|Lista para ser procesada por el Agente IA"
        "package:core|D93F0B|Afecta al paquete ash_candle_chart_core"
        "package:flutter|FBCA04|Afecta al paquete ash_candle_chart_flutter"
        "type:infra|C5DEF5|Infraestructura, CI/CD y Monorepo"
        "sprint:9|1D76DB|Sprint 9: Cool Features y Diferenciadores"
        "sprint:10|1D76DB|Sprint 10: Calidad Enterprise y Resiliencia"
    )

    for item in "${LABELS[@]}"; do
        IFS='|' read -r label color desc <<< "$item"

        gh label create "$label" --color "$color" --description "$desc" --repo "$FULL_REPO" 2>/dev/null \
            && echo -e "  ${GREEN}✓${NC} Label: $label" \
            || echo -e "  ${YELLOW}⚠${NC} Label ya existe: $label"
    done
    echo ""
}

create_issue() {
    local title="$1"
    local body="$2"
    local labels="$3"

    local result
    if result=$(gh issue create \
        --repo "$FULL_REPO" \
        --title "$title" \
        --body "$body" \
        --label "$labels" 2>&1); then
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        echo -e "${GREEN}[SUCCESS #${SUCCESS_COUNT}]${NC} Issue creado: ${title}"
        echo -e "  ${BLUE}→ ${result}${NC}"
    else
        FAIL_COUNT=$((FAIL_COUNT + 1))
        echo -e "${RED}[FAIL]${NC} Error creando: ${title}"
        echo -e "  ${RED}${result}${NC}"
    fi

    sleep 1 # Evitar rate limit de GitHub API
}

# ---------------------------------------------------------------------------
# MAIN
# ---------------------------------------------------------------------------

echo "============================================================"
echo " K-Chart V2 — Generación de Backlog Suplementario (Fase 2)"
echo " Repo: ${FULL_REPO}"
echo "============================================================"
echo ""

if ! command -v gh &> /dev/null; then
    echo -e "${RED}[ERROR] GitHub CLI (gh) no está instalado.${NC}"
    exit 1
fi

if ! gh auth status &> /dev/null; then
    echo -e "${RED}[ERROR] GitHub CLI no está autenticado.${NC}"
    exit 1
fi

# Paso 1: Crear etiquetas
create_labels

echo -e "${BLUE}[INFO] Creando Historias de Usuario...${NC}"
echo ""

# ===========================================================================
# SPRINT 9
# ===========================================================================
echo -e "${YELLOW}━━━ SPRINT 9: Características Diferenciadoras (Cool Features) ━━━${NC}"

create_issue \
    "[US 9.01] Time Machine / Replay Mode" \
    "## Contexto
Permitir el escrutinio histórico reproduciendo la acción del precio pasada vela por vela o tick a tick, crucial para backtesting visual y auditoría de bots.

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/interaction/replay/\`)
- Implementar \`ReplayCoordinator\` que intercepte el \`Stream<ChartFrame>\` original.
- Crear un controlador UI (Slider temporal) anclado en la parte inferior del KChart.
- Estados de reproducción: Play, Pause, Scrubbing. Soporte para velocidades múltiples (1x, 2x, 10x).
- Asegurar que los recálculos de indicadores respeten el \"falso ahora\" (truncando las series en el IsolatePool).

## Criterios de Aceptación
- [ ] Mover el slider hacia la izquierda oculta visual y lógicamente todos los datos futuros sin fugas de memoria.
- [ ] Los overlays de dominio (trades) futuros no se renderizan en el modo replay.
$DOD_TEMPLATE" \
    "sprint:9,package:flutter,agent-ready"

create_issue \
    "[US 9.02] Multi-Chart Grid y Sincronización" \
    "## Contexto
Soportar flujos de trabajo de multi-timeframe o pares correlacionados en la misma vista.

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/widgets/grid/\`)
- Implementar \`KChartGrid\` configurable (ej. 2x2, 1 principal + 3 secundarios).
- Implementar \`SyncEngine\` opcional que actúe sobre múltiples \`KChartController\`.
- Configuraciones de sincronización: \`syncTimeAxis\` (el paneo/zoom X se refleja en todos los charts de la cuadrícula), \`syncCrosshair\` (mostrar la cruz en todos los gráficos exactamente en el mismo timestamp).

## Criterios de Aceptación
- [ ] El paneo horizontal (swipe) en un gráfico desencadena un repaint sincronizado a 60fps en los gráficos vinculados.
$DOD_TEMPLATE" \
    "sprint:9,package:flutter,agent-ready"

create_issue \
    "[US 9.03] Catálogo de Paneles Institucionales" \
    "## Contexto
Añadir herramientas visuales para análisis de Order Flow y liquidez.

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/panels/advanced/\`)
- Implementar \`VolumeProfilePanel\`: Histograma renderizado horizontalmente sobre el eje Y (precio), calculado a partir del rango temporal visible.
- Implementar \`DepthPanel\`: Renderizado lateral en tiempo real de un Order Book bid/ask sincronizado al crosshair.
- Implementar \`LiquidationHeatmapPanel\`: Capa densa renderizada mediante shaders (si es soportado) o gradientes escalados sobre áreas de precio para representar zonas de alta liquidación.

## Criterios de Aceptación
- [ ] El \`VolumeProfilePanel\` se actualiza dinámicamente usando O(N visible) al hacer scroll/zoom sin trabar el frame principal.
$DOD_TEMPLATE" \
    "sprint:9,package:flutter,agent-ready"

create_issue \
    "[US 9.04] AI Annotations Plugin Contract" \
    "## Contexto
Preparar el paquete para la integración de LLMs, proveyendo un espacio UI estandarizado para \"insights\".

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/panels/ai/\`)
- Implementar la interfaz abstracta \`AiAnnotationProvider\`. (El paquete *no* incluye el cliente HTTP para OpenAI/Anthropic, solo el contrato).
- Crear un panel lateral/inferior \`AiInsightsPanel\` que reaccione a la selección de rangos en el gráfico (Drag selection).
- El provider recibe el chunk columnar del rango seleccionado y retorna un listado estructurado de \`AiInsight\` (texto, tipo de patrón, severidad).

## Criterios de Aceptación
- [ ] Un provider de simulación (Mock) puede inyectar y renderizar textos contextuales al seleccionar 10 velas en el gráfico principal.
$DOD_TEMPLATE" \
    "sprint:9,package:flutter,agent-ready"

create_issue \
    "[US 9.05] Snapshot Export (PNG/SVG)" \
    "## Contexto
Funcionalidad social y de reportes; permitir al usuario guardar una captura del análisis.

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/utils/export/\`)
- Implementar método \`exportToImage()\` en \`KChartController\`.
- Usar \`RenderRepaintBoundary.toImage()\` para el layout visible.
- Implementar opciones de configuración: Marca de agua (watermark), background color (transparente u opaco), y resolución (pixel ratio).

## Criterios de Aceptación
- [ ] La función retorna un \`Uint8List\` válido representativo de la imagen que puede ser escrito al disco físico con el mismo aspecto visual que en pantalla.
$DOD_TEMPLATE" \
    "sprint:9,package:flutter,agent-ready"

# ===========================================================================
# SPRINT 10
# ===========================================================================
echo -e "${YELLOW}━━━ SPRINT 10: Calidad Enterprise, A11y y Resiliencia Estructural ━━━${NC}"

create_issue \
    "[US 10.01] Accesibilidad Nativa (a11y) y Semántica" \
    "## Contexto
Los gráficos en canvas ignoran por defecto a los lectores de pantalla. Un paquete comercial en 2026 debe cumplir normativas AA/AAA de accesibilidad.

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/accessibility/\`)
- Inyectar nodos \`Semantics\` virtuales para el gráfico.
- Al mover el crosshair o hacer tap sobre una vela, exponer un \`SemanticsEvent\` que anuncie los datos relevantes (\"14 de marzo, apertura 65000, cierre 65800, alcista\").
- Soporte completo de navegación por teclado (Flechas izq/der para mover un crosshair virtual paso a paso temporalmente).
- Respetar internamente \`MediaQuery.disableAnimations\` para animaciones inerciales.

## Criterios de Aceptación
- [ ] Un lector de pantalla nativo (VoiceOver/TalkBack) lee coherentemente los valores de la vela enfocada.
- [ ] Soporte tab-focus en los controles interactivos del chart (paneles secundarios, botones de cierre de panel).
$DOD_TEMPLATE" \
    "sprint:10,package:flutter,agent-ready"

create_issue \
    "[US 10.02] Property-based Testing y Protección Fuzzing" \
    "## Contexto
Los websockets cripto pueden enviar payloads corruptos; el parser Cero-Copia y las estructuras columnares no deben crashear el Isolate o la UI.

## Especificación Técnica (\`ash_candle_chart_core/test/resilience/\`)
- Implementar fuzz testing enviando flujos de bytes aleatorios a los reconstructores de \`ChartFrame\` y \`TransferableTypedData\`.
- Integrar pruebas basadas en propiedades (e.g. \`glados\` o equivalente). Definir invariantes como: \"Independientemente del \`scale\` o \`scrollX\` generado, \`startIdx\` siempre es <= \`endIdx\` y ambos están dentro de \`0..N\`\".

## Criterios de Aceptación
- [ ] Los tests aleatorios corren al menos 1000 iteraciones en CI sin generar excepciones no controladas o desbordes de buffer (IndexOutOfRange).
$DOD_TEMPLATE" \
    "sprint:10,package:core,agent-ready"

create_issue \
    "[US 10.03] Cross-Device Integration Tests" \
    "## Contexto
Garantizar que los gestos arbitrados por \`Listener\` funcionen consistentemente a través de motores de renderizado y hardware distinto.

## Especificación Técnica (\`ash_candle_chart_flutter/integration_test/\`)
- Usar \`integration_test\` (o \`patrol\`) para lanzar una app de prueba con la vista pre-cargada.
- Simular eventos táctiles nativos de pan (arrastre), pinch (pellizco) y long-press, verificando los cambios resultantes en el \`Viewport\`.

## Criterios de Aceptación
- [ ] Los tests de integración pasan exitosamente simulando interacciones táctiles en un entorno de integración continua (CI) para emulador de Android/iOS.
$DOD_TEMPLATE" \
    "sprint:10,package:flutter,type:infra,agent-ready"

# ===========================================================================
# RESUMEN
# ===========================================================================
echo ""
echo "============================================================"
echo -e " ${GREEN}COMPLETADO${NC}"
echo "============================================================"
echo -e " Issues creados exitosamente: ${GREEN}${SUCCESS_COUNT}${NC}"
echo -e " Issues fallidos:             ${RED}${FAIL_COUNT}${NC}"
echo "============================================================"