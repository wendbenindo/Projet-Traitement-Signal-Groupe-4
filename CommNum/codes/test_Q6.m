% Test Q6 - Énergie moyenne par bit

clear all; close all; clc;

fprintf('=== Test Q6 - Énergie moyenne par bit ===\n\n');

%% Paramètres
Fs = 100;
T = 0.5;
t_he = 0 : 1/Fs : T - 1/Fs;

%% Test pour différents dictionnaires
dictionnaires = {'M-aire', 'antipolaire', 'unipolaire'};
M_values = [2, 4, 8];
filtres = {'NRZ', 'RZ', 'biphase'};

fprintf('Calcul de E_bit pour différentes configurations:\n\n');
fprintf('%-15s %-10s %-10s %-15s\n', 'Dictionnaire', 'M', 'Filtre', 'E_bit');
fprintf('%s\n', repmat('-', 1, 55));

for dict_idx = 1:length(dictionnaires)
    method_mod = dictionnaires{dict_idx};
    
    % Déterminer les valeurs de M valides pour ce dictionnaire
    if strcmp(method_mod, 'antipolaire') || strcmp(method_mod, 'unipolaire')
        M_test = 2;  % Seulement M=2 pour ces dictionnaires
    else
        M_test = M_values;
    end
    
    for M = M_test
        for fil_idx = 1:length(filtres)
            method_fil = filtres{fil_idx};
            
            % Créer le filtre et calculer son énergie
            [he, E_he] = create_filter(t_he, T, method_fil);
            
            % Calculer l'énergie moyenne par bit
            E_bit = energie_moyenne_bit(M, method_mod, E_he);
            
            fprintf('%-15s %-10d %-10s %-15.6f\n', method_mod, M, method_fil, E_bit);
        end
    end
    fprintf('\n');
end

%% Vérification avec E_he = 1
fprintf('\n=== Vérification théorique (E_he = 1) ===\n\n');
E_he = 1;

for M = [2, 4, 8]
    E_bit = energie_moyenne_bit(M, 'M-aire', E_he);
    fprintf('M = %d: E_bit = %.6f\n', M, E_bit);
end

fprintf('\n✓ Test Q6 terminé\n');
