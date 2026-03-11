% Q4 - Création d'un filtre de mise en forme
% Fonction qui crée différents types de filtres

function [he, E_he] = create_filter(t_he, T, method_fil)
    % Entrées:
    %   t_he: vecteur temps pour le filtre
    %   T: période symbole
    %   method_fil: type de filtre ('NRZ', 'RZ', 'biphase', 'RCS')
    %
    % Sorties:
    %   he: réponse impulsionnelle du filtre
    %   E_he: énergie totale du filtre
    
    % Initialisation
    he = zeros(size(t_he));
    
    switch lower(method_fil)
        case 'nrz'
            % Filtre NRZ (Non-Return to Zero)
            % he(t) = 1 si 0 <= t < T, 0 sinon
            he(t_he >= 0 & t_he < T) = 1;
            
        case 'rz'
            % Filtre RZ (Return to Zero)
            % he(t) = 1 si 0 <= t < T/2, 0 sinon
            he(t_he >= 0 & t_he < T/2) = 1;
            
        case 'biphase'
            % Filtre biphase (Manchester)
            % he(t) = 1 si 0 <= t < T/2, -1 si T/2 <= t < T, 0 sinon
            he(t_he >= 0 & t_he < T/2) = 1;
            he(t_he >= T/2 & t_he < T) = -1;
            
        case 'rcs'
            % Filtre en racine de cosinus surélevé
            % Paramètres pour le filtre
            beta = 0.25;  % Facteur de roll-off (peut être changé)
            
            % Implémentation de la formule du RCS
            % Utilisation de la fonction rcosdesign si disponible
            % Sinon, implémentation manuelle
            
            % Pour cela, on considère des réponses impulsionnelles
            % centrées sur t=0
            t_centered = t_he - T/2;
            
            % Formule du cosinus surélevé
            for i = 1:length(t_centered)
                t = t_centered(i);
                
                % Cas particuliers pour éviter la division par zéro
                if abs(t) < 1e-10
                    he(i) = (1 - beta + 4*beta/pi);
                elseif abs(abs(t) - T/(4*beta)) < 1e-10
                    he(i) = (beta/sqrt(2)) * ((1+2/pi)*sin(pi/(4*beta)) + ...
                            (1-2/pi)*cos(pi/(4*beta)));
                else
                    numerator = sin(pi*t/T*(1-beta)) + 4*beta*t/T*cos(pi*t/T*(1+beta));
                    denominator = pi*t/T * (1 - (4*beta*t/T)^2);
                    he(i) = numerator / denominator;
                end
            end
            
        otherwise
            error('method_fil non reconnu. Utilisez: NRZ, RZ, biphase, ou RCS');
    end
    
    % Calcul de l'énergie totale du filtre
    % E_he = integral(|he(t)|^2 dt)
    dt = t_he(2) - t_he(1);  % Pas d'échantillonnage
    E_he = sum(abs(he).^2) * dt;
end
