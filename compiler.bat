@echo off
echo Compilation du rapport LaTeX...
echo.

REM Rafraichir le PATH
set PATH=%PATH%;C:\Users\chris\AppData\Local\Programs\MiKTeX\miktex\bin\x64

REM Compiler 2 fois pour la table des matieres
pdflatex -interaction=nonstopmode Rapport_TP2_FM.tex
pdflatex -interaction=nonstopmode Rapport_TP2_FM.tex

REM Nettoyer les fichiers temporaires
del *.aux *.log *.out *.toc 2>nul

echo.
echo Compilation terminee !
echo Le fichier Rapport_TP2_FM.pdf a ete genere.
echo.

REM Ouvrir le PDF
start Rapport_TP2_FM.pdf

pause
