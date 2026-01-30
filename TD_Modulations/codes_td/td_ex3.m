%% TD Modulations - Exercice 3 : Modulation FM
% Signal modulant : x(t) = Ax×cos(2πfx×t), Ax = 2V, fx = 2 kHz
% Modulateur FM : kf = 1000 Hz/V
% Porteuse : Ap = 25V, fp = 100 MHz

close all;
clear all;
clc;

fprintf('========================================\n');
fprintf('  EXERCICE 3 : MODULATION FM\n');
fprintf('========================================\n\n');

%% Paramètres
Ax = 2;           % Amplitude signal modulant (V)
fx = 2e3;         % Fréquence signal modulant (Hz)
kf = 1000;        % Sensibilité FM (Hz/V)
Ap = 25;          % Amplitude porteuse (V)
fp = 100e6;       % Fréquence porteuse (Hz)

fprintf('Paramètres :\n');
fprintf('  Signal modulant : Ax = %.0f V, fx = %.0f kHz\n', Ax, fx/1e3);
fprintf('  Modulateur FM : kf = %.0f Hz/V\n', kf);
fprintf('  Porteuse : Ap = %.0f V, fp = %.0f MHz\n\n', Ap, fp/1e6);

%% 1. Expression du signal de sortie
fprintf('1. Expression du signal FM :\n');
fprintf('   s(t) = Ap×cos(2π×fp×t + φ(t))\n');
fprintf('   où φ(t) = (kf×Ax/fx)×sin(2π×fx×t)\n');
fprintf('   s(t) = %.0f×cos(2π×%.0f×10^6×t + β×sin(2π×%.0f×10^3×t))\n\n', ...
        Ap, fp/1e6, fx/1e3);

%% 2. Excursion en fréquence
Delta_f = kf * Ax;
fprintf('2. Excursion en fréquence :\n');
fprintf('   Δf = kf × Ax = %.0f × %.0f = %.0f Hz\n\n', kf, Ax, Delta_f);

%% 3. Indice de modulation
beta = Delta_f / fx;
fprintf('3. Indice de modulation :\n');
fprintf('   β = Δf / fx = %.0f / %.0f = %.2f\n\n', Delta_f, fx, beta);

%% 4. Bande occupée (règle de Carson)
BW_Carson = 2 * (Delta_f + fx);
fprintf('4. Bande occupée (règle de Carson) :\n');
fprintf('   BW = 2(Δf + fx) = 2(%.0f + %.0f) = %.0f Hz = %.2f kHz\n\n', ...
        Delta_f, fx, BW_Carson, BW_Carson/1e3);

%% 5. Nouveau signal modulant (fx × 2, Ax / 3)
fx_new = 2 * fx;
Ax_new = Ax / 3;

Delta_f_new = kf * Ax_new;
beta_new = Delta_f_new / fx_new;

fprintf('5. Nouveau signal modulant (fx×2, Ax/3) :\n');
fprintf('   fx_new = %.0f kHz, Ax_new = %.2f V\n', fx_new/1e3, Ax_new);
fprintf('   Δf_new = %.2f Hz\n', Delta_f_new);
fprintf('   β_new = %.4f\n\n', beta_new);

%% 6. Démodulation avec β < 1
fprintf('6. Démodulation avec β < 1 :\n');
if beta < 1
    fprintf('   β = %.2f < 1 => NFM (Narrow Band FM)\n', beta);
    fprintf('   La démodulation est COHÉRENTE\n');
    fprintf('   On peut utiliser un démodulateur simple (discriminateur de fréquence)\n\n');
else
    fprintf('   β = %.2f > 1 => WFM (Wide Band FM)\n', beta);
    fprintf('   La démodulation est NON-COHÉRENTE\n');
    fprintf('   Nécessite un démodulateur FM complet (PLL ou discriminateur)\n\n');
end

%% Génération des signaux pour visualisation
fs = 1e6;  % Fréquence d'échantillonnage (1 MHz)
T = 5e-3;  % Durée (5 ms)
t = 0:1/fs:T;

% Signal modulant
x = Ax * cos(2*pi*fx*t);

