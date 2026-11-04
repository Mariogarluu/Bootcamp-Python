# Contexto del Proyecto y Reglas para Agentes (AI)

## 1. Naturaleza del Proyecto
Este repositorio (`Bootcamp-Python` / `Repo_Mario`) es un **repositorio de repositorios (Repo de Repos)** que contiene los proyectos, prácticas y módulos de un **Curso de Python orientado a Inteligencia Artificial (IA)**.
Cada módulo de aprendizaje o proyecto temático (por ejemplo, `EjemploPython`, visión por computador, modelos de lenguaje, procesamiento de datos, etc.) es o será un repositorio independiente conectado mediante **Git Submodules**.

---

## 2. Convención Estricta de Commits
El mensaje de commit en este repositorio y sus submódulos debe seguir este estándar basado en fecha:
- Formato: `YYYY-MM-DD - <Descripción>` o `YYYY-MM-DD/<N> - <Descripción>`
  - Para el **primer commit del día**: `YYYY-MM-DD - <mensaje>` (ejemplo: `2026-11-04 - Inicio módulo tensores`).
  - Para el **segundo commit del día**: `YYYY-MM-DD/2 - <mensaje>`.
  - Para el **tercer commit del día**: `YYYY-MM-DD/3 - <mensaje>`, y así sucesivamente.

---

## 3. Automatización de Submódulos al Hacer Commit
Cuando se va a commitear en el repositorio padre:
1. Se debe comprobar el estado de cada submódulo.
2. Si un submódulo tiene cambios sin commitear o commits sin pushear:
   - Hacer commit con la convención de fecha correspondiente.
   - Hacer `push origin main` en el submódulo.
3. El commit en el padre incluirá la nueva referencia actualizada de los submódulos.

---

## 4. Protocolo Rápido de Creación de Submódulos para Agentes
Cuando el usuario pida: *"Crea un nuevo submódulo llamado <NombreModulo> con repo <URL>"* o *"Añade el módulo <NombreModulo>"*:
1. **Comprobar si el repo remoto existe** o pedir confirmación de URL.
2. **Ejecutar el comando de adición**:
   ```bash
   git submodule add <URL_DEL_REPO> <NombreModulo>
   ```
3. **Inicializar y sincronizar**:
   ```bash
   git submodule update --init --recursive <NombreModulo>
   ```
4. **Verificar `.gitignore`**:
   Asegurar que `.venv/`, `__pycache__/`, `.env` y archivos pesados de datasets/pesos de IA estén ignorados en cada submódulo.
5. **Realizar el commit con el formato del día**:
   ```bash
   git add .gitmodules <NombreModulo>
   git commit -m "YYYY-MM-DD[/N] - Añadir submódulo <NombreModulo>"
   git push origin main
   ```
