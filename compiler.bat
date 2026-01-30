@echo off
echo ========================================
echo   COMPILATION DU RAPPORT LATEX
echo ========================================
echo.

REM Compiler 2 fois pour la table des matieres
echo [1/2] Premiere compilation...
pdflatex -interaction=nonstopmode Rapport_TP2_FM.tex > nul 2>&1

echo [2/2] Deuxieme compilation...
pdflatex -interaction=nonstopmode Rapport_TP2_FM.tex > nul 2>&1

REM Nettoyer les fichiers temporaires
echo.
echo Nettoyage des fichiers temporaires...
del *.aux *.log *.out *.toc *.synctex.gz 2>nul

echo.
echo ========================================
echo   COMPILATION TERMINEE !
echo ========================================
echo Le fichier Rapport_TP2_FM.pdf a ete genere.
echo.

REM Ouvrir le PDF
start Rapport_TP2_FM.pdf

pause