% Signal FM (approximation basse fréquence pour visualisation)
% On utilise une porteuse réduite pour la visualisation
fp_vis = 50e3;  % 50 kHz pour visualisation
phi = (kf*Ax/fx) * sin(2*pi*fx*t);
s_FM = Ap * cos(2*pi*fp_vis*t + phi);

%% Figure 1 : Signal modulant
figure('Position', [100, 100, 1000, 400]);
plot(t*1e3, x, 'b', 'LineWidth', 2);
xlabel('Temps (ms)', 'FontSize', 12);
ylabel('Amplitude (V)', 'FontSize', 12);
title('Signal Modulant x(t)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
xlim([0 2]);

saveas(gcf, '../images_td/td_ex3_signal_modulant.png');
fprintf('[Image 1/4] Signal modulant généré\n');

%% Figure 2 : Signal FM
figure('Position', [100, 100, 1000, 400]);
plot(t(1:5000)*1e3, s_FM(1:5000), 'r', 'LineWidth', 1);
xlabel('Temps (ms)', 'FontSize', 12);
ylabel('Amplitude (V)', 'FontSize', 12);
title(sprintf('Signal FM (β = %.2f)', beta), 'FontSize', 14, 'FontWeight', 'bold');
grid on;

saveas(gcf, '../images_td/td_ex3_signal_fm.png');
fprintf('[Image 2/4] Signal FM généré\n');

%% Figure 3 : Fréquence instantanée
fi = fp_vis + kf * x;  % Fréquence instantanée

figure('Position', [100, 100, 1000, 500]);
subplot(2,1,1);
plot(t*1e3, x, 'b', 'LineWidth', 1.5);
ylabel('Amplitude (V)', 'FontSize', 11);
title('Signal Modulant', 'FontSize', 12, 'FontWeight', 'bold');
grid on;
xlim([0 2]);

subplot(2,1,2);
plot(t*1e3, fi/1e3, 'r', 'LineWidth', 1.5);
xlabel('Temps (ms)', 'FontSize', 11);
ylabel('Fréquence (kHz)', 'FontSize', 11);
title('Fréquence Instantanée du Signal FM', 'FontSize', 12, 'FontWeight', 'bold');
grid on;
xlim([0 2]);
yline(fp_vis/1e3, 'k--', 'LineWidth', 1.5);
yline((fp_vis+Delta_f)/1e3, 'g--', 'LineWidth', 1);
yline((fp_vis-Delta_f)/1e3, 'g--', 'LineWidth', 1);
legend('fi(t)', 'fp', 'fp±Δf', 'Location', 'northeast');

saveas(gcf, '../images_td/td_ex3_frequence_instantanee.png');
fprintf('[Image 3/4] Fréquence instantanée générée\n');

%% Figure 4 : Comparaison β original vs nouveau
figure('Position', [100, 100, 900, 500]);

% Données pour comparaison
categories = {'Original', 'Nouveau'};
beta_values = [beta, beta_new];
Delta_f_values = [Delta_f, Delta_f_new];
BW_values = [BW_Carson, 2*(Delta_f_new + fx_new)];

subplot(1,3,1);
bar(beta_values);
set(gca, 'XTickLabel', categories);
ylabel('Indice β', 'FontSize', 11);
title('Indice de Modulation', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

subplot(1,3,2);
bar(Delta_f_values);
set(gca, 'XTickLabel', categories);
ylabel('Δf (Hz)', 'FontSize', 11);
title('Excursion en Fréquence', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

subplot(1,3,3);
bar(BW_values/1e3);
set(gca, 'XTickLabel', categories);
ylabel('BW (kHz)', 'FontSize', 11);
title('Bande Occupée', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

sgtitle('Comparaison : Signal Original vs Nouveau Signal', 'FontSize', 14, 'FontWeight', 'bold');

saveas(gcf, '../images_td/td_ex3_comparaison.png');
fprintf('[Image 4/4] Comparaison générée\n');

fprintf('\n========================================\n');
fprintf('  EXERCICE 3 TERMINÉ\n');
fprintf('========================================\n\n');

close all;
