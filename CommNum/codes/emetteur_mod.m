% Q19 - Émetteur modulé
% Fonction qui génère un signal modulé avec I(t) et Q(t)

function [e, t_e, alphak, K, T, E_bit, I, Q] = emetteur_mod(dn, Db, Fs, M, method_mod, method_fil, f0)
    % Entrées:
    %   dn: série de bits
    %   Db: débit binaire
    %   Fs: fréquence d'échantillonnage
    %   M: taille du dictionnaire
    %   method_mod: type de modulation ('ASK', 'BPSK', 'QPSK', 'QAM', etc.)
    %   method_fil: type de filtre
    %   f0: fréquence fondamentale (porteuse)
    %
    % Sorties:
    %   e: signal modulé e(t)
    %   t_e: vecteur temps
    %   alphak: symboles complexes
    %   K: nombre de symboles
    %   T: période symbole
    %   E_bit: énergie par bit
    %   I: composante en phase I(t)
    %   Q: composante en quadrature Q(t)
    
    fprintf('\n=== ÉMETTEUR MODULÉ ===\n');
    fprintf('Type de modulation: %s\n', method_mod);
    fprintf('Fréquence porteuse: %.2f Hz\n', f0);
    
    % Étape 1: Conversion bits → symboles complexes
    [alphak, T, K] = conversion_bitsymboles_complexes(dn, Db, M, method_mod);
    
    % Étape 2: Séparer partie réelle et imaginaire
    ak_I = real(alphak);  % Composante en phase
    ak_Q = imag(alphak);  % Composante en quadrature
    
    % Étape 3: Génération des peignes de Dirac pour I et Q
    [a_I, t_a] = genere_dirac(ak_I, K, T, Fs);
    [a_Q, ~] = genere_dirac(ak_Q, K, T, Fs);
    
    % Étape 4: Filtrage de mise en forme
    [I, ~, ~, ~] = filtre_emission(a_I, t_a, K, T, Fs, method_fil);
    [Q, t_Q, ~, ~] = filtre_emission(a_Q, t_a, K, T, Fs, method_fil);
    
    % Étape 5: Modulation
    % e(t) = I(t)*cos(2πf0t) - Q(t)*sin(2πf0t)
    t_e = t_a;
    porteuse_cos = cos(2*pi*f0*t_e);
    porteuse_sin = sin(2*pi*f0*t_e);
    
    e = I .* porteuse_cos - Q .* porteuse_sin;
    
    % Calcul de l'énergie par bit
    t_he = 0 : 1/Fs : T - 1/Fs;
    [~, E_he] = create_filter(t_he, T, method_fil);
    E_bit = energie_moyenne_bit(M, 'M-aire', E_he);
    
    fprintf('Nombre de symboles: %d\n', K);
    fprintf('Énergie par bit: %.6f\n', E_bit);
end

function [alphak, T, K] = conversion_bitsymboles_complexes(dn, Db, M, method_mod)
    % Conversion bits → symboles complexes selon le type de modulation
    
    m = log2(M);
    T = m / Db;
    K = floor(length(dn) / m);
    dn = dn(1:K*m);
    
    bits_grouped = reshape(dn, m, K)';
    decimal_values = bi2de(bits_grouped, 'left-msb');
    
    switch lower(method_mod)
        case 'bpsk'
            % BPSK: {-1, 1} (réel uniquement)
            dict = [-1, 1];
            alphak = dict(decimal_values + 1);
            
        case 'qpsk'
            % QPSK: 4 symboles complexes
            dict = [1+1i, -1+1i, -1-1i, 1-1i] / sqrt(2);
            alphak = dict(decimal_values + 1);
            
        case '8psk'
            % 8-PSK: 8 symboles sur un cercle
            angles = (0:7) * 2*pi/8 + pi/8;
            dict = exp(1i * angles);
            alphak = dict(decimal_values + 1);
            
        case '16qam'
            % 16-QAM: grille 4x4
            dict = [-3-3i, -3-1i, -3+1i, -3+3i, ...
                    -1-3i, -1-1i, -1+1i, -1+3i, ...
                     1-3i,  1-1i,  1+1i,  1+3i, ...
                     3-3i,  3-1i,  3+1i,  3+3i] / sqrt(10);
            alphak = dict(decimal_values + 1);
            
        otherwise
            % Par défaut: M-aire réel
            dict = -(M-1):2:(M-1);
            alphak = dict(decimal_values + 1);
    end
end
