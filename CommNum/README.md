# Projet Communications Numériques - Transmission en Bande de Base

## 📋 Description
Projet de traitement du signal sur la modélisation et l'étude d'une chaîne de communication numérique en bande de base avec bruit blanc gaussien additif (AWGN).

## 🎯 Objectifs
- Comprendre les mécanismes de conversion bits/symboles
- Maîtriser la génération de signaux physiques
- Étudier différents filtres de mise en forme
- Analyser les propriétés énergétiques et spectrales

## 📁 Structure du projet

```
CommNum/
├── codes/                      # Scripts MATLAB
│   ├── Q1_conversion_bitsymboles.m
│   ├── Q2_conversion_symbolebits.m
│   ├── Q3_genere_dirac.m
│   ├── Q4_create_filter.m
│   ├── Q5_filtre_emission.m
│   ├── Q6_energie_moyenne_bit.m
│   ├── Q7_emetteur.m
│   ├── test_Q1_Q2.m
│   ├── test_Q3.m
│   ├── test_Q4_Q5.m
│   ├── test_Q6.m
│   ├── test_Q7_emetteur.m
│   └── generer_toutes_images.m
├── images/                     # Images générées
├── rapport/                    # Rapport LaTeX
│   ├── Rapport_CommNum.tex
│   └── compiler_rapport.bat
├── generer_tout.bat           # Génération complète
├── generer_images.bat         # Images uniquement
├── INSTRUCTIONS.txt           # Guide détaillé
└── RESUME.txt                 # Résumé du projet
```

## 🚀 Utilisation rapide

### Génération automatique complète
```bash
generer_tout.bat
```
✅ Exécute tous les scripts MATLAB  
✅ Génère toutes les images  
✅ Compile le rapport PDF  
✅ Ouvre le PDF automatiquement

### Génération des images uniquement
```bash
generer_images.bat
```

### Compilation du rapport uniquement
```bash
cd rapport
compiler_rapport.bat
```

## 📝 Questions traitées

### Partie 1: L'émetteur
- **Q1:** Conversion bits → symboles (dictionnaires M-aire, antipolaire, unipolaire)
- **Q2:** Conversion symboles → bits (vérification)
- **Q3:** Génération du peigne de Dirac
- **Q4:** Filtres de mise en forme (NRZ, RZ, biphase, RCS)
- **Q5:** Signal émis par convolution
- **Q6:** Énergie moyenne par bit
- **Q7:** Émetteur complet

### Partie 2: Propriétés des signaux
- **Q8:** Analyse spectrale (DSP, bande de base)
- **Q9:** Influence du dictionnaire sur la largeur de bande
- **Q10:** Influence de M sur la largeur de bande

## 🔧 Fonctions principales

| Fonction | Description |
|----------|-------------|
| `conversion_bitsymboles` | Convertit bits en symboles |
| `conversion_symbolebits` | Convertit symboles en bits |
| `genere_dirac` | Génère le peigne de Dirac |
| `create_filter` | Crée le filtre de mise en forme |
| `filtre_emission` | Applique le filtre (convolution) |
| `energie_moyenne_bit` | Calcule E_bit |
| `emetteur` | Émetteur complet (intègre tout) |

## 📊 Résultats attendus

### Images générées
- `Q3_peigne_dirac.png` - Peigne de Dirac
- `Q4_Q5_filtres.png` - Comparaison des filtres
- `Q7_emetteur_complet.png` - Signal émis
- `Q7_comparaison_filtres.png` - Comparaison

### Rapport PDF
- Théorie complète
- Implémentations MATLAB
- Résultats et analyses
- Graphiques intégrés

## 📅 Informations pratiques

**Date limite:** 31 Mars 2026  
**Email:** guel.desire@gmail.com  
**Format:** nom_du_groupe.zip

## 👥 Groupe
- KABORE Wend-Benindo François
- SISSAO Sarata
- YÉ ELISÉ NIKIESSAN

## 👨‍🏫 Professeur
Dr KOURAOGO

## 📦 Dépendances
- MATLAB (Signal Processing Toolbox recommandée)
- LaTeX (MiKTeX ou TeX Live)
- Logos dans `../ressources/` (universite.png, ufrsea.png)

## ⚠️ Notes importantes
1. Copier les logos depuis `../ressources/` vers `ressources/`
2. Exécuter les scripts depuis le dossier `codes/`
3. Vérifier que toutes les images sont générées avant compilation
4. Le rapport utilise les mêmes logos que le projet principal
