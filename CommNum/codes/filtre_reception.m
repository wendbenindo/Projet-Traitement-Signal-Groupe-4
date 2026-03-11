% Q12 - Filtre de réception
% Fonction qui applique un filtre de réception au signal bruité

function [z, t_z, E_hr] = filtre_reception(y, t_y, T, Fs, method_fil)
    % Entrées:
    %   y: signal bruité
    %   t_y: vecteur temps
    %   T: période symbole
    %   Fs: fréquence d'échantillonnage
    %   method_fil: type de filtre
    %
    % Sorties:
    %   z: signal filtré
    %   t_z: vecteur temps
    %   E_hr: énergie du filtre de réception
    
    % Création du filtre de réception
    % Pour un récepteur optimal (filtre adapté):
    % hr(t) = he(-t) où he est le filtre d'émission
    
    t_hr = 0 : 1/Fs : T - 1/Fs;
    
    % Créer le filtre d'émission
    [he, ~] = create_filter(t_hr, T, method_fil);
    
    % Filtre de réception = version retournée du filtre d'émission
    % hr(t) = he(T - t)
    hr = fliplr(he);
    
    % Calcul de l'énergie du filtre de réception
    dt = t_hr(2) - t_hr(1);
    E_hr = sum(abs(hr).^2) * dt;
    
    % Convolution du signal bruité avec le filtre de réception
    z = conv(y, hr, 'same');
    
    % Le vecteur temps reste identique
    t_z = t_y;
    
    fprintf('=== Filtre de réception ===\n');
    fprintf('Type de filtre: %s\n', method_fil);
    fprintf('Énergie du filtre E_hr: %.6f\n', E_hr);
end
