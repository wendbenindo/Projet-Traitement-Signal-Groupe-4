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
fprintf('[1/10] Exécution de code1.m...\n');
run('code1');
close all;

fprintf('[2/10] Exécution de code2.m...\n');
run('code2');
close all;

fprintf('[3/10] Exécution de code3.m...\n');
run('code3');
close all;

fprintf('[4/10] Exécution de code4.m...\n');
run('code4');
close all;

fprintf('[5/10] Exécution de code5.m...\n');
run('code5');
close all;

fprintf('[6/10] Exécution de code6.m...\n');
run('code6');
close all;

fprintf('[7/10] Exécution de code7.m...\n');
run('code7');
close all;

fprintf('[8/10] Exécution de code7b.m...\n');
run('code7b');
close all;

fprintf('[9/10] Exécution de code8.m...\n');
run('code8');
close all;

fprintf('[10/10] Exécution de code9.m...\n');
run('code9');
close all;

fprintf('\n========================================\n');
fprintf('  GÉNÉRATION TERMINÉE !\n');
fprintf('========================================\n');
fprintf('\nToutes les images ont été générées dans le dossier images/\n');
fprintf('Vous pouvez maintenant compiler le rapport LaTeX.\n');
