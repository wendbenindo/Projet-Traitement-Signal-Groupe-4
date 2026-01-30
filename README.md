# Projet Traitement du Signal - Groupe 4

Projet complet de traitement du signal - UFR/SEA - Année académique 2025-2026

**Professeur :** DR KOURAOGO  
**Membres du groupe :** KABORE W.B François, SISSAO, Élise

---

## 📁 Structure complète du projet

```
Projet Traitement Signal Groupe 4/
│
├── 📂 TP2 - Modulation FM/
│   ├── codes/                          # 9 codes MATLAB
│   │   ├── code1.m                     # Signal modulant → image1.png
│   │   ├── code2.m                     # Signal FM vs modulant → image2.png
│   │   ├── code3.m                     # Variation déviation → image3.png
│   │   ├── code4.m                     # Analyse spectrale → image4.png
│   │   ├── code5.m                     # Démodulation FM → image5.png
│   │   ├── code6.m                     # Qualité démodulation → image6.png
│   │   ├── code7.m                     # Erreur de fréquence → image7.png
│   │   ├── code8.m                     # Démodulation bruités → image8.png
│   │   ├── code9.m                     # Analyse seuil SNR → image9.png
│   │   └── generer_toutes_images.m     # Script principal TP2
│   │
│   ├── images/                         # 9 images générées
│   │   ├── image1.png à image9.png
│   │
│   ├── Rapport_TP2_FM.tex             # Rapport LaTeX TP2
│   ├── Rapport_TP2_FM.pdf             # Rapport compilé TP2
│   ├── compiler.bat                    # Compilation LaTeX TP2
│   ├── compile_rapport.bat             # Compilation détaillée TP2
│   └── generer_images.bat              # Génération images TP2
│
├── 📂 TD_Modulations/                  # TD Modulations AM/FM
│   ├── codes_td/                       # 5 codes MATLAB + script
│   │   ├── td_ex1.m                    # Exercice 1 : AM → 2 images
│   │   ├── td_ex2.m                    # Exercice 2 : AM → 4 images
│   │   ├── td_ex3.m                    # Exercice 3 : FM → 4 images
│   │   ├── td_prob1.m                  # Problème 1 : GO/FM → 2 images
│   │   ├── td_prob2.m                  # Problème 2 : NFM/WFM → 2 images
│   │   └── generer_toutes_images_td.m  # Script principal TD
│   │
│   ├── images_td/                      # 14 images générées
│   │   ├── td_ex1_signal_temporel.png
│   │   ├── td_ex1_spectre.png
│   │   ├── td_ex2_signal_modulant.png
│   │   ├── td_ex2_signal_complet.png
│   │   ├── td_ex2_spectre_module.png
│   │   ├── td_ex2_demodulation.png
│   │   ├── td_ex3_signal_modulant.png
│   │   ├── td_ex3_signal_fm.png
│   │   ├── td_ex3_frequence_instantanee.png
│   │   ├── td_ex3_comparaison.png
│   │   ├── td_prob1_bandes.png
│   │   ├── td_prob1_comparaison.png
│   │   ├── td_prob2_comparaison.png
│   │   └── td_prob2_spectre_wfm.png
│   │
│   ├── Rapport_TD_Modulations.tex      # Rapport LaTeX TD
│   ├── Rapport_TD_Modulations.pdf      # Rapport compilé TD
│   ├── compiler_td.bat                 # Compilation LaTeX TD
│   ├── generer_images_td.bat           # Génération images TD
│   ├── README_TD.md                    # Documentation TD
│   ├── RESUME_TD.txt                   # Résumé TD
│   └── INSTRUCTIONS.txt                # Instructions TD
│
├── 📂 ressources/                      # Ressources communes
│   ├── universite.png                  # Logo université
│   ├── ufrsea.png                      # Logo UFR/SEA
│   └── PROJET DE SIGNAL 2025-2026/    # Énoncés PDF
│
├── 📄 Documentation/
│   ├── README.md                       # Ce fichier
│   ├── PROJET_COMPLET.md              # Vue d'ensemble complète
│   ├── GUIDE_RAPIDE.md                # Guide de démarrage rapide
│   ├── FORMULES.md                    # Formulaire complet
│   ├── TROUBLESHOOTING.md             # Résolution de problèmes
│   ├── CHANGELOG.md                   # Historique des modifications
│   ├── SOUMISSION.md                  # Guide de soumission
│   ├── RESUME_PROJET.txt              # Résumé du projet
│   └── .gitignore                     # Fichiers à ignorer
│
└── 📄 Fichiers de travail/
    ├── Preparation_Theorique.m         # Préparation théorique
    ├── Partie1_Code.m                  # Code partie 1
    └── nettoyer.bat                    # Nettoyage fichiers temp

```

