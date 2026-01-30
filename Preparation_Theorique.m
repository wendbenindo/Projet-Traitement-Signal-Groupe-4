%% TP 2 : Modulation FM - PRÉPARATION THÉORIQUE
% ISGE/IC 2 - Année académique 2018-2019

%{
===============================================================================
PRÉPARATION - Questions Théoriques
===============================================================================

1) Expression d'un signal modulé FM et de sa fréquence instantanée fi
   -----------------------------------------------------------------------
   
   Un signal modulé FM s'écrit :
   
   s_FM(t) = Ac * cos(2π*fc*t + φ(t))
   
   où φ(t) est la phase instantanée :
   φ(t) = 2π*Kf * ∫ x(τ) dτ
   
   La fréquence instantanée fi est définie par :
   fi(t) = fc + Kf * x(t)
   
   où :
   - fc : fréquence de la porteuse
   - Kf : constante de sensibilité en fréquence (Hz/V)
   - x(t) : signal modulant


2) Expression de fi, β et relation avec Kf et Δf (cas sinusoïdal)
   -----------------------------------------------------------------------
   
   Pour un signal modulant sinusoïdal : x(t) = Ax * cos(2π*fx*t)
   
   a) Fréquence instantanée :
      fi(t) = fc + Kf * Ax * cos(2π*fx*t)
      fi(t) = fc + Δf * cos(2π*fx*t)
   
   où Δf = Kf * Ax est la déviation maximale en fréquence
   
   b) Indice de modulation β :
      β = Δf / fx
      
      où fx est la fréquence du signal modulant
   
   c) Relation entre Kf et Δf :
      Δf = Kf * Ax
      donc : Kf = Δf / Ax


3) Différence entre modulation FM "NFM" et "WFM"
   -----------------------------------------------------------------------
   
   NFM (Narrow Band FM - FM à bande étroite) :
   - Indice de modulation β << 1 (typiquement β < 0.5)
   - Bande passante étroite : BW ≈ 2*fx
   - Utilisé pour la radio bidirectionnelle, communications professionnelles
   
   WFM (Wide Band FM - FM à large bande) :
   - Indice de modulation β >> 1 (typiquement β > 1)
   - Bande passante large : BW ≈ 2*(Δf + fx)
   - Utilisé pour la radio FM commerciale (88-108 MHz)
   - Meilleure qualité audio, plus résistant au bruit


4) Bande de Carson
   -----------------------------------------------------------------------
   
   La règle de Carson permet d'estimer la bande passante d'un signal FM :
   
   BW_Carson = 2 * (Δf + fx) = 2 * fx * (β + 1)
   
   où :
   - Δf : déviation maximale en fréquence
   - fx : fréquence du signal modulant
   - β : indice de modulation
   
   Cette règle indique que 98% de la puissance du signal FM est contenue
   dans cette bande de fréquence.
   
   Cas particuliers :
   - Si β << 1 (NFM) : BW ≈ 2*fx
   - Si β >> 1 (WFM) : BW ≈ 2*Δf

===============================================================================
%}

%% Exemple numérique avec les paramètres du TP

% Paramètres donnés
Ax = 1;              % Amplitude du signal modulant (1V)
fx = 10;             % Fréquence du signal modulant (10 Hz)
fc = 100*fx;         % Fréquence de la porteuse (1000 Hz)

fprintf('=== CALCULS THÉORIQUES ===\n\n');

% Test avec différentes déviations
deviations = [1, 10, 50, 100];

fprintf('Paramètres de base:\n');
fprintf('- Amplitude modulant Ax = %.1f V\n', Ax);
fprintf('- Fréquence modulant fx = %.1f Hz\n', fx);
fprintf('- Fréquence porteuse fc = %.1f Hz\n\n', fc);

fprintf('Analyse pour différentes déviations:\n');
fprintf('%-10s %-10s %-15s %-15s %-10s\n', 'Δf (Hz)', 'Kf (Hz/V)', 'β', 'BW Carson (Hz)', 'Type');
fprintf('-------------------------------------------------------------------\n');

for i = 1:length(deviations)
    delta_f = deviations(i);
    Kf = delta_f / Ax;
    beta = delta_f / fx;
    BW_Carson = 2 * (delta_f + fx);
    
    if beta < 0.5
        type = 'NFM';
    else
        type = 'WFM';
    end
    
    fprintf('%-10d %-10.1f %-15.2f %-15.1f %-10s\n', delta_f, Kf, beta, BW_Carson, type);
end

fprintf('\n');
fprintf('Observations:\n');
fprintf('- Pour Δf = 1 Hz : β = 0.10 => NFM (bande étroite)\n');
fprintf('- Pour Δf = 10 Hz : β = 1.00 => Transition NFM/WFM\n');
fprintf('- Pour Δf = 50 Hz : β = 5.00 => WFM (large bande)\n');
fprintf('- Pour Δf = 100 Hz : β = 10.00 => WFM (très large bande)\n');
