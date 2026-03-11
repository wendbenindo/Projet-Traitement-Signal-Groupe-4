% Q15 - Récepteur complet
% Fonction qui réalise toutes les étapes du récepteur

function [dn_hat, ak_hat] = recepteur(y, t_y, T, K, Fs, M, method_fil)
    % Entrées:
    %   y: signal bruité reçu
    %   t_y: vecteur temps
    %   T: période symbole
    %   K: nombre de symboles
    %   Fs: fréquence d'échantillonnage
    %   M: taille du dictionnaire
    %   method_fil: type de filtre
    %
    % Sorties:
    %   dn_hat: estimation du message binaire
    %   ak_hat: estimation des symboles
    
    method_mod = 'M-aire';  % Dictionnaire par défaut
    
    fprintf('\n=== RÉCEPTEUR COMPLET ===\n');
    
    % Étape 1: Filtrage de réception (Q12)
    [z, t_z, E_hr] = filtre_reception(y, t_y, T, Fs, method_fil);
    
    % Étape 2: Échantillonnage (Q13)
    [zk] = echantillonnage(z, t_z, T, K, Fs);
    
    % Étape 3: Décision (Q14)
    [ak_hat] = decision(zk, E_hr, M, method_mod);
    
    % Étape 4: Décodage - Conversion symboles → bits (Q2)
    [dn_hat] = conversion_symbolebits(ak_hat, M, method_mod);
    
    fprintf('\n=== Récepteur terminé ===\n');
    fprintf('Nombre de symboles estimés: %d\n', K);
    fprintf('Nombre de bits estimés: %d\n', length(dn_hat));
end
