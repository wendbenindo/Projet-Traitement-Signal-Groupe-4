@echo off
echo ========================================
echo   GENERATION DES IMAGES MATLAB
echo ========================================
echo.
echo Lancement de MATLAB...
echo.

REM Lancer MATLAB avec le script
matlab -r "cd('codes'); generer_toutes_images; exit"

echo.
echo ========================================
echo   GENERATION TERMINEE !
echo ========================================
echo.
pause
