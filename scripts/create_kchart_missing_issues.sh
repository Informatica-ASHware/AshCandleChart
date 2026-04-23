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
OWNER="Informatica-ASHware"
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
    "[US 5.02] Crosshair Sincronizado" \
    "## Contexto
La línea de tracking del mouse/dedo debe cruzar todos los paneles.

## Especificación Técnica
- Implementar \`CrosshairCoordinator\` a nivel de \`KChartController\`.
- El crosshair inyecta su estado al top layer de TODOS los paneles simultáneamente vía \`ValueNotifier<CrosshairState>\`.

## Criterios de Aceptación
- [ ] Dibujar crosshair no invalida el render de las velas subyacentes.
$DOD_TEMPLATE" \
    "sprint:5,package:flutter,agent-ready"

create_issue \
    "[US 6.02] Fling y Snap-to-Candle" \
    "## Contexto
Paneo inercial.

## Especificación Técnica
- Usar \`AnimationController\` acoplado al \`GestureArbiter\` para calcular la desaceleración usando físicas de simulación (\`FrictionSimulation\`).

## Criterios de Aceptación
- [ ] Soltar el dedo a velocidad causa scroll inercial hasta detenerse suavemente.
$DOD_TEMPLATE" \
    "sprint:6,package:flutter,agent-ready"

create_issue \
    "[US 7.02] Overlays de Dominio (Trades y Posiciones)" \
    "## Contexto
Mostrar entradas, stop losses y take profits.

## Especificación Técnica (\`kchart_flutter/lib/src/overlays/\`)
- Implementar \`TradeMarker\` (Point en Time X, Price Y).
- Implementar \`PositionOverlay\` (Zona de rango Y con línea extendida al infinito en X).

## Criterios de Aceptación
- [ ] Overlays se mantienen anclados al precio/tiempo lógico independientemente del zoom/scroll temporal.
$DOD_TEMPLATE" \
    "sprint:7,package:flutter,agent-ready"

create_issue \
    "[US 8.01] Sistema de Theming e i18n" \
    "## Contexto
Inserción limpia en cualquier aplicación Flutter.

## Especificación Técnica
- \`ChartTheme\` implementado. Variables para colores de velas alcistas/bajistas, textos, grids.
- Formateadores numéricos dependientes de \`Locale\` inyectado.

## Criterios de Aceptación
- [ ] Golden tests cubriendo al menos \`lightTheme\` y \`darkTheme\`.
$DOD_TEMPLATE" \
    "sprint:8,package:flutter,agent-ready"

create_issue \
    "[US 8.03] Documentación y Ejemplo Definitivo" \
    "## Contexto
Alcanzar los 140 puntos en \`pub.dev\` y habilitar adopción comunitaria.

## Especificación Técnica
- 100% comentarios Dartdoc públicos.
- Proyecto \`example/\` mínimo.
- Proyecto en raíz \`examples/crypto_dashboard/\` complejo.
- README.md con GIFs integrados y guía de inicio de 3 minutos.

## Criterios de Aceptación
- [ ] Ejecutar script de validación local: \`pana --no-warning\` devuelve puntuación máxima.
- [ ] La app de ejemplo compila para Desktop (macOS) y Mobile nativo sin errores.
$DOD_TEMPLATE" \
    "sprint:8,package:core,package:flutter,package:riverpod,agent-ready"

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