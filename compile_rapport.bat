@echo off
REM Script batch pour compiler le rapport LaTeX
REM Double-cliquez sur ce fichier pour compiler automatiquement

echo ========================================
echo   Compilation du Rapport TP2 - FM
echo ========================================
echo.

REM Exécuter le script PowerShell
powershell -ExecutionPolicy Bypass -File "%~dp0compile_rapport.ps1"

pause
