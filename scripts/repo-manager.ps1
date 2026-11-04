# Sistema de automatización para Repo de Repos
# Curso de Python orientado a IA

param(
    [Parameter(Position=0)]
    [string]$Action = "commit", # 'commit', 'create-submodule', 'sync'
    [Parameter(Position=1)]
    [string]$Message = "",
    [Parameter(Position=2)]
    [string]$SubmoduleUrl = "",
    [Parameter(Position=3)]
    [string]$SubmoduleName = ""
)

function Get-NextCommitTag {
    $today = (Get-Date).ToString("yyyy-MM-dd")
    $log = git log --date=short --pretty=format:"%ad %s" 2>$null
    $countToday = 0
    if ($log) {
        $lines = $log -split "`r?`n"
        foreach ($line in $lines) {
            if ($line -like "$today*") {
                $countToday++
            }
        }
    }
    
    if ($countToday -eq 0) {
        return "$today"
    } else {
        $nextNum = $countToday + 1
        return "$today/$nextNum"
    }
}

function Sync-And-Commit-Submodules {
    param([string]$customMsg)
    
    if (-not (Test-Path ".gitmodules")) {
        return
    }

    Write-Host "-> Verificando cambios en submodulos..." -ForegroundColor Cyan
    
    # Obtener lista de rutas de submodulos
    $submodules = git config --file .gitmodules --get-regexp path | ForEach-Object { ($_ -split ' ')[1] }

    foreach ($sub in $submodules) {
        if (Test-Path $sub) {
            $status = git -C $sub status --porcelain 2>$null
            if ($status) {
                Write-Host "Cambios detectados en submodulo: $sub" -ForegroundColor Yellow
                $tag = Get-NextCommitTag
                $subMsg = if ($customMsg) { "$tag - $customMsg" } else { "$tag - Actualizacion automatica" }
                
                git -C $sub add -A
                git -C $sub commit -m "$subMsg"
                git -C $sub push origin main
                Write-Host "Submodulo $sub commiteado y pusheado ($subMsg)." -ForegroundColor Green
            } else {
                # Verificar si tiene commits locales pendientes de push
                $unpushed = git -C $sub cherry -v 2>$null
                if ($unpushed) {
                    Write-Host "Pusheando commits pendientes en $sub..." -ForegroundColor Yellow
                    git -C $sub push origin main
                }
            }
        }
    }
}

function Auto-Commit-Parent {
    param([string]$userMsg)
    
    # 1. Procesar submodulos primero
    Sync-And-Commit-Submodules -customMsg $userMsg
    
    # 2. Agregar cambios en padre (incluye punteros de submodulos actualizados)
    git add -A
    $statusParent = git status --porcelain
    if (-not $statusParent) {
        Write-Host "No hay cambios pendientes en el repositorio padre." -ForegroundColor DarkGray
        return
    }

    $tag = Get-NextCommitTag
    $finalMsg = if ($userMsg) { "$tag - $userMsg" } else { "$tag - Actualizacion general" }

    Write-Host "-> Commiteando en repo padre: $finalMsg" -ForegroundColor Cyan
    git commit -m "$finalMsg"
    git push origin main
    Write-Host "Repo padre sincronizado con exito." -ForegroundColor Green
}

function Add-Fast-Submodule {
    param([string]$url, [string]$name)
    if (-not $url -or -not $name) {
        Write-Host "Error: Debes proporcionar URL y Nombre. Ej: .\repo-manager.ps1 create-submodule 'https://github.com/usuario/repo.git' 'ModuloNombre'" -ForegroundColor Red
        return
    }

    Write-Host "-> Anadiendo submodulo $name desde $url..." -ForegroundColor Cyan
    git submodule add $url $name
    git submodule update --init --recursive $name
    
    # Commit automatico con formato de fecha
    Auto-Commit-Parent -userMsg "Anadido submodulo $name"
    Write-Host "Submodulo $name configurado y subido correctamente." -ForegroundColor Green
}

# Ejecución según la acción
switch ($Action.ToLower()) {
    "commit" {
        Auto-Commit-Parent -userMsg $Message
    }
    "create-submodule" {
        Add-Fast-Submodule -url $SubmoduleUrl -name $SubmoduleName
    }
    "sync" {
        git submodule update --remote --merge
        Auto-Commit-Parent -userMsg "Sincronizacion de submodulos a la ultima version remota"
    }
    default {
        Write-Host "Comando desconocido. Usa: commit, create-submodule o sync." -ForegroundColor Yellow
    }
}
