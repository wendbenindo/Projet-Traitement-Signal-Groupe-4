% Q3 - Génération du peigne de Dirac
% Fonction qui génère un signal physique à partir d'une série de symboles

function [a, t_a] = genere_dirac(ak, K, T, Fs)
    % Entrées:
    %   ak: série de K symboles
    %   K: nombre de symboles
    %   T: période symbole (secondes)
    %   Fs: fréquence d'échantillonnage (Hz)
    %
    % Sorties:
    %   a: signal physique (peigne de Dirac)
    %   t_a: vecteur temps associé
    
    % Calcul de la durée Raym (en échantillons) d'un symbole
    Nsym = round(T * Fs);  % Nombre d'échantillons par symbole
    
    % Durée totale du signal
    duree_totale = K * T;
    
    % Création du vecteur temps
    t_a = 0 : 1/Fs : duree_totale - 1/Fs;
    
    % Initialisation du signal (tous les indices à 0)
    a = zeros(size(t_a));
    
    % Placement des impulsions de Dirac aux multiples de T
    for k = 0:K-1
        % Position temporelle du k-ième symbole
        idx = k * Nsym + 1;  % +1 car MATLAB indexe à partir de 1
        
        % Vérifier que l'index est valide
        if idx <= length(a)
            % Placer l'impulsion pondérée par ak(k+1)
            a(idx) = ak(k+1);
        end
    end
    
    % Formule mathématique: a(t) = sum_{k=0}^{K-1} ak * delta(t - kT)
end
