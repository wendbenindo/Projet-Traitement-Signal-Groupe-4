% Q7 - Émetteur complet
% Fonction qui réalise toutes les étapes de l'émetteur

function [s, t_s, x, ak, K, T, E_bit] = emetteur(dn, Db, Fs, M, method_fil)
    % Entrées:
    %   dn: série de bits d'entrée
    %   Db: débit binaire (bits/sec)
    %   Fs: fréquence d'échantillonnage (Hz)
    %   M: taille du dictionnaire
    %   method_fil: type de filtre de mise en forme
    %
    % Sorties:
    %   s: signal émis x(t)
    %   t_s: vecteur temps
    %   x: signal émis (alias de s)
    %   ak: série de symboles
    %   K: nombre de symboles
    %   T: période symbole
    %   E_bit: énergie moyenne par bit
    
    % Étape 1: Conversion bits/symboles (Q1)
    method_mod = 'M-aire';  % Utiliser le dictionnaire M-aire par défaut
    [ak, T, K] = conversion_bitsymboles(dn, Db, M, method_mod);
    
    % Étape 2: Génération du peigne de Dirac (Q3)
    [a, t_a] = genere_dirac(ak, K, T, Fs);
    
    % Étape 3: Création du filtre de mise en forme (Q4)
    t_he = 0 : 1/Fs : T - 1/Fs;
    [he, E_he] = create_filter(t_he, T, method_fil);
    
    % Étape 4: Convolution pour obtenir le signal émis (Q5)
    [s, t_s, x, ~] = filtre_emission(a, t_a, K, T, Fs, method_fil);
    
    % Étape 5: Calcul de l'énergie moyenne par bit (Q6)
    E_bit = energie_moyenne_bit(M, method_mod, E_he);
    
    fprintf('=== Émetteur ===\n');
    fprintf('Nombre de bits: %d\n', length(dn));
    fprintf('Nombre de symboles: %d\n', K);
    fprintf('Période symbole T: %.6f s\n', T);
    fprintf('Énergie moyenne par bit: %.6f\n', E_bit);
    fprintf('Durée du signal: %.6f s\n', t_s(end));
end
