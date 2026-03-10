% Q1 - Conversion bits/symboles
% Fonction qui convertit une série de bits en symboles selon un dictionnaire M-aire

function [ak, T, K] = conversion_bitsymboles(dn, Db, M, method_mod)
    % Entrées:
    %   dn: série de bits en entrée
    %   Db: débit binaire (bits/sec)
    %   M: taille du dictionnaire (M = 2^m éléments)
    %   method_mod: dictionnaire à utiliser ('M-aire', 'antipolaire', etc.)
    %
    % Sorties:
    %   ak: série de symboles
    %   T: période symbole (secondes)
    %   K: nombre de symboles
    
    % Calcul de m (nombre de bits par symbole)
    m = log2(M);
    
    % Vérification que M est une puissance de 2
    if mod(m, 1) ~= 0
        error('M doit être une puissance de 2');
    end
    
    % Calcul de la période symbole
    T = m / Db;
    
    % Nombre total de bits
    N = length(dn);
    
    % Nombre de symboles (arrondi vers le bas)
    K = floor(N / m);
    
    % Tronquer dn pour avoir un multiple de m bits
    dn = dn(1:K*m);
    
    % Reshape pour grouper les bits par m
    bits_grouped = reshape(dn, m, K)';
    
    % Conversion binaire vers décimal pour chaque groupe
    decimal_values = bi2de(bits_grouped, 'left-msb');
    
    % Création du dictionnaire selon method_mod
    switch lower(method_mod)
        case 'm-aire'
            % Dictionnaire M-aire: {-(M-1), -(M-3), ..., -1, 1, 3, ..., M-1}
            dict = -(M-1):2:(M-1);
            
        case 'antipolaire'
            % Dictionnaire antipolaire: {-1, 1} pour M=2
            if M ~= 2
                error('Le dictionnaire antipolaire nécessite M=2');
            end
            dict = [-1, 1];
            
        case 'unipolaire'
            % Dictionnaire unipolaire: {0, 1} pour M=2
            if M ~= 2
                error('Le dictionnaire unipolaire nécessite M=2');
            end
            dict = [0, 1];
            
        otherwise
            error('method_mod non reconnu. Utilisez: M-aire, antipolaire, ou unipolaire');
    end
    
    % Mapping des valeurs décimales vers les symboles
    ak = dict(decimal_values + 1);  % +1 car MATLAB indexe à partir de 1
end
