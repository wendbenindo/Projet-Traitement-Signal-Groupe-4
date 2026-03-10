% Q5 - Convolution pour obtenir le signal émis
% Fonction qui convolue le signal a(t) avec le filtre he(t)

function [s, t_s, x, E_s] = filtre_emission(a, t_a, K, T, Fs, method_fil)
    % Entrées:
    %   a: signal peigne de Dirac
    %   t_a: vecteur temps de a
    %   K: nombre de symboles
    %   T: période symbole
    %   Fs: fréquence d'échantillonnage
    %   method_fil: type de filtre
    %
    % Sorties:
    %   s: signal émis x(t)
    %   t_s: vecteur temps du signal émis
    %   x: signal émis (alias de s)
    %   E_s: énergie du signal émis
    
    % Création du filtre de mise en forme
    % Le filtre doit couvrir au moins la durée d'un symbole
    t_he = 0 : 1/Fs : T - 1/Fs;
    [he, ~] = create_filter(t_he, T, method_fil);
    
    % Convolution entre a(t) et he(t)
    % s(t) = a(t) * he(t)
    s = conv(a, he, 'same');
    
    % Le vecteur temps reste le même
    t_s = t_a;
    
    % Alias pour x
    x = s;
    
    % Calcul de l'énergie du signal émis
    dt = t_s(2) - t_s(1);
    E_s = sum(abs(s).^2) * dt;
end
