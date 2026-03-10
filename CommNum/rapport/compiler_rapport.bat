@echo off
echo ========================================
echo   Compilation du rapport LaTeX
echo ========================================
echo.

REM Compilation LaTeX (3 passes pour la table des matieres)
pdflatex -interaction=nonstopmode Rapport_CommNum.tex
pdflatex -interaction=nonstopmode Rapport_CommNum.tex
pdflatex -interaction=nonstopmode Rapport_CommNum.tex

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   Compilation reussie!
    echo   Fichier: Rapport_CommNum.pdf
    echo ========================================
    
    REM Nettoyer les fichiers temporaires
    del *.aux *.log *.out *.toc 2>nul
    
    REM Ouvrir le PDF
    start Rapport_CommNum.pdf
) else (
    echo.
    echo Erreur lors de la compilation!
    echo Verifiez le fichier .log pour plus de details
)

pause
