# 🧠 Bootcamp Python orientado a Inteligencia Artificial

Bienvenido al repositorio central del **Bootcamp de Python orientado a Inteligencia Artificial**. Este espacio está estructurado como un **Repo de Repositorios (Meta-Repo)** utilizando [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules), lo que permite que cada proyecto, módulo temático o práctica cuente con su propio ciclo de vida, historial y repositorio independiente en GitHub.

---

## 📂 Arquitectura del Repositorio

```text
Repo_Mario (Bootcamp-Python) [Repo Principal]
│
├── GEMINI.md / AGENTS.md          # Reglas y directrices de carga obligatoria para agentes
├── .gemini/rules.md               # Contexto detallado del curso y configuración
├── .github/workflows/             # Automatización de GitHub Actions (sincronización remota)
│   └── update-submodules.yml
├── scripts/                       # Scripts de automatización en local
│   └── repo-manager.ps1           # Gestor de commits con fecha y control de submódulos
├── .gitmodules                    # Registro de submódulos vinculados
├── .gitignore                     # Filtros para entornos Python, caches y modelos de IA
│
└── 📦 Submódulos (Módulos del Curso):
    ├── EjemploPython/             # Submódulo: Fundamentos de sintaxis y lógica en Python
    ├── proyectoAgents/            # Submódulo: Agentes locales con LangChain y Ollama
    ├── Agente-Multitool/          # Submódulo: Agente ReAct con Groq y Dragon Ball API
    └── RAG/                       # Submódulo: Sistema RAG con LangChain, ChromaDB y Groq
```

---

## 📚 Módulos y Proyectos Conectados

| Módulo / Carpeta | Descripción | Stack Tecnológico | Repositorio Remoto |
| :--- | :--- | :--- | :--- |
| [**`EjemploPython`**](./EjemploPython) | Fundamentos del lenguaje Python, control de flujo, funciones y estructuras de datos. | Python 3 | [Mariogarluu/EjemploPythonn](https://github.com/Mariogarluu/EjemploPythonn.git) |
| [**`proyectoAgents`**](./proyectoAgents) | Introducción a agentes inteligentes locales con ejecución offline de modelos LLM. | LangChain, Ollama (`qwen3:8b`) | [Mariogarluu/ProyectoAgente](https://github.com/Mariogarluu/ProyectoAgente.git) |
| [**`Agente-Multitool`**](./Agente-Multitool) | Agente autónomo ReAct con invocación dinámica de múltiples herramientas conectadas a APIs REST. | LangGraph, LangChain, Groq (`qwen/qwen3.8-27b`), Dragon Ball API | [Mariogarluu/Agente_multitool](https://github.com/Mariogarluu/Agente_multitool.git) |
| [**`RAG`**](./RAG) | Pipeline de Generación Aumentada por Recuperación (RAG) indexando PDFs con vectorstore persistente. | LangChain, ChromaDB, Ollama (`nomic-embed-text`), Groq | [Mariogarluu/RAG-1](https://github.com/Mariogarluu/RAG-1.git) |
| *(Próximos módulos)* | *Numpy, Pandas, Redes Neuronales, Computer Vision...* | *Torch, Scikit-learn, etc.* | *Se añadirán como submódulos* |

---

## ⚡ Automatización y Flujo de Trabajo

### 1. Clonar este repositorio por primera vez
Para clonar el repositorio principal junto con todos los sub-repositorios en un solo paso:
```bash
git clone --recurse-submodules https://github.com/Mariogarluu/Bootcamp-Python.git
```

Si ya lo clonaste sin submódulos, inicialízalos con:
```bash
git submodule update --init --recursive
```

### 2. Guardar cambios (Commits automáticos por fecha)
El proyecto sigue una convención estricta: los commits se etiquetan automáticamente por fecha (`YYYY-MM-DD`, `YYYY-MM-DD/2`, etc.) y revisan primero si hay cambios en los submódulos.

Para realizar un commit completo de forma automática:
```powershell
.\scripts\repo-manager.ps1 commit "Descripción de los cambios"
```
> **¿Qué hace automáticamente?**
> 1. Detecta cambios dentro de cualquier submódulo (`EjemploPython`, `proyectoAgents`, `Agente-Multitool`, etc.), añade sus archivos, genera su commit fechado y hace `push origin main`.
> 2. Actualiza los punteros de los submódulos en el repositorio padre.
> 3. Genera el commit fechado en el repo padre y hace `push origin main`.

### 3. Añadir un nuevo módulo rápidamente
Para conectar un nuevo repositorio como módulo del curso:
```powershell
.\scripts\repo-manager.ps1 -Action create-submodule -SubmoduleUrl "https://github.com/Mariogarluu/NuevoModulo.git" -SubmoduleName "NuevoModulo"
```

### 4. Sincronizar todos los módulos con sus versiones remotas
- **Desde terminal**:
  ```powershell
  .\scripts\repo-manager.ps1 sync
  ```
- **Con doble clic**: Ejecuta el archivo [`sync_submodules.bat`](sync_submodules.bat).
- **En GitHub Actions**: El flujo se ejecuta diariamente a medianoche y puede lanzarse manualmente desde la pestaña **Actions**.

---

## 🤖 Directrices para Agentes de IA
Todos los agentes cargan y aplican automáticamente las reglas definidas en [`GEMINI.md`](GEMINI.md) y [`AGENTS.md`](AGENTS.md).
