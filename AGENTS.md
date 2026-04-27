# AGENTS.md - Reglas del Repositorio para Agentes IA

## 🎯 Propósito y Contexto del Ecosistema
Este archivo proporciona el contexto crítico y las instrucciones obligatorias para los agentes IA (Antigravity, Cursor, Claude, Jules, etc.) que trabajen en este monorepo. Seguir estas reglas es mandatorio para mantener la estabilidad a través de los proyectos de Dart y Flutter.

> [!IMPORTANT]
> **Contexto del Ecosistema:** Este repositorio es un componente crítico del ecosistema **ASHware Antigravity** (junto con *Iron Widgets, binance_dart_sdk, KChart2 y CryptBot*). Las reglas de integridad existen porque compartimos dependencias núcleo y patrones de CI; cualquier desalineación aquí puede propagar inestabilidad a todo el sistema.

---

## 🤖 INSTRUCCIONES GLOBALES Y DEFINICIÓN DE TERMINADO (Definition of Done)

Para **CADA** Historia de Usuario (US) generada mediante un Pull Request (PR), el Agente IA debe cumplir estrictamente este `Definition of Done` (DoD). Si falta un punto, el PR será rechazado.

1.  **Código Limpio:** Cero advertencias del linter (basado en `flutter_lints` y custom rules).
2.  **Testing Obligatorio:** Unit tests para lógica pura; Golden tests para UI. Cobertura de la US > 90%.
3.  **Documentación:** Todo método y clase pública debe tener `/// Dartdoc`.
4.  **Inmutabilidad:** Uso de `@freezed` o `final` con `copyWith`. Cero estado mutable compartido.
5.  **Performance:** Uso estricto de `double` (IEEE 754), nunca `Decimal`. Las colecciones numéricas deben ser `Float64List` / `Int64List`.
6.  **Platform Target (Native-First):** Las implementaciones UI y el rendimiento del motor de cálculo asumen como objetivo principal **Desktop (MacOS primero)** y **Mobile (Android/iOS)** renderizando sobre Impeller/Skia. El código debe exprimir las capacidades de multihilo nativo (Isolates reales) y eventos de puntero de hardware (trackpad/touch). El soporte Web queda relegado para el futuro y ninguna limitación de la web (como la emulación de hilos) debe condicionar la arquitectura del componente.
7.  **ChangeLog:** Actualizar `CHANGELOG.md` en el paquete correspondiente bajo la cabecera `## [Unreleased]`.

---

## 🛠 REGLAS DE GESTIÓN DE DEPENDENCIAS

### 1. The "SDK Pinning" Rule (CRÍTICO)
- **Problema:** El Flutter SDK a menudo fija (pins) versiones específicas de paquetes core (como `meta`, `path`, `analyzer`).
- **Restricción:** NUNCA fuerces una versión de dependencia que exceda lo que el Flutter SDK actual soporta en su `flutter_test` o componentes core.
- **Ejemplo:** Si `flutter_test` depende de `meta 1.15.0`, NO establezcas `meta: ^1.16.0` aunque esté disponible. Esto causará un fallo de version solving.
- **Acción:** Verifica siempre los constraints actuales del Flutter SDK antes de actualizar dependencias transitivas core.

### 2. The "Stale Package" Rule
- **Restricción:** Evita agregar o mantener dependencias que no hayan sido actualizadas por más de **1 año**.
- **Razonamiento:** Dart y Flutter evolucionan rápidamente. Los paquetes abandonados (stale) conducen a `breaking changes` e incompatibilidades con SDKs más nuevos.
- **Acción:** Si un paquete es stale, busca una alternativa moderna o notifica al usuario para considerar hacer un fork o reemplazarlo.

### 3. Version Hard-Locking
- Usa `^` para actualizaciones flexibles pero seguras (semver).
- **PROHIBIDO** usar `any` a menos que esté explícitamente permitido en las `directivas/` para paquetes internos del monorepo.

### 4. Realidad Temporal (CRÍTICO)
- **Restricción:** NUNCA asumas la fecha basada en datos de entrenamiento. DEBES usar comandos del sistema o metadata para obtener la fecha REAL (Hoy es Abril de 2026).
- **Acción:** Antes de actualizar cualquier CHANGELOG.md o documentación, verifica el año y día real mediante el comando `date`.

---

## 🚀 MODO DE OPERACIÓN Y FLUJO DE TRABAJO DEL AGENTE

El Agente IA debe ejecutar las tareas siguiendo estrictamente este ciclo:

1. **Sincronización y Branching:** Iniciar siempre desde el HEAD actualizado de la rama `main`. Crear una rama de trabajo siguiendo estrictamente la convención `feature/US-X.XX-nombre-corto`.
2. **Integridad Prevía (Guardian):** DEBES ejecutar `python3 scripts/check_integrity.py` antes de sugerir un commit que modifique `pubspec.yaml` o `.github/workflows/`. Si se requieren cambios, DEBES crear un `PR_JUSTIFICATION.md` con una explicación técnica detallada.
3. **Ciclo de Código:** Escribir los tests. Escribir la implementación (cumpliendo el DoD). Ejecutar comandos de validación locales (`dart format .` y `dart analyze fatal-infos`).
4. **Sincronización Post-Código:** Después de cualquier cambio en dependencias, ejecuta `python3 scripts/sincronizar_dependencias_dart.py` para asegurar que todo el monorepo sigue sincronizado y pasa el análisis.
5. **Registro de Cambios:** Actualizar el archivo `CHANGELOG.md` del paquete correspondiente, documentando los cambios bajo la etiqueta `## [Unreleased]`.
6. **Creación Estricta del Pull Request:** Hacer commit usando *Conventional Commits* (ej. `feat(core): US 1.01 setup inicial`). Hacer push al origen remoto y abrir un PR hacia la rama `main`. El cuerpo del PR **debe** contener obligatoriamente:
  - Referencia explícita a la Historia de Usuario (ej. "Ejecución de la US 1.01").
  - Un listado tipo *checkbox* del `Definition of Done` (DoD) marcado como completado.
  - Un breve resumen técnico (3-4 viñetas) explicando las decisiones algorítmicas o estructuras de datos utilizadas.
7. **Halt (Detención):** Una vez abierto el PR en GitHub, el Agente IA da por concluida su tarea para esa iteración y **se detiene**. Queda a la espera de recibir la próxima instrucción para iniciar la siguiente US (una vez el usuario haya revisado, delegado al CI/CD y fusionado el código).

---

## 🧠 SISTEMA DE MEMORIA Y DIRECTIVAS

Este repositorio utiliza un **sistema de 3 componentes**:
1. `directivas/`: Standard Operating Procedures (SOPs).
2. `scripts/`: Scripts de ejecución determinista.
3. `AGENTS.md`: Este archivo de contexto.

**REGLA DE ORO:** SIEMPRE consulta la carpeta `directivas/` antes de implementar nueva lógica.