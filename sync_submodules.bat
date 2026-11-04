@echo off
echo ==============================================
echo  Sincronizando repo principal y submodulos...
echo ==============================================

git pull --recurse-submodules
git submodule update --remote --merge

echo.
echo ==============================================
echo  Submodulos actualizados al ultimo commit.
echo ==============================================
pause
