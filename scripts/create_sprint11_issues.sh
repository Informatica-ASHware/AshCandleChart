#!/bin/bash
# =============================================================================
# K-Chart V2 — Generador de Issues (Sprint 11: QA-1 Mejoras y Correcciones)
# =============================================================================
# Compatibilidad: macOS / Linux
# Requisito: gh (GitHub CLI) instalado y autenticado (`gh auth login`)
# Uso: chmod +x create_sprint11_issues.sh && ./create_sprint11_issues.sh
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# CONFIGURACIÓN
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
    echo -e "${BLUE}[SETUP] Creando/Verificando etiquetas en ${FULL_REPO}...${NC}"

    LABELS=(
        "agent-ready|0E8A16|Lista para ser procesada por el Agente IA"
        "package:flutter|FBCA04|Afecta al paquete ash_candle_chart_flutter"
        "sprint:11|8058FF|Sprint 11: QA-1 mejoras y correcciones"
        "type:enhancement|A2EEEF|Nueva funcionalidad o mejora"
        "type:bug|D73A4A|Algo no funciona correctamente"
    )

    for item in "${LABELS[@]}"; do
        IFS='|' read -r label color desc <<< "$item"

        gh label create "$label" --color "$color" --description "$desc" --repo "$FULL_REPO" 2>/dev/null \
            && echo -e "  ${GREEN}✓${NC} Label: $label" \
            || echo -e "  ${YELLOW}⚠${NC} Label ya existe (o ignorado): $label"
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
echo " K-Chart V2 — Generación de Sprint 11: QA-1"
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

create_labels

echo -e "${BLUE}[INFO] Creando Historias de Usuario para el Sprint 11...${NC}"
echo ""

# ===========================================================================
# SPRINT 11 - QA-1
# ===========================================================================

create_issue \
    "[US 11.01] Renderizado del Eje Y (Escala de Precios)" \
    "## Contexto