## 🚀 Comment utiliser ce projet

### 📌 Vue d'ensemble

Le projet contient **deux parties principales** :
1. **TP2 - Modulation FM** : 9 codes MATLAB → 9 images → Rapport PDF
2. **TD Modulations** : 5 codes MATLAB → 14 images → Rapport PDF

---

### 🔧 Partie 1 : TP2 - Modulation FM

#### Étape 1 : Générer les images avec MATLAB

**Option A - Script automatique (Recommandé) :**
1. Double-cliquer sur `generer_images.bat`
2. Toutes les 9 images seront générées automatiquement

**Option B - Depuis MATLAB :**
1. Ouvrir MATLAB
2. Se placer dans le dossier `codes/`
3. Exécuter :
   ```matlab
   generer_toutes_images
   ```

**Option C - Codes individuels :**
```matlab
code1  % Génère image1.png
code2  % Génère image2.png
...
code9  % Génère image9.png
```

#### Étape 2 : Compiler le rapport TP2

**Méthode 1 (Recommandée) :** Double-cliquer sur `compiler.bat`

**Méthode 2 :** En ligne de commande :
```cmd
pdflatex Rapport_TP2_FM.tex
pdflatex Rapport_TP2_FM.tex
```

Le fichier `Rapport_TP2_FM.pdf` sera généré.

---

### 🔧 Partie 2 : TD Modulations

#### Étape 1 : Générer les images TD avec MATLAB

**Option A - Script automatique (Recommandé) :**
1. Aller dans le dossier `TD_Modulations/`
2. Double-cliquer sur `generer_images_td.bat`
3. Toutes les 14 images seront générées automatiquement

**Option B - Depuis MATLAB :**
1. Ouvrir MATLAB
2. Se placer dans `TD_Modulations/codes_td/`
3. Exécuter :
   ```matlab
   generer_toutes_images_td
   ```

**Option C - Codes individuels :**
```matlab
td_ex1   % Génère 2 images (Exercice 1)
td_ex2   % Génère 4 images (Exercice 2)
td_ex3   % Génère 4 images (Exercice 3)
td_prob1 % Génère 2 images (Problème 1)
td_prob2 % Génère 2 images (Problème 2)
```

#### Étape 2 : Compiler le rapport TD

**Méthode 1 (Recommandée) :**
1. Aller dans `TD_Modulations/`
2. Double-cliquer sur `compiler_td.bat`

**Méthode 2 :** En ligne de commande :
```cmd
cd TD_Modulations
pdflatex Rapport_TD_Modulations.tex
pdflatex Rapport_TD_Modulations.tex
```

Le fichier `Rapport_TD_Modulations.pdf` sera généré.

---

### 🎯 Workflow complet (tout générer)

Pour générer **tous les rapports** du projet :

1. **Générer images TP2 :**
   ```cmd
   generer_images.bat
   ```

2. **Compiler rapport TP2 :**
   ```cmd
   compiler.bat
   ```

3. **Générer images TD :**
   ```cmd
   cd TD_Modulations
   generer_images_td.bat
   ```

4. **Compiler rapport TD :**
   ```cmd
   compiler_td.bat
   ```

**Résultat :** Vous aurez 2 rapports PDF complets avec toutes les images !

## 📊 Correspondance Code → Image

### TP2 - Modulation FM (9 codes → 9 images)

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

### TD Modulations (5 codes → 14 images)

| Code | Description | Images générées |
|------|-------------|-----------------|
| td_ex1.m | Exercice 1 : Modulation AM | td_ex1_signal_temporel.png<br>td_ex1_spectre.png |
| td_ex2.m | Exercice 2 : Modulation AM complète | td_ex2_signal_modulant.png<br>td_ex2_signal_complet.png<br>td_ex2_spectre_module.png<br>td_ex2_demodulation.png |
| td_ex3.m | Exercice 3 : Modulation FM | td_ex3_signal_modulant.png<br>td_ex3_signal_fm.png<br>td_ex3_frequence_instantanee.png<br>td_ex3_comparaison.png |
| td_prob1.m | Problème 1 : Bandes GO/FM | td_prob1_bandes.png<br>td_prob1_comparaison.png |
| td_prob2.m | Problème 2 : NFM vs WFM | td_prob2_comparaison.png<br>td_prob2_spectre_wfm.png |

