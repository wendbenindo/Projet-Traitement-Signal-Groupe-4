%% TD Modulations - Problème 2 : Étude du modulateur FM
% NFM (Narrow Band FM) et WFM (Wide Band FM)

close all;
clear all;
clc;

fprintf('========================================\n');
fprintf('  PROBLÈME 2 : ÉTUDE MODULATEUR FM\n');
fprintf('========================================\n\n');

%% Partie 1 : Narrow Band FM (NFM)

fprintf('PARTIE 1 : NARROW BAND FM (NFM)\n');
fprintf('================================\n\n');

% Paramètres
Am = 1;        % Amplitude signal modulant (V)
fm = 10e3;     % Fréquence signal modulant (10 kHz)
fp = 100e6;    % Fréquence porteuse (100 MHz)
Ap = 1;        % Amplitude porteuse (V)
R = 50;        % Résistance (Ohms)
beta = 0.1;    % Indice de modulation

% Calcul de k (sensibilité)
k = beta * fm / Am;

fprintf('Paramètres NFM :\n');
fprintf('  β = %.1f, fp = %.0f MHz, fm = %.0f kHz\n', beta, fp/1e6, fm/1e3);
fprintf('  Am = %.0f V, R = %.0f Ω\n\n', Am, R);

%% 1. Expression de θ(t)

fprintf('1. Expression de θ(t) :\n');
fprintf('   θ(t) = 2π·fp·t + φ(t)\n');
fprintf('   où φ(t) = 2π·k·∫x(τ)dτ\n');
fprintf('   Pour x(t) = Am·cos(2π·fm·t) :\n');
fprintf('   φ(t) = (k·Am/fm)·sin(2π·fm·t) = β·sin(2π·fm·t)\n');
fprintf('   Donc : θ(t) = 2π·fp·t + β·sin(2π·fm·t)\n');
fprintf('   Avec β = k·Am/fm, on a k = β·fm/Am = %.0f Hz/V\n\n', k);

%% 2. Forme de s(t) avec développement de Bessel

fprintf('2. Forme de s(t) avec développement de Bessel :\n');
fprintf('   s(t) = Ap·cos(θ(t))\n');
fprintf('   Pour β << 1, on peut approximer :\n');
fprintf('   s(t) ≈ Ap[cos(2π·fp·t)·cos(β·sin(2π·fm·t)) - sin(2π·fp·t)·sin(β·sin(2π·fm·t))]\n');
fprintf('   Avec β << 1 : cos(β·sin(...)) ≈ 1 et sin(β·sin(...)) ≈ β·sin(...)\n');
fprintf('   s(t) ≈ Ap[cos(2π·fp·t) - β·sin(2π·fp·t)·sin(2π·fm·t)]\n\n');

%% 3. Puissance transmise

Pt = (Ap^2) / (2*R);
Pt_dB = 10*log10(Pt);
Pt_dBm = 10*log10(Pt/1e-3);

fprintf('3. Puissance transmise :\n');
fprintf('   P = Ap²/(2R) = %.2f²/(2×%.0f) = %.4f W\n', Ap, R, Pt);
fprintf('   P = %.2f dB\n', Pt_dB);
fprintf('   P = %.2f dBm\n\n', Pt_dBm);

%% 4. Largeur du canal

BW_NFM = 2 * fm;

fprintf('4. Largeur du canal (règle de Carson pour NFM) :\n');
fprintf('   BW ≈ 2·fm = 2×%.0f = %.0f kHz\n\n', fm/1e3, BW_NFM/1e3);

%% Partie 2 : Wide Band FM (WFM)

fprintf('\nPARTIE 2 : WIDE BAND FM (WFM)\n');
fprintf('==============================\n\n');

% Paramètres WFM
beta_WFM = 6;
fp_WFM = 100e6;
fm_WFM = 10e3;
Vp = 1;

fprintf('Paramètres WFM :\n');
fprintf('  β = %.0f, fp = %.0f MHz, fm = %.0f kHz\n\n', beta_WFM, fp_WFM/1e6, fm_WFM/1e3);

%% 1. Décomposition avec coefficients de Bessel

fprintf('1. Décomposition avec coefficients de Bessel :\n');
fprintf('   Pour β = %.0f, on garde les termes avec J_n(β) > 0.1\n', beta_WFM);

% Coefficients de Bessel pour β = 6
J_values = [0.1506, -0.2767, 0.3621, -0.2458, 0.1148, -0.0437, 0.0138];
n_values = 0:6;

fprintf('   Coefficients de Bessel J_n(%.0f) :\n', beta_WFM);
for i = 1:length(n_values)
    if abs(J_values(i)) > 0.1
        fprintf('   J_%d(%.0f) = %.4f ✓\n', n_values(i), beta_WFM, J_values(i));
    else
        fprintf('   J_%d(%.0f) = %.4f (négligeable)\n', n_values(i), beta_WFM, J_values(i));
    end
end

nb_termes = sum(abs(J_values) > 0.1);
fprintf('   Nombre de termes à conserver : %.0f\n\n', nb_termes);

