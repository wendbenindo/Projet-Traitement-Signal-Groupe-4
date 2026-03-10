@echo off
echo ========================================
echo   Generation complete du projet
echo   Communications Numeriques
echo ========================================
echo.

REM Aller dans le dossier codes
cd codes

echo [1/2] Generation des images avec MATLAB...
matlab -batch "generer_toutes_images" -wait

if %ERRORLEVEL% NEQ 0 (
    echo Erreur lors de la generation des images!
    pause
    exit /b 1
)

echo.
echo [2/2] Compilation du rapport LaTeX...
cd ../rapport
call compiler_rapport.bat

if %ERRORLEVEL% NEQ 0 (
    echo Erreur lors de la compilation du rapport!
    pause
    exit /b 1
)

cd ..

echo.
echo ========================================
echo   Generation terminee avec succes!
echo   Verifiez:
echo   - images/ pour les figures
echo   - rapport/Rapport_CommNum.pdf
echo ========================================
pause
