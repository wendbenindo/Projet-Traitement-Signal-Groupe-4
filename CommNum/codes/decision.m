% Q14 - Décision
% Fonction qui estime les symboles à partir des échantillons

function [ak_hat] = decision(zk, E_hr, M, method_mod)
    % Entrées:
    %   zk: vecteur des échantillons
    %   E_hr: énergie du filtre de réception
    %   M: taille du dictionnaire
    %   method_mod: type de dictionnaire
    %
    % Sortie:
    %   ak_hat: estimation des symboles
    
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
    
    % Nombre d'échantillons
    K = length(zk);
    
    % Initialisation du vecteur de décision
    ak_hat = zeros(1, K);
    
    % Décision pour chaque échantillon
    % Le symbole détecté est celui du dictionnaire le plus proche
    % de la valeur zk / E_hr (au sens de la distance euclidienne)
    for k = 1:K
        % Normalisation par l'énergie du filtre
        valeur_normalisee = zk(k) / E_hr;
        
        % Trouver le symbole le plus proche dans le dictionnaire
        [~, idx] = min(abs(dict - valeur_normalisee));
        
        % Symbole estimé
        ak_hat(k) = dict(idx);
    end
    
    fprintf('=== Décision ===\n');
    fprintf('Nombre de symboles estimés: %d\n', K);
end
