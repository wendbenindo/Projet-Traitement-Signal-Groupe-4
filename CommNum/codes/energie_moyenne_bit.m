% Q6 - Calcul de l'énergie moyenne par bit
% Fonction qui calcule l'énergie moyenne par bit pour un dictionnaire donné

function [E_bit] = energie_moyenne_bit(M, method_mod, E_he)
    % Entrées:
    %   M: taille du dictionnaire
    %   method_mod: type de dictionnaire
    %   E_he: énergie totale du filtre de mise en forme
    %
    % Sortie:
    %   E_bit: énergie moyenne par bit
    
    % Calcul de m (nombre de bits par symbole)
    m = log2(M);
    
    % Création du dictionnaire
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
    
    % Calcul de l'énergie moyenne par symbole
    % E_sym = (1/M) * sum(|ak|^2) * E_he
    E_sym = (1/M) * sum(abs(dict).^2) * E_he;
    
    % Énergie moyenne par bit
    % E_bit = E_sym / m
    E_bit = E_sym / m;
    
    % Formule théorique du cours:
    % E_bit = (1/(M*log2(M))) * sum_{k=0}^{M-1} |ak|^2 * E_he
end
