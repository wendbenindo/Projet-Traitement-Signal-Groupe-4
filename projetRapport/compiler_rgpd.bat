@echo off
echo ========================================
echo   COMPILATION DU RAPPORT RGPD
echo ========================================
echo.

pdflatex Rapport_RGPD.tex
pdflatex Rapport_RGPD.tex

echo.
echo ========================================
echo   COMPILATION TERMINEE !
echo ========================================
echo.
echo Le fichier Rapport_RGPD.pdf a ete genere.
echo.
pause
