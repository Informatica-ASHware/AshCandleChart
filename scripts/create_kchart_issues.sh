#!/bin/bash
# =============================================================================
# K-Chart V2 — Generador de Issues para Agente IA
# =============================================================================
# Compatibilidad: macOS / Linux
# Requisito: gh (GitHub CLI) instalado y autenticado (`gh auth login`)
# Uso: chmod +x create_kchart_issues.sh && ./create_kchart_issues.sh
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# CONFIGURACIÓN — Edita estas variables con tu usuario/organización y repo
# ---------------------------------------------------------------------------
ORG_NAME="Informatica-ASHware"
REPO="KChart2"
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
        "package:core|D93F0B|Afecta al paquete kchart_core"
        "package:flutter|FBCA04|Afecta al paquete kchart_flutter"
        "package:riverpod|006B75|Afecta al paquete kchart_riverpod"
        "type:infra|C5DEF5|Infraestructura, CI/CD y Monorepo"
        "sprint:1|1D76DB|Sprint 1: Fundación y Primitivas"
        "sprint:2|1D76DB|Sprint 2: IsolatePool"
        "sprint:3|1D76DB|Sprint 3: Mock Render"
        "sprint:4|1D76DB|Sprint 4: Indicadores y Renderer"
        "sprint:5|1D76DB|Sprint 5: Paneles"
        "sprint:6|1D76DB|Sprint 6: Gestos"
        "sprint:7|1D76DB|Sprint 7: Drawing"
        "sprint:8|1D76DB|Sprint 8: Publicación"
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
echo " K-Chart V2 — Generación de Backlog en GitHub"
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
# SPRINT 1
# ===========================================================================
echo -e "${YELLOW}━━━ SPRINT 1 ━━━${NC}"

create_issue \
    "[US 1.01] Setup del Monorepo Melos y CI/CD Pipeline" \
    "## Contexto
Preparar la infraestructura base para los paquetes e integrarla con GitHub Actions.

