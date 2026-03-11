% Q13 - Échantillonnage
% Fonction qui échantillonne le signal aux instants t = kT

function [zk] = echantillonnage(z, t_z, T, K, Fs)
    % Entrées:
    %   z: signal filtré
    %   t_z: vecteur temps
    %   T: période symbole
    %   K: nombre de symboles
    %   Fs: fréquence d'échantillonnage
    %
    % Sortie:
    %   zk: vecteur des échantillons aux instants t = kT
    
    % Calcul de la durée Nsym (en échantillons) d'un symbole
    Nsym = round(T * Fs);
    
    % Initialisation du vecteur d'échantillons
    zk = zeros(1, K);
    
    % Échantillonnage aux instants t = kT avec k ∈ [0, K-1]
    for k = 0:K-1
        % Position temporelle du k-ième symbole
        idx = k * Nsym + 1;  % +1 car MATLAB indexe à partir de 1
        
        % Vérifier que l'index est valide
        if idx <= length(z)
            zk(k+1) = z(idx);
        end
    end
    
    fprintf('=== Échantillonnage ===\n');
    fprintf('Nombre d''échantillons: %d\n', K);
    fprintf('Période d''échantillonnage: %.6f s\n', T);
end
