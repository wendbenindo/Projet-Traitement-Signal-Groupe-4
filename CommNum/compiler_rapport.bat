@echo off
echo ========================================
echo Compilation du rapport CommNum
echo ========================================
echo.

echo Compilation LaTeX (1ere passe)...
pdflatex -interaction=nonstopmode Rapport_CommNum.tex

echo.
echo Compilation LaTeX (2eme passe pour la table des matieres)...
pdflatex -interaction=nonstopmode Rapport_CommNum.tex

echo.
echo ========================================
echo Compilation terminee!
echo Le PDF est: Rapport_CommNum.pdf
echo ========================================
pause
