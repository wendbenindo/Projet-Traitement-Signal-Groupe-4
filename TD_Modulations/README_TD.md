# TD de Modulations

Travaux Dirigés sur les modulations AM et FM - UFR/SEA - Année 2025-2026

## 📁 Structure du projet

```
TD_Modulations/
├── codes_td/                       # Codes MATLAB
│   ├── td_ex1.m                    # Exercice 1 : Modulation AM
│   ├── td_ex2.m                    # Exercice 2 : Signal multi-fréquences
│   ├── td_ex3.m                    # Exercice 3 : Modulation FM
│   └── generer_toutes_images_td.m  # Script principal
│
├── images_td/                      # Images générées
│   ├── td_ex1_*.png
│   ├── td_ex2_*.png
│   └── td_ex3_*.png
│
├── Rapport_TD_Modulations.tex      # Rapport LaTeX
├── Rapport_TD_Modulations.pdf      # Rapport compilé
│
├── generer_images_td.bat           # Script génération images
├── compiler_td.bat                 # Script compilation LaTeX
│
└── README_TD.md                    # Ce fichier
```

## 🚀 Utilisation

### Étape 1 : Générer les images

**Méthode 1 (Recommandée)** : Double-cliquer sur `generer_images_td.bat`

**Méthode 2** : Dans MATLAB
```matlab
cd codes_td
generer_toutes_images_td
```

### Étape 2 : Compiler le rapport

Double-cliquer sur `compiler_td.bat`

## 📊 Exercices traités

### Exercice 1 : Modulation AM
- Analyse d'un signal AM
- Calcul fréquences latérales
- Taux de modulation
- Répartition des puissances
- Démodulation synchrone

### Exercice 2 : Signal multi-fréquences
- Signal composé de 3 fréquences (440, 560, 680 Hz)
- Modulation AM
- Filtrage passe-bande
- Démodulation cohérente

### Exercice 3 : Modulation FM
- Excursion en fréquence
- Indice de modulation
- Bande occupée (Carson)
- NFM vs WFM
- Démodulation

## 📈 Images générées

| Code | Images | Description |
|------|--------|-------------|
| td_ex1.m | 2 | Signal temporel + Spectre AM |
| td_ex2.m | 4 | Signal modulant + Spectre + Démodulation + Signal complet |
| td_ex3.m | 4 | Signal modulant + Signal FM + Fréquence instantanée + Comparaison |

**Total : 10 images**

## 🎯 Résultats clés

### Exercice 1
- Fréquence porteuse : ~600 kHz
- Taux de modulation : 87%
- Bande passante : ~10 kHz

### Exercice 2
- Fréquences : 440, 560, 680 Hz
- Porteuse : 250 MHz
- Démodulation synchrone cohérente

### Exercice 3
- Excursion : 2000 Hz
- Indice β : 1.0
- Bande Carson : 8 kHz
- Type : Transition NFM/WFM

## 👥 Groupe 4

UFR/SEA - Année académique 2025-2026

Encadré par : DR KOURAOGO
