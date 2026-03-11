% Q21 - Récepteur pour signal modulé
% Fonction qui démodule et récupère le message binaire

function [dn_hat, alphak_hat, ak_hat] = recepteur_mod(r, t_r, T, K, Fs, M, method_fil, method_mod, f0)
    % Entrées:
    %   r: signal bruité reçu
    %   t_r: vecteur temps
    %   T: période symbole
    %   K: nombre de symboles
    %   Fs: fréquence d'échantillonnage
    %   M: taille du dictionnaire
    %   method_fil: type de filtre
    %   method_mod: type de modulation
    %   f0: fréquence porteuse
    %
    % Sorties:
    %   dn_hat: estimation du message binaire
    %   alphak_hat: estimation des symboles complexes
    %   ak_hat: estimation des symboles (pour compatibilité)
    
    fprintf('\n=== RÉCEPTEUR MODULÉ ===\n');
    
    % Étape 1: Démodulation
    % Multiplier par 2*cos(2πf0t) et 2*sin(2πf0t)
    porteuse_cos = 2 * cos(2*pi*f0*t_r);
    porteuse_sin = 2 * sin(2*pi*f0*t_r);
    
    r_I = r .* porteuse_cos;
    r_Q = -r .* porteuse_sin;
    
    % Étape 2: Filtrage passe-bas (filtre de réception)
    [z_I, ~, E_hr] = filtre_reception(r_I, t_r, T, Fs, method_fil);
    [z_Q, t_z, ~] = filtre_reception(r_Q, t_r, T, Fs, method_fil);
    
    % Étape 3: Échantillonnage
    [zk_I] = echantillonnage(z_I, t_z, T, K, Fs);
    [zk_Q] = echantillonnage(z_Q, t_z, T, K, Fs);
    
    % Étape 4: Décision sur les symboles complexes
    zk_complex = (zk_I + 1i*zk_Q) / E_hr;
    [alphak_hat] = decision_complexe(zk_complex, M, method_mod);
    
    % Étape 5: Décodage - Conversion symboles → bits
    [dn_hat] = conversion_symbolebits_complexes(alphak_hat, M, method_mod);
    
    % Pour compatibilité
    ak_hat = real(alphak_hat);
    
    fprintf('Récepteur modulé terminé\n');
    fprintf('Nombre de bits estimés: %d\n', length(dn_hat));
end

function [alphak_hat] = decision_complexe(zk, M, method_mod)
    % Décision sur symboles complexes
    
    K = length(zk);
    alphak_hat = zeros(1, K);
    
    % Créer le dictionnaire selon la modulation
    switch lower(method_mod)
        case 'bpsk'
            dict = [-1, 1];
            for k = 1:K
                [~, idx] = min(abs(dict - real(zk(k))));
                alphak_hat(k) = dict(idx);
            end
            
        case 'qpsk'
            dict = [1+1i, -1+1i, -1-1i, 1-1i] / sqrt(2);
            for k = 1:K
                [~, idx] = min(abs(dict - zk(k)));
                alphak_hat(k) = dict(idx);
            end
            
        case '8psk'
            angles = (0:7) * 2*pi/8 + pi/8;
            dict = exp(1i * angles);
            for k = 1:K
                [~, idx] = min(abs(dict - zk(k)));
                alphak_hat(k) = dict(idx);
            end
            
        case '16qam'
            dict = [-3-3i, -3-1i, -3+1i, -3+3i, ...
                    -1-3i, -1-1i, -1+1i, -1+3i, ...
                     1-3i,  1-1i,  1+1i,  1+3i, ...
                     3-3i,  3-1i,  3+1i,  3+3i] / sqrt(10);
            for k = 1:K
                [~, idx] = min(abs(dict - zk(k)));
                alphak_hat(k) = dict(idx);
            end
            
        otherwise
            % Par défaut: réel
            dict = -(M-1):2:(M-1);
            for k = 1:K
                [~, idx] = min(abs(dict - real(zk(k))));
                alphak_hat(k) = dict(idx);
            end
    end
end

function [dn] = conversion_symbolebits_complexes(alphak, M, method_mod)
    % Conversion symboles complexes → bits
    
    m = log2(M);
    K = length(alphak);
    dn = zeros(1, K*m);
    
    % Créer le dictionnaire
    switch lower(method_mod)
        case 'bpsk'
            dict = [-1, 1];
        case 'qpsk'
            dict = [1+1i, -1+1i, -1-1i, 1-1i] / sqrt(2);
        case '8psk'
            angles = (0:7) * 2*pi/8 + pi/8;
            dict = exp(1i * angles);
        case '16qam'
            dict = [-3-3i, -3-1i, -3+1i, -3+3i, ...
                    -1-3i, -1-1i, -1+1i, -1+3i, ...
                     1-3i,  1-1i,  1+1i,  1+3i, ...
                     3-3i,  3-1i,  3+1i,  3+3i] / sqrt(10);
        otherwise
            dict = -(M-1):2:(M-1);
    end
    
    % Conversion
    for i = 1:K
        [~, idx] = min(abs(dict - alphak(i)));
        decimal_value = idx - 1;
        bits = de2bi(decimal_value, m, 'left-msb');
        dn((i-1)*m + 1 : i*m) = bits;
    end
end
