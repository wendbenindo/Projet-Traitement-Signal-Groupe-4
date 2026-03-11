% Q2 - Conversion symboles/bits
% Fonction qui convertit une série de symboles en bits selon un dictionnaire

function [dn] = conversion_symbolebits(ak, M, method_mod)
    % Entrées:
    %   ak: série de symboles
    %   M: taille du dictionnaire (M = 2^m éléments)
    %   method_mod: dictionnaire utilisé
    %
    % Sortie:
    %   dn: série de bits initiale
    
    % Calcul de m (nombre de bits par symbole)
    m = log2(M);
    
    % Vérification que M est une puissance de 2
    if mod(m, 1) ~= 0
        error('M doit être une puissance de 2');
    end
    
    % Création du dictionnaire selon method_mod
    switch lower(method_mod)
        case 'm-aire'
            dict = -(M-1):2:(M-1);
            
        case 'antipolaire'
            if M ~= 2
                error('Le dictionnaire antipolaire nécessite M=2');
            end
            dict = [-1, 1];
            
        case 'unipolaire'
            if M ~= 2
                error('Le dictionnaire unipolaire nécessite M=2');
            end
            dict = [0, 1];
            
        otherwise
            error('method_mod non reconnu');
    end
    
    % Nombre de symboles
    K = length(ak);
    
    % Initialisation du vecteur de bits
    dn = zeros(1, K*m);
    
    % Conversion de chaque symbole en bits
    for i = 1:K
        % Trouver l'index du symbole dans le dictionnaire
        [~, idx] = min(abs(dict - ak(i)));
        
        % Convertir l'index (base 0) en binaire
        decimal_value = idx - 1;  % -1 car MATLAB indexe à partir de 1
        
        % Conversion décimal vers binaire (m bits)
        bits = de2bi(decimal_value, m, 'left-msb');
        
        % Stocker les bits
        dn((i-1)*m + 1 : i*m) = bits;
    end
end