El gráfico actual renderiza las velas correctamente pero carece de referencias visuales verticales. Es indispensable mostrar la escala de precios en el margen derecho.

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/painting/\`)
- Implementar \`YAxisLayer\` dentro del panel principal.
- Calcular los valores máximo y mínimo visibles en el \`Viewport\`.
- Dibujar textos (precios) formateados equitativamente distribuidos en el eje Y (margen derecho).
- (Opcional pero recomendado) Dibujar líneas horizontales tenues (\`grid lines\`) de fondo asociadas a cada etiqueta de precio.

## Criterios de Aceptación
- [ ] La escala de precios se dibuja en el lado derecho.
- [ ] Los valores se actualizan dinámicamente al hacer scroll o zoom vertical.
- [ ] El texto tiene un padding adecuado para no superponerse con el borde.
$DOD_TEMPLATE" \
    "sprint:11,package:flutter,type:enhancement,agent-ready"

create_issue \
    "[US 11.02] Renderizado del Eje X (Línea de Tiempo)" \
    "## Contexto
El usuario no tiene noción de la fecha/hora de las velas que está observando. Se debe implementar el eje temporal en la parte inferior.

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/painting/\`)
- Implementar \`TimeAxisPanel\` o \`XAxisLayer\` anclado en la parte inferior del KChart.
- Mapear el índice de la vela visible (\`startIdx\` a \`endIdx\`) a su \`timestamp\` correspondiente.
- Renderizar etiquetas de texto (HH:mm o DD/MM dependiendo del marco temporal) distribuidas equitativamente.

## Criterios de Aceptación
- [ ] La escala temporal se dibuja en el margen inferior.
- [ ] Al desplazar el gráfico horizontalmente (pan), las fechas se actualizan correctamente acompañando el movimiento de las velas.
$DOD_TEMPLATE" \
    "sprint:11,package:flutter,type:enhancement,agent-ready"

create_issue \
    "[US 11.03] Implementación del Crosshair (Puntero Interactivo)" \
    "## Contexto
Se requiere un indicador de posición tipo \"mira\" (crosshair) compuesto por una línea horizontal y una vertical punteadas (\`- - - -\`), que sigan el puntero del usuario para inspeccionar valores específicos.

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/interaction/\` y \`painting/\`)
- Capturar la posición \`(x, y)\` a través del \`GestureArbiter\` (Hover en desktop, Touch sostenido en mobile).
- Implementar \`CrosshairLayer\` que dibuje:
  1. Línea vertical discontinua.
  2. Línea horizontal discontinua.
- Dibujar una etiqueta resaltada (caja con fondo) en el Eje Y mostrando el precio exacto bajo el puntero.
- Dibujar una etiqueta resaltada en el Eje X mostrando el tiempo exacto bajo el puntero.

## Criterios de Aceptación
- [ ] Las líneas punteadas siguen el cursor/dedo de forma fluida (60fps).
- [ ] Las etiquetas de los ejes se sobreponen a la escala normal para resaltar el valor exacto.
$DOD_TEMPLATE" \
    "sprint:11,package:flutter,type:enhancement,agent-ready"

create_issue \
    "[US 11.04] Barra superior de información (Detalles OHLCV)" \
    "## Contexto
Al pasar el puntero sobre el gráfico (o tener el crosshair activo), se deben mostrar los datos técnicos exactos de la vela seleccionada en la parte superior del panel.

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/panels/\`)
- Implementar una superposición de texto en la parte superior izquierda del \`MainPanel\` (o en un widget contenedor superior).
- El texto debe mostrar: \`O: <Open> H: <High> L: <Low> C: <Close> Vol: <Volume>\`.
- Si el usuario no tiene el crosshair activo, debe mostrar los datos de la **última vela** del dataset.
- Si el crosshair está activo, debe reaccionar y mostrar los datos de la vela intersectada por la línea vertical.

## Criterios de Aceptación
- [ ] Los valores cambian en tiempo real al mover el cursor/dedo.
- [ ] Los colores del texto pueden heredar la lógica de vela alcista/bajista (opcional pero deseable).
$DOD_TEMPLATE" \
    "sprint:11,package:flutter,type:enhancement,agent-ready"

create_issue \
    "[US 11.05] Gestura de Zoom Vertical (Pinch-to-Zoom en Eje Y)" \
    "## Contexto
Actualmente se permite el scroll, pero el usuario necesita poder hacer zoom vertical explícito utilizando la gestura de dos dedos (pinch) para contraer o expandir la escala de precios visible.

## Especificación Técnica (\`ash_candle_chart_flutter/lib/src/interaction/\`)
- Extender el \`GestureArbiter\` para identificar el evento \`ScaleUpdate\` de Flutter focalizado en el eje Y.
- Calcular el factor de escala vertical independiente del factor horizontal.
- Actualizar el estado del \`Viewport\` (o parámetros de rango Y del panel) para reflejar la contracción/expansión.

## Criterios de Aceptación
- [ ] Usar dos dedos con movimiento vertical expande o comprime las velas en el eje Y.
- [ ] El centro del gesto (\`focal point\`) se mantiene como ancla del zoom.
$DOD_TEMPLATE" \
    "sprint:11,package:flutter,type:enhancement,agent-ready"

create_issue \
    "[US 11.06] [Bug] Punto azul residual al seleccionar una vela" \
    "## Contexto
Existe un bug de interacción: si se toca una vela, esta queda aparentemente \"seleccionada\" renderizando un punto azul sólido encima de ella. El problema es que esta selección se queda anclada y no existe forma de eliminarla.

## Especificación Técnica
- **Causa probable:** El manejador de eventos (\`onTap\` o similar) actualiza un índice seleccionado en el estado global, ordenando al painter dibujar este \"marker\" azul. Falta la lógica de deselección.
- **Solución A:** Proveer un mecanismo para limpiar el estado (ej. tocar en un espacio vacío sin velas pone \`selectedIndex = null\`).
- **Solución B:** Si la selección estática no es requerida (ya que se reemplazará por el Crosshair temporal interactivo de la US 11.03), eliminar la lógica del marker azul por completo.

## Criterios de Aceptación
- [ ] El punto azul puede ser deseleccionado tocando el fondo, O bien, es removido del código si la funcionalidad de selección estática ya no es necesaria.
- [ ] La UI no se queda bloqueada con artefactos visuales tras interactuar con ella.
$DOD_TEMPLATE" \
    "sprint:11,package:flutter,type:bug,agent-ready"

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