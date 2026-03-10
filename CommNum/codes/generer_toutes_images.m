% Script principal pour générer toutes les images du projet
% Communications Numériques - Transmission en bande de base

clear all; close all; clc;

fprintf('========================================\n');
fprintf('  Génération de toutes les images\n');
fprintf('  Projet Communications Numériques\n');
fprintf('========================================\n\n');

%% Créer le dossier images s'il n'existe pas
if ~exist('../images', 'dir')
    mkdir('../images');
    fprintf('✓ Dossier images/ créé\n\n');
end

%% Test Q1 et Q2
fprintf('--- Exécution: Test Q1 et Q2 ---\n');
try
    test_Q1_Q2;
    fprintf('✓ Q1 et Q2: OK\n\n');
catch ME
    fprintf('✗ Erreur Q1-Q2: %s\n\n', ME.message);
end

%% Test Q3
fprintf('--- Exécution: Test Q3 ---\n');
try
    test_Q3;
    fprintf('✓ Q3: OK\n\n');
catch ME
    fprintf('✗ Erreur Q3: %s\n\n', ME.message);
end

%% Test Q4 et Q5
fprintf('--- Exécution: Test Q4 et Q5 ---\n');
try
    test_Q4_Q5;
    fprintf('✓ Q4 et Q5: OK\n\n');
catch ME
    fprintf('✗ Erreur Q4-Q5: %s\n\n', ME.message);
end

%% Test Q6
fprintf('--- Exécution: Test Q6 ---\n');
try
    test_Q6;
    fprintf('✓ Q6: OK\n\n');
catch ME
    fprintf('✗ Erreur Q6: %s\n\n', ME.message);
end

%% Test Q7
fprintf('--- Exécution: Test Q7 ---\n');
try
    test_Q7_emetteur;
    fprintf('✓ Q7: OK\n\n');
catch ME
    fprintf('✗ Erreur Q7: %s\n\n', ME.message);
end

fprintf('========================================\n');
fprintf('  Génération terminée!\n');
fprintf('  Vérifiez le dossier images/\n');
fprintf('========================================\n');
