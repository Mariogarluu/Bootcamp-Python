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
    ├── EjemploPython/             # Submódulo: Fundamentos y primeros pasos
    └── proyectoAgents/            # Submódulo: Agentes de Inteligencia Artificial
```

---

## 📚 Módulos y Proyectos Conectados

| Módulo / Carpeta | Descripción | Repositorio Remoto |
| :--- | :--- | :--- |
| **`EjemploPython`** | Introducción a sintaxis, estructuras y fundamentos de Python. | [EjemploPythonn](https://github.com/Mariogarluu/EjemploPythonn.git) |
| **`proyectoAgents`** | Arquitectura y desarrollo de agentes con IA. | [ProyectoAgente](https://github.com/Mariogarluu/ProyectoAgente.git) |
| *(Próximos módulos)* | *Numpy, Pandas, Redes Neuronales, LLMs, Computer Vision...* | *Se añadirán como submódulos* |

---

## ⚡ Automatización y Flujo de Trabajo

### 1. Clonar este repositorio por primera vez
Para clonar el repositorio principal junto con todos los sub-repositorios en un solo paso:
```bash
git clone --recurse-submodules https://github.com/Mariogarluu/Bootcamp-Python.git
```

### 2. Guardar cambios (Commits automáticos por fecha)
El proyecto sigue una convención estricta: los commits se etiquetan automáticamente por fecha (`YYYY-MM-DD`, `YYYY-MM-DD/2`, etc.) y revisan primero si hay cambios en los submódulos.

Para realizar un commit completo de forma automática:
```powershell
.\scripts\repo-manager.ps1 commit "Descripción de los cambios"
```
> **¿Qué hace automáticamente?**
> 1. Detecta cambios dentro de cualquier submódulo (`EjemploPython`, `proyectoAgents`, etc.), los añade, genera su commit fechado y hace `push origin main`.
> 2. Actualiza la referencia del submódulo en el repo padre.
> 3. Genera el commit fechado en el repo padre y hace `push origin main`.

### 3. Añadir un nuevo módulo rápidamente
Para conectar un nuevo repositorio como módulo del curso (puede ejecutarlo cualquier agente o tú mismo):
```powershell
.\scripts\repo-manager.ps1 create-submodule "https://github.com/Mariogarluu/NuevoModulo.git" "NuevoModulo"
```

### 4. Sincronizar todos los módulos con sus versiones remotas
- **Desde terminal**:
  ```powershell
  .\scripts\repo-manager.ps1 sync
  ```
- **Con doble clic**: Ejecuta el archivo [`sync_submodules.bat`](file:///c:/Users/Mañana/Desktop/Repo_Mario/sync_submodules.bat).
- **En GitHub**: El workflow de GitHub Actions se ejecuta diariamente a medianoche y puede lanzarse manualmente desde la pestaña **Actions**.

---

## 🤖 Directrices para Agentes de IA
Todos los agentes cargan automáticamente las reglas definidas en [`GEMINI.md`](file:///c:/Users/Mañana/Desktop/Repo_Mario/GEMINI.md) y [`AGENTS.md`](file:///c:/Users/Mañana/Desktop/Repo_Mario/AGENTS.md).
