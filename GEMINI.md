# 🧠 Contexto del Proyecto y Reglas Obligatorias para Agentes (AI)

> **ATENCIÓN AGENTES**: Este archivo es de lectura y aplicación obligatoria y automática en cualquier sesión.

---

## 1. Naturaleza del Proyecto
Este repositorio (`Bootcamp-Python` / `Repo_Mario`) es un **repositorio de repositorios (Repo de Repos)** que contiene los proyectos, prácticas y módulos de un **Curso de Python orientado a Inteligencia Artificial (IA)**.
Cada módulo de aprendizaje o proyecto temático (ejemplos: `EjemploPython`, `proyectoAgents`, etc.) es un repositorio independiente conectado mediante **Git Submodules**.

---

## 2. Convención Estricta de Commits por Fecha
El mensaje de commit en este repositorio y en todos sus submódulos **debe seguir obligatoriamente este estándar basado en fecha**:

- Formato: `YYYY-MM-DD - <Descripción>` o `YYYY-MM-DD/<N> - <Descripción>`
  - Para el **primer commit del día**: `YYYY-MM-DD - <mensaje>` (ejemplo: `2026-11-04 - Inicio módulo tensores`).
  - Para el **segundo commit del día**: `YYYY-MM-DD/2 - <mensaje>`.
  - Para el **tercer commit del día**: `YYYY-MM-DD/3 - <mensaje>`, y así sucesivamente contando los commits de hoy en `git log`.

---

## 3. Automatización Obligatoria al Hacer Commit (Regla de Oro)
**NUNCA hagas commit en el repositorio padre sin procesar antes los submódulos.**

Siempre debes usar el gestor automático:
```powershell
.\scripts\repo-manager.ps1 commit "Descripción del cambio"
```
O si lo haces manualmente:
1. Comprueba el estado de cada submódulo (`git -C <submodulo> status`).
2. Si hay archivos nuevos, modificados o commits locales pendientes:
   - Haz commit en el submódulo con el formato de fecha: `git commit -m "YYYY-MM-DD[/N] - <mensaje>"`.
   - Haz `push origin main` en el submódulo.
3. Vuelve al repo padre, agrega las referencias actualizadas de los submódulos (`git add <submodulo>`).
4. Haz commit en el padre con su correspondiente etiqueta de fecha y `git push origin main`.

---

## 4. Creación Rápida de Nuevos Submódulos para Agentes
Cuando el usuario te pida crear o conectar un nuevo submódulo (por ejemplo, `NuevoModulo`):
1. Ejecuta el comando rápido:
   ```powershell
   .\scripts\repo-manager.ps1 create-submodule "<URL_GITHUB>" "<NombreModulo>"
   ```
2. O manualmente:
   ```bash
   git submodule add <URL_GITHUB> <NombreModulo>
   git submodule update --init --recursive <NombreModulo>
   .\scripts\repo-manager.ps1 commit "Añadir submódulo <NombreModulo>"
   ```
3. Verifica que el `.gitignore` del submódulo ignore entornos virtuales (`.venv/`), cachés (`__pycache__/`) y archivos de datos o modelos pesados.
