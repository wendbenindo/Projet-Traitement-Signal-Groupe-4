@echo off
echo ========================================
echo Compilation du Rapport GAFAM
echo ========================================
echo.

cd /d "%~dp0"

echo Compilation 1/3...
pdflatex -interaction=nonstopmode Rapport_GAFAM.tex > nul 2>&1

echo Compilation 2/3...
pdflatex -interaction=nonstopmode Rapport_GAFAM.tex > nul 2>&1

echo Compilation 3/3...
pdflatex -interaction=nonstopmode Rapport_GAFAM.tex > nul 2>&1

echo.
echo ========================================
echo Compilation terminee !
echo Fichier genere : Rapport_GAFAM.pdf
echo ========================================
echo.

if exist Rapport_GAFAM.pdf (
    echo Ouverture du PDF...
    start Rapport_GAFAM.pdf
) else (
    echo ERREUR : Le fichier PDF n'a pas ete genere.
    echo Verifiez le fichier .log pour plus de details.
)

pause