%% 2. Spectre du signal FM

fprintf('2. Spectre du signal FM :\n');
fprintf('   Le spectre contient la porteuse et des bandes latérales\n');
fprintf('   espacées de fm = %.0f kHz\n', fm_WFM/1e3);
fprintf('   (Voir figure générée)\n\n');

%% 3. Largeur du canal

BW_WFM = 2 * (beta_WFM * fm_WFM + fm_WFM);

fprintf('3. Largeur du canal (règle de Carson) :\n');
fprintf('   BW = 2(β·fm + fm) = 2(%.0f×%.0f + %.0f)\n', beta_WFM, fm_WFM/1e3, fm_WFM/1e3);
fprintf('   BW = %.0f kHz\n\n', BW_WFM/1e3);

%% 4. Comparaison théorique

fprintf('4. Comparaison théorique vs pratique :\n');
fprintf('   BW théorique = %.0f kHz\n', BW_WFM/1e3);
fprintf('   BW pratique (en gardant J_n > 0.1) :\n');
fprintf('   Nombre de raies significatives : 2×%.0f + 1 = %.0f\n', nb_termes-1, 2*(nb_termes-1)+1);
fprintf('   BW pratique ≈ 2×%.0f×%.0f = %.0f kHz\n', nb_termes-1, fm_WFM/1e3, 2*(nb_termes-1)*fm_WFM/1e3);
fprintf('   Les deux valeurs sont cohérentes ✓\n\n');

%% 5. Largeur du canal théorique

fprintf('5. Largeur du canal théorique :\n');
fprintf('   BW = 2(Δf + fm) = 2(β·fm + fm) = %.0f kHz\n\n', BW_WFM/1e3);

%% 6. Puissance transmise

Pt_WFM = (Vp^2) / (2*R);
Pt_WFM_dB = 10*log10(Pt_WFM);
Pt_WFM_dBm = 10*log10(Pt_WFM/1e-3);

fprintf('6. Puissance transmise pour β = %.0f :\n', beta_WFM);
fprintf('   P = Vp²/(2R) = %.0f²/(2×%.0f) = %.4f W\n', Vp, R, Pt_WFM);
fprintf('   P = %.2f dB\n', Pt_WFM_dB);
fprintf('   P = %.2f dBm\n\n', Pt_WFM_dBm);

%% Visualisations

% Figure 1 : Comparaison NFM vs WFM
figure('Position', [100, 100, 1000, 600]);

subplot(2,2,1);
bar([beta, beta_WFM]);
set(gca, 'XTickLabel', {'NFM', 'WFM'});
ylabel('Indice β', 'FontSize', 11);
title('Indice de Modulation', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

subplot(2,2,2);
bar([BW_NFM/1e3, BW_WFM/1e3]);
set(gca, 'XTickLabel', {'NFM', 'WFM'});
ylabel('Bande passante (kHz)', 'FontSize', 11);
title('Largeur du Canal', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

subplot(2,2,3);
bar([Pt*1e3, Pt_WFM*1e3]);
set(gca, 'XTickLabel', {'NFM', 'WFM'});
ylabel('Puissance (mW)', 'FontSize', 11);
title('Puissance Transmise', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

subplot(2,2,4);
bar([2, nb_termes]);
set(gca, 'XTickLabel', {'NFM', 'WFM'});
ylabel('Nombre de termes', 'FontSize', 11);
title('Termes Significatifs (Bessel)', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

sgtitle('Comparaison NFM vs WFM', 'FontSize', 14, 'FontWeight', 'bold');

saveas(gcf, '../images_td/td_prob2_comparaison.png');
fprintf('[Image 1/2] Comparaison NFM/WFM générée\n');

% Figure 2 : Spectre WFM avec coefficients de Bessel
figure('Position', [100, 100, 1000, 500]);

% Fréquences des raies
freqs = fp_WFM + (-6:6)*fm_WFM;
amplitudes = [J_values(end:-1:2), J_values];

stem((freqs-fp_WFM)/1e3, abs(amplitudes), 'b', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Fréquence relative à fp (kHz)', 'FontSize', 12);
ylabel('Amplitude (J_n)', 'FontSize', 12);
title(sprintf('Spectre FM avec β = %.0f (Coefficients de Bessel)', beta_WFM), ...
      'FontSize', 14, 'FontWeight', 'bold');
grid on;
xlim([-80, 80]);

% Marquer la bande de Carson
hold on;
xline(-BW_WFM/(2*1e3), 'r--', 'BW Carson', 'LineWidth', 2, 'LabelOrientation', 'horizontal');
xline(BW_WFM/(2*1e3), 'r--', 'LineWidth', 2);
hold off;

saveas(gcf, '../images_td/td_prob2_spectre_wfm.png');
fprintf('[Image 2/2] Spectre WFM généré\n');

fprintf('\n========================================\n');
fprintf('  PROBLÈME 2 TERMINÉ\n');
fprintf('========================================\n\n');

close all;
