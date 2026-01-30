%% Script Principal - Génération de toutes les images
% Ce script exécute tous les codes et génère toutes les images du rapport

clc;

fprintf('========================================\n');
fprintf('  GÉNÉRATION DES IMAGES DU RAPPORT\n');
fprintf('========================================\n\n');

% Vérifier que le dossier images existe
if ~exist('../images', 'dir')
    mkdir('../images');
    fprintf('Dossier images créé.\n\n');
end

% Exécuter chaque code individuellement
fprintf('[1/9] Exécution de code1.m...\n');
run('code1');
close all;

fprintf('[2/9] Exécution de code2.m...\n');
run('code2');
close all;

fprintf('[3/9] Exécution de code3.m...\n');
run('code3');
close all;

fprintf('[4/9] Exécution de code4.m...\n');
run('code4');
close all;

fprintf('[5/9] Exécution de code5.m...\n');
run('code5');
close all;

fprintf('[6/9] Exécution de code6.m...\n');
run('code6');
close all;

fprintf('[7/9] Exécution de code7.m...\n');
run('code7');
close all;

fprintf('[8/9] Exécution de code8.m...\n');
run('code8');
close all;

fprintf('[9/9] Exécution de code9.m...\n');
run('code9');
close all;

fprintf('\n========================================\n');
fprintf('  GÉNÉRATION TERMINÉE !\n');
fprintf('========================================\n');
fprintf('\nToutes les images ont été générées dans le dossier images/\n');
fprintf('Vous pouvez maintenant compiler le rapport LaTeX.\n');