## Especificación Técnica
- Crear \`melos.yaml\` en la raíz con scripts para \`format\`, \`analyze\`, \`test\` y \`pana\`.
- Crear directorios: \`packages/kchart_core\`, \`packages/kchart_flutter\`, \`packages/kchart_riverpod\`.
- Crear archivos \`pubspec.yaml\` iniciales. Restricción SDK: \`>=3.24.0 <4.0.0\`.
- Crear \`.github/workflows/ci.yml\` ejecutando matrices de test.

## Criterios de Aceptación
- [ ] \`melos bootstrap\` funciona sin errores.
- [ ] CI pasa en GitHub Actions.
- [ ] \`CHANGELOG.md\` creado en todos los paquetes.
$DOD_TEMPLATE" \
    "sprint:1,package:core,package:flutter,package:riverpod,type:infra,agent-ready"

create_issue \
    "[US 1.02] Modelos Primitivos Inmutables y Estructuras Columnares" \
    "## Contexto
Definir cómo viajan los datos evitando instanciación de objetos masivos en memoria (usar arrays contiguos).

## Especificación Técnica (\`kchart_core/lib/src/series/\`)
- Implementar \`Candle\` (timestamp, open, high, low, close, volume). Todos \`double\` excepto timestamp (\`int\`).
- Implementar \`Series\`: Wrapper inmutable alrededor de \`Float64List\` (y \`Int64List\` para tiempo). Incluir fábrica \`Series.fromCandles(List<Candle>)\`.
- Implementar \`Viewport\`: \`int startIdx\`, \`int endIdx\`, \`double scale\`, \`double scrollX\`.
- Implementar \`ChartFrame\`: \`@freezed\` (Series, map de indicators, Viewport, overlays, \`int sequenceNumber\`).

## Criterios de Aceptación
- [ ] Tests unitarios demostrando la conversión O(N) a \`Series\` columnar.
- [ ] Dartdoc explicando la ventaja de caché del CPU.
$DOD_TEMPLATE" \
    "sprint:1,package:core,agent-ready"

# ===========================================================================
# SPRINT 2
# ===========================================================================
echo -e "${YELLOW}━━━ SPRINT 2 ━━━${NC}"

create_issue \
    "[US 2.01] IsolatePool y Protocolo de Transferencia Zero-Copy" \
    "## Contexto
Infraestructura para enviar data columnar entre aislamientos para liberar la UI.

## Especificación Técnica (\`kchart_core/lib/src/compute/\`)
- Implementar \`IsolatePool\` (por defecto \`Platform.numberOfProcessors - 1\`).
- Implementar payload de envío usando \`TransferableTypedData\` para evitar copia de memoria RAM-to-RAM.
- Protocolo request/response con correlación por \`requestId\`.

## Criterios de Aceptación
- [ ] Test enviando 500,000 floats de ida y vuelta al isolate.
- [ ] Soporte explícito de cancelación por \`requestId\`.
$DOD_TEMPLATE" \
    "sprint:2,package:core,agent-ready"

create_issue \
    "[US 2.02] Grafo de Dependencias de Indicadores (DAG) y Batching" \
    "## Contexto
Resolver qué indicador corre primero e instruir al worker sin saturar el IPC.

## Especificación Técnica
- Implementar abstract class \`Indicator\`, \`IndicatorRegistry\` e \`IndicatorPipeline\`.
- **Estrategia de Mitigación:** El pipeline debe analizar el DAG. Si \"MACD\" depende de \"EMA\", el pipeline DEBE empaquetar ambas tareas en el mismo Isolate request para no pagar el costo de IPC de devolver EMA al hilo principal.

## Criterios de Aceptación
- [ ] Test de resolución de Sort Topológico.
- [ ] Test verificando que nodos acoplados se ejecutan en batch.
$DOD_TEMPLATE" \
    "sprint:2,package:core,agent-ready"

# ===========================================================================
# SPRINT 3
# ===========================================================================
echo -e "${YELLOW}━━━ SPRINT 3 ━━━${NC}"

create_issue \
    "[US 3.01] KChart Render Mock y prueba de drawVertices" \
    "## Contexto
Validar que Flutter puede pintar 100,000 velas en 60fps usando primitivas.

## Especificación Técnica (\`kchart_flutter/lib/src/painting/\`)
- Crear \`KChartController\` (ChangeNotifier) y \`KChart\` (Widget).
- Implementar \`MainPanelPainter\`. **Obligatorio:** Usar \`canvas.drawVertices\` con \`VertexMode.triangles\`. NO USAR \`canvas.drawRect\`.
- Búsqueda binaria O(log N) para renderizar solo lo visible en el Viewport.

## Criterios de Aceptación
- [ ] Renderiza velas simuladas en pantalla.
- [ ] \`shouldRepaint\` evalúa rigurosamente el \`sequenceNumber\`.
$DOD_TEMPLATE" \
    "sprint:3,package:flutter,agent-ready"

create_issue \
    "[US 3.02] Performance Lab y Golden Tests Base" \
    "## Contexto
Asegurar el pipeline contra regresiones de rendimiento visual.

## Especificación Técnica (\`kchart_flutter/test/\`)
- Generar fixture JSON determinista de 50k velas.
- Crear Golden Test con \`matchesGoldenFile\`.
- Crear script benchmark simulando scroll programático para medir tiempos del \`paint()\`.

## Criterios de Aceptación
- [ ] Golden files generados.
- [ ] Benchmark falla si el \`paint()\` excede 16ms en hardware local.
$DOD_TEMPLATE" \
    "sprint:3,package:flutter,type:infra,agent-ready"

# ===========================================================================
# SPRINT 4
# ===========================================================================
echo -e "${YELLOW}━━━ SPRINT 4 ━━━${NC}"

create_issue \
    "[US 4.01] Catálogo Base de Indicadores" \
    "## Contexto
Implementar matemática estricta.

## Especificación Técnica (\`kchart_core/lib/src/indicators/\`)
- SMA, EMA, MACD, Bollinger Bands, RSI. Toda matemática en \`double\`.
- Implementar cómputo incremental: \`computeAppend\` para la última vela de los Websockets.

## Criterios de Aceptación
- [ ] Output validado bit-a-bit contra valores reales (TradingView/TA-Lib).
$DOD_TEMPLATE" \
    "sprint:4,package:core,agent-ready"

create_issue \
    "[US 4.02] LayerCache y Paint Pool" \
    "## Contexto
Optimizar recolección de basura (GC) en cada frame.

## Especificación Técnica (\`kchart_flutter/lib/src/painting/\`)
- \`LayerCache\` usando \`PictureRecorder\`. El histórico estático y el grid se graban en un \`ui.Picture\`.
- \`PaintPool\` para reusar objetos \`Paint\`.

## Criterios de Aceptación
- [ ] El Profiler (DevTools) no muestra instanciación en bucle de memoria durante el scroll.
$DOD_TEMPLATE" \
    "sprint:4,package:flutter,agent-ready"

# ===========================================================================
# SPRINT 5, 6, 7 y 8 (Agrupados por Brevedad)
# ===========================================================================
echo -e "${YELLOW}━━━ SPRINT 5 al 8 ━━━${NC}"

create_issue \
    "[US 5.01] Arquitectura de PanelStack y Divisores" \
    "## Contexto
Soporte para apilar gráficos (Velas, Volumen, RSI) con divisores configurables.

## Especificación Técnica
- Implementar \`PanelStack\` y \`DraggableDivider\`.
- Envolver cada \`ChartPanel\` en un \`RepaintBoundary\` automático.

## Criterios de Aceptación
- [ ] Modificar el RSI no dispara repintado del MainPanel.
$DOD_TEMPLATE" \
    "sprint:5,package:flutter,agent-ready"

create_issue \
    "[US 6.01] Arbitro de Gestos con Raw Pointers" \
    "## Contexto
Interacción multi-touch perfecta.

## Especificación Técnica
- NO usar \`GestureDetector\`.
- Implementar \`GestureArbiter\` con widgets \`Listener\` y eventos \`PointerEvent\`. Máquina de estados explícita para diferenciar Pan, Zoom y Toques largos.

## Criterios de Aceptación
- [ ] Soporte para Trackpad y scroll wheel de Mouse.
$DOD_TEMPLATE" \
    "sprint:6,package:flutter,agent-ready"

create_issue \
    "[US 7.01] Herramientas de Dibujo (Magnet Mode)" \
    "## Contexto
Anotaciones y líneas de tendencia interactivas.

## Especificación Técnica
- Implementar modelo JSON de \`AnnotationDocument\`.
- Hitboxes expandidas para touch en los extremos de las líneas.
- Snapping algorítmico al precio (OHLC) más cercano.

## Criterios de Aceptación
- [ ] Líneas pueden ser editadas sin alterar el gráfico subyacente.
$DOD_TEMPLATE" \
    "sprint:7,package:flutter,agent-ready"

create_issue \
    "[US 8.02] Adaptador Riverpod 3 (kchart_riverpod)" \
    "## Contexto
Integración limpia con \`riverpod: ^3.0.0\`.

## Especificación Técnica (\`packages/kchart_riverpod\`)
- Exponer \`StreamProvider\` para \`ChartFrame\`.
- Usar \`.autoPause\` para optimizar recursos cuando el chart no es visible.

## Criterios de Aceptación
- [ ] App de ejemplo usa Riverpod sin errores.
$DOD_TEMPLATE" \
    "sprint:8,package:riverpod,agent-ready"

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