**Total : 23 images générées automatiquement**

## 📝 Contenu des rapports

### 📘 Rapport TP2 - Modulation FM (19 pages)

#### Préparation (Questions théoriques) ✅
1. Expression signal FM et fréquence instantanée
2. Cas sinusoïdal : fi, β, relation Kf et Δf
3. Différence NFM vs WFM
4. Bande de Carson
5. Question stéréo (cohérence espacement)

#### Partie I : Analyse théorique ✅
1. Génération signal modulant
2. Génération signal FM avec fmmod
3. Tracé signal modulé
4. Variation de la déviation
5. Spectre d'amplitude
6. Démodulation avec fmdemod
7. Comparaison signaux
8. Démodulation avec erreur de fréquence

#### Partie II : Démodulation avec bruit ✅
1. Génération signal FM bruité
2. Démodulation signal bruité
3. Analyse du seuil de démodulation
4. Question stéréo

#### Résultats clés TP2
- **Seuil de démodulation** : SNR ≥ 10-12 dB
- **Gain FM** : ≈ 18 dB pour β = 5
- **Bande de Carson** : BW = 2(Δf + fx)
- **Signal stéréo** : Espacement 200 kHz non cohérent avec BW = 256 kHz

---

### 📗 Rapport TD Modulations (19 pages)

#### Exercice 1 : Modulation AM ✅
- Calcul fréquences latérales, taux de modulation
- Bande de fréquences occupée
- Répartition des puissances (porteuse + bandes latérales)
- Nouveau taux de modulation avec amplitude modifiée
- **Raisonnement détaillé** avec étapes de calcul

#### Exercice 2 : Modulation AM complète ✅
- Génération signal modulant et porteuse
- Signal AM complet avec taux de modulation
- Analyse spectrale du signal modulé
- Démodulation et récupération du signal
- Comparaison signal original vs démodulé
- **Raisonnement détaillé** avec interprétations physiques

#### Exercice 3 : Modulation FM ✅
- Expression du signal FM de sortie
- Calcul excursion en fréquence
- Indice de modulation β
- Bande occupée (règle de Carson)
- Nouveau signal modulant (fréquence × 2, amplitude ÷ 3)
- Type de démodulation (cohérente vs non-cohérente)
- **Raisonnement détaillé** avec formules développées

#### Problème 1 : Modulation AM et FM ✅
- Tableau fréquences et longueurs d'onde (GO et FM)
- Nombre maximum d'émetteurs en GO
- Fonctions contenant le signal modulant (AM vs FM)
- **Raisonnement détaillé** avec :
  - Calculs étape par étape (conversions λ ↔ f)
  - Interprétations physiques (propagation GO vs FM)
  - Comparaison complète AM vs FM
  - Tableaux récapitulatifs

#### Problème 2 : Étude du modulateur FM ✅
**Partie 1 : NFM (β = 0,1)**
- Expression θ(t) et calcul de k
- Forme de s(t) avec développement de Bessel
- Puissance transmise (W, dB, dBm)
- Largeur du canal

**Partie 2 : WFM (β = 6)**
- Décomposition avec coefficients de Bessel
- Nombre de termes significatifs
- Largeur du canal (règle de Carson)
- Puissance transmise

**Raisonnement détaillé** avec :
- Théorie complète des fonctions de Bessel
- Développements mathématiques complets
- Calculs d'intégration détaillés
- Interprétations spectrales
- Tableaux de coefficients de Bessel
- Comparaisons NFM vs WFM

#### Résultats clés TD
- **NFM** : β = 0,1 → BW = 20 kHz (similaire à AM)
- **WFM** : β = 6 → BW = 140 kHz (règle de Carson)
- **Puissance FM** : Constante (10 mW = 10 dBm)
- **GO** : 150-285 kHz, λ = 1052-2000 m, 15 émetteurs max
- **FM** : 87,5-108 MHz, λ = 2,78-3,43 m

## 🛠️ Prérequis

- **MATLAB** (avec Signal Processing Toolbox)
- **MiKTeX** ou autre distribution LaTeX (pour compiler les rapports)
- **Windows** (scripts .bat fournis)

## 📊 Statistiques du projet

### TP2 - Modulation FM
- **9 codes MATLAB** (code1.m à code9.m)
- **9 images PNG** générées automatiquement
- **1 rapport PDF** de 19 pages
- **3 parties** : Préparation + Partie I + Partie II

