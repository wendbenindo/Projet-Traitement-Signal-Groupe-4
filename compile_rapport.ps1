# Script de compilation du rapport LaTeX
# Ce script configure l'environnement et compile le rapport en PDF

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Compilation du Rapport TP2 - FM" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Rafraîchir les variables d'environnement
Write-Host "[1/4] Configuration de l'environnement..." -ForegroundColor Yellow
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Vérifier que pdflatex est disponible
Write-Host "[2/4] Vérification de pdflatex..." -ForegroundColor Yellow
$pdflatexExists = Get-Command pdflatex -ErrorAction SilentlyContinue
if ($pdflatexExists) {
    $version = pdflatex --version 2>&1 | Select-Object -First 1
    Write-Host "✓ pdflatex trouvé: $version" -ForegroundColor Green
} else {
    Write-Host "✗ Erreur: pdflatex n'est pas installé ou pas dans le PATH" -ForegroundColor Red
    Write-Host "Veuillez installer MiKTeX depuis https://miktex.org/download" -ForegroundColor Red
    exit 1
}

# Compiler le rapport (première passe)
Write-Host "[3/4] Compilation du rapport (passe 1/2)..." -ForegroundColor Yellow
pdflatex -interaction=nonstopmode Rapport_TP2_FM.tex | Out-Null

# Compiler le rapport (deuxième passe pour la table des matières)
Write-Host "[4/4] Compilation du rapport (passe 2/2)..." -ForegroundColor Yellow
pdflatex -interaction=nonstopmode Rapport_TP2_FM.tex | Out-Null

# Vérifier si le PDF a été créé
if (Test-Path "Rapport_TP2_FM.pdf") {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "✓ Compilation réussie !" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Le rapport PDF a été généré: Rapport_TP2_FM.pdf" -ForegroundColor Cyan
    Write-Host ""
    
    # Nettoyer les fichiers temporaires
    Write-Host "Nettoyage des fichiers temporaires..." -ForegroundColor Yellow
    Remove-Item -ErrorAction SilentlyContinue *.aux, *.log, *.out, *.toc
    Write-Host "✓ Nettoyage terminé" -ForegroundColor Green
    Write-Host ""
    
    # Proposer d'ouvrir le PDF
    $response = Read-Host "Voulez-vous ouvrir le PDF ? (O/N)"
    if ($response -eq "O" -or $response -eq "o") {
        Start-Process "Rapport_TP2_FM.pdf"
    }
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "✗ Erreur de compilation" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Consultez le fichier Rapport_TP2_FM.log pour plus de détails" -ForegroundColor Yellow
}
