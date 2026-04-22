
# 🤖 INSTRUCCIONES GLOBALES PARA EL AGENTE IA (Definition of Done)

Para **CADA** Historia de Usuario (US) generada mediante PR, el Agente IA debe cumplir estrictamente este `Definition of Done` (DoD). Si falta un punto, el PR será rechazado.

1.  **Código Limpio:** Cero advertencias del linter (basado en `flutter_lints` y custom rules).
2.  **Testing Obligatorio:** Unit tests para lógica pura; Golden tests para UI. Cobertura de la US > 90%.
3.  **Documentación:** Todo método/clase pública debe tener `/// Dartdoc`.
4.  **Inmutabilidad:** Uso de `@freezed` o `final` con `copyWith`. Cero estado mutable compartido.
5.  **Performance:** Uso estricto de `double` (IEEE 754), nunca `Decimal`. Colecciones numéricas deben ser `Float64List` / `Int64List`.
6.  **ChangeLog:** Actualizar `CHANGELOG.md` en el paquete correspondiente bajo la cabecera `## [Unreleased]`.
7.  **Platform Target (Native-First):** Las implementaciones UI y el rendimiento del motor de cálculo asumen como objetivo principal **Desktop (MacOS primero)** y **Mobile (Android/iOS)** renderizando sobre Impeller/Skia. El código debe exprimir las capacidades de multihilo nativo (Isolates reales) y eventos de puntero de hardware (trackpad/touch). El soporte Web queda relegado para el futuro y ninguna limitación de la web (como la emulación de hilos) debe condicionar la arquitectura del componente.

### MODO DE OPERACIÓN DEL AGENTE IA:
1. **Sincronización y Branching:** Iniciar siempre desde el HEAD actualizado de la rama `main`. Crear una rama de trabajo siguiendo estrictamente la convención `feature/US-X.XX-nombre-corto`.
2. **Ciclo de Código:** Escribir los tests. Escribir la implementación. Ejecutar comandos de validación locales (`dart format .` y `dart analyze fatal-infos`).
3. **Registro de Cambios:** Actualizar el archivo `CHANGELOG.md` del paquete correspondiente, documentando los cambios bajo la etiqueta `## [Unreleased]`.
4. **Creación Estricta del Pull Request:** Hacer commit usando *Conventional Commits* (ej. `feat(core): US 1.01 setup inicial`). Hacer push al origen remoto y abrir un PR hacia la rama `main`. El cuerpo del PR **debe** contener obligatoriamente:
    - Referencia explícita a la Historia de Usuario (ej. "Ejecución de la US 1.01").
    - Un listado tipo *checkbox* del `Definition of Done` (DoD) marcado como completado.
    - Un breve resumen técnico (3-4 viñetas) explicando las decisiones algorítmicas o estructuras de datos utilizadas.
5. **Halt (Detención):** Una vez abierto el PR en GitHub, el Agente IA da por concluida su tarea para esa iteración y se detiene. Queda a la espera de recibir tu próxima instrucción para iniciar la siguiente US (una vez tú hayas revisado, delegado al CI/CD y fusionado el código).
