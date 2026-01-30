@echo off
echo ========================================
echo   NETTOYAGE DES FICHIERS TEMPORAIRES
echo ========================================
echo.

echo Suppression des fichiers LaTeX temporaires...
del /Q *.aux *.log *.out *.toc *.synctex.gz *.fdb_latexmk *.fls 2>nul

echo Suppression des fichiers MATLAB temporaires...
del /Q *.asv *.m~ 2>nul

echo Suppression des fichiers de sauvegarde...
del /Q *_old.* *.bak *.backup 2>nul

echo.
echo ========================================
echo   NETTOYAGE TERMINE !
echo ========================================
echo.

pause
