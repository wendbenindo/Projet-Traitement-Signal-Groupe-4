% Test des fonctions Q1 et Q2
% Conversion bits/symboles et symboles/bits

clear all; close all; clc;

%% Paramètres
Db = 2;  % Débit binaire: 2 bits/sec
M = 2;   % Dictionnaire binaire (2 symboles)
method_mod = 'antipolaire';  % Dictionnaire {-1, 1}

% Génération d'un message binaire aléatoire
N = 10;  % 10 bits
dn = randi([0 1], 1, N);

fprintf('=== Test Q1 et Q2 ===\n');
fprintf('Message binaire original:\n');
disp(dn);

%% Test Q1: Conversion bits -> symboles
[ak, T, K] = conversion_bitsymboles(dn, Db, M, method_mod);

fprintf('\nAprès conversion bits -> symboles:\n');
fprintf('Nombre de symboles K = %d\n', K);
fprintf('Période symbole T = %.3f s\n', T);
fprintf('Symboles ak:\n');
disp(ak);

%% Test Q2: Conversion symboles -> bits
dn_reconverti = conversion_symbolebits(ak, M, method_mod);

fprintf('\nAprès reconversion symboles -> bits:\n');
disp(dn_reconverti);

%% Vérification
if isequal(dn(1:length(dn_reconverti)), dn_reconverti)
    fprintf('\n✓ Test réussi: le message binaire est correctement reconverti!\n');
else
    fprintf('\n✗ Erreur: le message reconverti ne correspond pas à l''original!\n');
end

%% Test avec différents dictionnaires
fprintf('\n=== Test avec M=4 (dictionnaire M-aire) ===\n');
M = 4;
method_mod = 'M-aire';
[ak4, T4, K4] = conversion_bitsymboles(dn, Db, M, method_mod);
fprintf('Symboles (M=4): ');
disp(ak4);
fprintf('Dictionnaire: {-3, -1, 1, 3}\n');
