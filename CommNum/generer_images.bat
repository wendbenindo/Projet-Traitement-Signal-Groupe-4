@echo off
echo ========================================
echo   Generation des images MATLAB
echo ========================================
echo.

cd codes
matlab -batch "addpath(pwd); generer_toutes_images" -wait

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Images generees avec succes!
    echo Verifiez le dossier images/
) else (
    echo.
    echo Erreur lors de la generation!
)

cd ..
pause
