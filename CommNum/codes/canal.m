% Q11 - Modélisation du canal avec bruit AWGN
% Fonction qui ajoute un bruit blanc gaussien au signal

function [y, t_y] = canal(x, t_x, E_bit, EbitN0_dB)
    % Entrées:
    %   x: signal émis
    %   t_x: vecteur temps
    %   E_bit: énergie moyenne par bit
    %   EbitN0_dB: rapport signal/bruit en dB
    %
    % Sorties:
    %   y: signal bruité y(t) = x(t) + b(t)
    %   t_y: vecteur temps (identique à t_x)
    
    % Conversion dB vers linéaire
    EbitN0 = 10^(EbitN0_dB/10);
    
    % Calcul de la variance du bruit
    % N0/2 est la densité spectrale de puissance du bruit
    % sigma^2 = N0/2
    N0 = E_bit / EbitN0;
    sigma2 = N0 / 2;
    sigma = sqrt(sigma2);
    
    % Génération du bruit blanc gaussien
    b = sigma * randn(size(x));
    
    % Signal bruité
    y = x + b;
    
    % Le vecteur temps reste identique
    t_y = t_x;
    
    fprintf('=== Canal AWGN ===\n');
    fprintf('Eb/N0 = %.2f dB (%.4f linéaire)\n', EbitN0_dB, EbitN0);
    fprintf('Variance du bruit: %.6f\n', sigma2);
    fprintf('Écart-type du bruit: %.6f\n', sigma);
end
