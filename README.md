# TP 2 : Modulation FM

Projet de traitement du signal - UFR/SEA - Année académique 2025-2026

## 📁 Structure du projet

```
Projet Traitement Signal Groupe 4/
│
├── codes/                          # Codes MATLAB
│   ├── code1.m                     # Génération du signal modulant → image1.png
│   ├── code2.m                     # Signal FM vs modulant → image2.png
│   ├── code3.m                     # Variation de déviation → image3.png
│   ├── code4.m                     # Analyse spectrale → image4.png
│   ├── code5.m                     # Démodulation FM → image5.png
│   ├── code6.m                     # Qualité démodulation → image6.png
│   ├── code7.m                     # Erreur de fréquence → image7.png
│   ├── code8.m                     # Démodulation signaux bruités → image8.png
│   ├── code9.m                     # Analyse seuil SNR → image9.png
│   └── generer_toutes_images.m     # Script principal
│
├── images/                         # Images générées par les codes
│   ├── image1.png
│   ├── image2.png
│   └── ...
│
├── ressources/                     # Documents du TP
│
├── Rapport_TP2_FM.tex             # Rapport LaTeX
├── Rapport_TP2_FM.pdf             # Rapport compilé
│
├── compiler.bat                    # Script de compilation LaTeX (simple)
├── compile_rapport.bat             # Script de compilation LaTeX (détaillé)
│
└── README.md                       # Ce fichier

```

## 🚀 Comment utiliser ce projet

### Étape 1 : Générer les images avec MATLAB

1. Ouvrir MATLAB
2. Se placer dans le dossier `codes/`
3. Exécuter le script principal :
   ```matlab
   generer_toutes_images
   ```
4. Toutes les images seront générées dans le dossier `images/`

**OU** exécuter les codes individuellement :
```matlab
code1  % Génère image1.png
code2  % Génère image2.png
...
```

### Étape 2 : Compiler le rapport LaTeX

**Méthode 1 (Recommandée) :** Double-cliquer sur `compiler.bat`

**Méthode 2 :** En ligne de commande :
```cmd
pdflatex Rapport_TP2_FM.tex
pdflatex Rapport_TP2_FM.tex
```

Le fichier `Rapport_TP2_FM.pdf` sera généré automatiquement.

## 📊 Correspondance Code → Image

| Code | Description | Image générée |
|------|-------------|---------------|
| code1.m | Signal modulant sinusoïdal | image1.png |
| code2.m | Comparaison signal modulant vs FM | image2.png |
| code3.m | Effet de la variation de déviation | image3.png |
| code4.m | Spectres d'amplitude FM | image4.png |
| code5.m | Démodulation FM | image5.png |
| code6.m | Analyse qualité démodulation | image6.png |
| code7.m | Erreur de fréquence | image7.png |
| code8.m | Démodulation signaux bruités | image8.png |
| code9.m | Analyse seuil SNR | image9.png |

## 📝 Contenu du rapport

### Préparation (Questions théoriques) ✅
1. Expression signal FM et fréquence instantanée
2. Cas sinusoïdal : fi, β, relation Kf et Δf
3. Différence NFM vs WFM
4. Bande de Carson
5. Question stéréo (cohérence espacement)

### Partie I : Analyse théorique ✅
1. Génération signal modulant
2. Génération signal FM avec fmmod
3. Tracé signal modulé
4. Variation de la déviation
5. Spectre d'amplitude
6. Démodulation avec fmdemod
7. Comparaison signaux
8. Démodulation avec erreur de fréquence

### Partie II : Démodulation avec bruit ✅
1. Génération signal FM bruité
2. Démodulation signal bruité
3. Analyse du seuil de démodulation
4. Question stéréo

## 🎯 Résultats clés

- **Seuil de démodulation** : SNR ≥ 10-12 dB
- **Gain FM** : ≈ 18 dB pour β = 5
- **Bande de Carson** : BW = 2(Δf + fx)
- **Signal stéréo** : Espacement 200 kHz non cohérent avec BW = 256 kHz

## 🛠️ Prérequis

- **MATLAB** (avec Signal Processing Toolbox)
- **MiKTeX** ou autre distribution LaTeX
- **Windows** (scripts .bat fournis)

## 📊 Améliorations apportées

### Nouveaux codes
- **code8.m amélioré** : Démodulation des signaux bruités avec analyse MSE/SNR
- **code9.m nouveau** : Analyse complète du seuil de démodulation (0-30 dB)

### Rapport LaTeX complété
- Partie II entièrement rédigée avec analyses détaillées
- Graphiques et explications pour tous les résultats
- Question stéréo répondue avec calculs

### Fichiers de configuration
- **.gitignore** : Ignore fichiers temporaires LaTeX, MATLAB, système
- **CHANGELOG.md** : Documentation des améliorations
- **compiler.bat** : Script de compilation amélioré

## ✅ Statut du projet

**Projet 100% complet !** Toutes les questions théoriques et pratiques sont traitées.

## 👥 Groupe 4

UFR/SEA - Année académique 2025-2026

## 📄 Licence

Projet académique - TP de Traitement du Signal
