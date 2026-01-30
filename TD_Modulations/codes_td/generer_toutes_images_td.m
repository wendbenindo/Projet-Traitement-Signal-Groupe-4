%% Script Principal - Génération de toutes les images des TD
% Ce script exécute tous les codes TD et génère toutes les images

clc;

fprintf('========================================\n');
fprintf('  GÉNÉRATION DES IMAGES - TD MODULATIONS\n');
fprintf('========================================\n\n');

% Vérifier que le dossier images_td existe
if ~exist('../images_td', 'dir')
    mkdir('../images_td');
    fprintf('Dossier images_td créé.\n\n');
end

% Exécuter chaque exercice et problème
fprintf('[1/5] Exécution de td_ex1.m (Exercice 1 : Modulation AM)...\n');
run('td_ex1');
pause(1);

fprintf('\n[2/5] Exécution de td_ex2.m (Exercice 2 : Signal multi-fréquences)...\n');
run('td_ex2');
pause(1);

fprintf('\n[3/5] Exécution de td_ex3.m (Exercice 3 : Modulation FM)...\n');
run('td_ex3');
pause(1);

fprintf('\n[4/5] Exécution de td_prob1.m (Problème 1 : AM et FM)...\n');
run('td_prob1');
pause(1);

fprintf('\n[5/5] Exécution de td_prob2.m (Problème 2 : Étude modulateur FM)...\n');
run('td_prob2');
pause(1);

fprintf('\n========================================\n');
fprintf('  GÉNÉRATION TERMINÉE !\n');
fprintf('========================================\n');
fprintf('\nToutes les images ont été générées dans le dossier images_td/\n');
fprintf('Vous pouvez maintenant compiler le rapport LaTeX.\n\n');

fprintf('Images générées :\n');
fprintf('  Exercice 1 : 2 images\n');
fprintf('  Exercice 2 : 4 images\n');
fprintf('  Exercice 3 : 4 images\n');
fprintf('  Problème 1 : 2 images\n');
fprintf('  Problème 2 : 2 images\n');
fprintf('  TOTAL : 14 images\n\n');
