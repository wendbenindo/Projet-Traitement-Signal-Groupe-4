@echo off
echo ========================================
echo   GENERATION DES IMAGES TD MODULATIONS
echo ========================================
echo.
echo Lancement de MATLAB...
echo.

REM Lancer MATLAB avec le script
matlab -r "cd('codes_td'); generer_toutes_images_td; exit"

echo.
echo ========================================
echo   GENERATION TERMINEE !
echo ========================================
echo.
pause