### TD Modulations
- **5 codes MATLAB** (td_ex1.m à td_ex3.m + td_prob1.m, td_prob2.m)
- **14 images PNG** générées automatiquement
- **1 rapport PDF** de 19 pages
- **5 sections** : 3 exercices + 2 problèmes

### Total projet
- ✅ **14 codes MATLAB** fonctionnels
- ✅ **23 images** générées automatiquement
- ✅ **2 rapports PDF** complets (38 pages au total)
- ✅ **Documentation complète** (7 fichiers MD)
- ✅ **Scripts d'automatisation** (6 fichiers .bat)

## 🎓 Qualité académique

### Points forts du projet

✅ **Automatisation complète**
- Scripts MATLAB pour génération automatique des images
- Scripts batch pour compilation automatique des rapports
- Workflow reproductible en quelques clics

✅ **Raisonnement détaillé**
- Tous les exercices incluent des explications étape par étape
- Développements mathématiques complets
- Interprétations physiques des résultats
- Pas de "placage" de résultats

✅ **Présentation professionnelle**
- Logos université et UFR/SEA
- Mise en page soignée avec encadrements
- Graphiques MATLAB de haute qualité
- Structure claire et cohérente

✅ **Documentation exhaustive**
- README complet avec architecture du projet
- Guides de démarrage rapide
- Formulaires de référence
- Troubleshooting

## 📂 Fichiers de documentation

| Fichier | Description |
|---------|-------------|
| **README.md** | Vue d'ensemble complète du projet (ce fichier) |
| **PROJET_COMPLET.md** | Documentation détaillée de l'architecture |
| **GUIDE_RAPIDE.md** | Guide de démarrage rapide |
| **FORMULES.md** | Formulaire complet AM/FM |
| **TROUBLESHOOTING.md** | Résolution des problèmes courants |
| **CHANGELOG.md** | Historique des modifications |
| **SOUMISSION.md** | Guide de soumission du projet |
| **TD_Modulations/README_TD.md** | Documentation spécifique TD |
| **TD_Modulations/RESUME_TD.txt** | Résumé rapide TD |
| **TD_Modulations/INSTRUCTIONS.txt** | Instructions TD |

## 🚨 Résolution de problèmes

### Problème : Images non générées
**Solution :** Vérifier que MATLAB est installé avec Signal Processing Toolbox
```matlab
ver  % Vérifier les toolboxes installées
```

### Problème : Erreur compilation LaTeX
**Solution :** Vérifier que MiKTeX est installé et à jour
```cmd
pdflatex --version
```

### Problème : "Index exceeds array elements"
**Solution :** Les codes ont été corrigés pour gérer les limites d'indices

Pour plus de détails, consulter **TROUBLESHOOTING.md**

## ✅ Statut du projet

### TP2 - Modulation FM : ✅ 100% COMPLET
- ✅ 9 codes MATLAB fonctionnels
- ✅ 9 images générées automatiquement
- ✅ Rapport PDF complet (19 pages)
- ✅ Toutes les questions théoriques et pratiques traitées
- ✅ Analyse du seuil de démodulation complète

### TD Modulations : ✅ 100% COMPLET
- ✅ 5 codes MATLAB fonctionnels
- ✅ 14 images générées automatiquement
- ✅ Rapport PDF complet (19 pages)
- ✅ 3 exercices avec raisonnement détaillé
- ✅ 2 problèmes avec développements mathématiques complets
- ✅ Aucun "placage" de résultats, tout est expliqué

### Documentation : ✅ 100% COMPLÈTE
- ✅ README principal mis à jour
- ✅ 7 fichiers de documentation
- ✅ Scripts d'automatisation fonctionnels
- ✅ Architecture claire et organisée

**🎉 PROJET 100% TERMINÉ ET PRÊT À SOUMETTRE ! 🎉**

## 👥 Groupe 4

**Professeur :** DR KOURAOGO

**Membres du groupe :**
- KABORE W.B François
- SISSAO
- Élise

**Institution :** UFR/SEA  
**Année académique :** 2025-2026

## 📞 Support

Pour toute question sur le projet :
1. Consulter **GUIDE_RAPIDE.md** pour démarrer rapidement
2. Consulter **TROUBLESHOOTING.md** pour les problèmes courants
3. Consulter **FORMULES.md** pour les formules de référence

## 📄 Licence

Projet académique - TP de Traitement du Signal  
UFR/SEA - Université - 2025-2026

---

**Dernière mise à jour :** Janvier 2026  
**Version :** 2.0 (TP2 + TD complets)
