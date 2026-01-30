%% TD Modulations - Exercice 1 : Modulation AM
% Signal AM : s(t) = 100cos(3.77×10^6 t) + 43.5cos(3.738×10^6 t) + 43.5cos(3.802×10^6 t)

close all;
clear all;
clc;

fprintf('========================================\n');
fprintf('  EXERCICE 1 : MODULATION AM\n');
fprintf('========================================\n\n');

%% Paramètres du signal
% s(t) = 100cos(2π×fc×t) + 43.5cos(2π×(fc-Δf)×t) + 43.5cos(2π×(fc+Δf)×t)
% Avec : 3.77×10^6 = 2π×fc => fc = 3.77×10^6 / (2π)

fc = 3.77e6 / (2*pi);  % Fréquence porteuse (Hz)
f_inf = 3.738e6 / (2*pi);  % Fréquence latérale inférieure
f_sup = 3.802e6 / (2*pi);  % Fréquence latérale supérieure

% Calcul de la fréquence modulante
fm = fc - f_inf;  % Fréquence modulante

fprintf('a) Fréquence latérale supérieure : %.2f kHz\n', f_sup/1000);
fprintf('b) Fréquence modulante : %.2f kHz\n', fm/1000);

%% c) Taux de modulation
Ac = 100;  % Amplitude porteuse
Am = 43.5;  % Amplitude bandes latérales

% Pour AM : Am = m × Ac / 2
m = (2 * Am) / Ac;
fprintf('c) Taux de modulation : m = %.2f = %.0f%%\n', m, m*100);

%% d) Bande de fréquences
BW = 2 * fm;
fprintf('d) Bande de fréquences : BW = %.2f kHz\n', BW/1000);

%% e) Puissance totale et répartition
Pt = 38e3;  % Puissance totale (W)

% Puissance porteuse : Pc = Ac^2 / (2R)
% Puissance bandes latérales : Pbl = 2 × Am^2 / (2R)
% Pt = Pc + Pbl = (Ac^2 + 2×Am^2) / (2R)

% Calcul de R
R = (Ac^2 + 2*Am^2) / (2*Pt);

% Puissances
Pc = Ac^2 / (2*R);
Pbl_une = Am^2 / (2*R);
Pbl_total = 2 * Pbl_une;

fprintf('\ne) Répartition des puissances :\n');
fprintf('   Puissance porteuse : Pc = %.2f kW\n', Pc/1000);
fprintf('   Puissance par bande latérale : %.2f kW\n', Pbl_une/1000);
fprintf('   Puissance totale bandes latérales : %.2f kW\n', Pbl_total/1000);
fprintf('   Vérification : Pc + Pbl = %.2f kW\n', (Pc + Pbl_total)/1000);

%% f) Nouveau taux de modulation si Pt réduite à 32 kW
Pt_new = 32e3;

% Si on réduit la puissance totale, on réduit le signal modulant
% Pt_new = Pc + m_new^2 × Pc / 2
% m_new^2 = 2(Pt_new - Pc) / Pc

m_new = sqrt(2 * (Pt_new - Pc) / Pc);
fprintf('\nf) Nouveau taux de modulation : m = %.2f = %.0f%%\n', m_new, m_new*100);

%% Génération du signal pour visualisation
fs = 10e6;  % Fréquence d'échantillonnage (10 MHz)
T = 1e-3;   % Durée (1 milliseconde pour voir plusieurs périodes)
t = 0:1/fs:T;

% Signal AM
s = Ac*cos(2*pi*fc*t) + Am*cos(2*pi*f_inf*t) + Am*cos(2*pi*f_sup*t);

% Signal modulant reconstruit
m_t = m * cos(2*pi*fm*t);
s_env_sup = Ac * (1 + m_t);  % Enveloppe supérieure
s_env_inf = -Ac * (1 + m_t); % Enveloppe inférieure

%% Figure 1 : Signal AM temporel
figure('Position', [100, 100, 1000, 600]);

subplot(2,1,1);
plot(t*1e6, s, 'b', 'LineWidth', 1);
hold on;
plot(t*1e6, s_env_sup, 'r--', 'LineWidth', 1.5);
plot(t*1e6, s_env_inf, 'r--', 'LineWidth', 1.5);
hold off;
xlabel('Temps (\mus)', 'FontSize', 11);
ylabel('Amplitude (V)', 'FontSize', 11);
title('Signal AM temporel avec enveloppe', 'FontSize', 13, 'FontWeight', 'bold');
legend('Signal AM', 'Enveloppe', 'Location', 'northeast');
grid on;
xlim([0 T*1e6]);

% Zoom sur une période
subplot(2,1,2);
t_zoom = t(1:min(500, length(t)));
s_zoom = s(1:min(500, length(s)));
plot(t_zoom*1e6, s_zoom, 'b', 'LineWidth', 1.5);
xlabel('Temps (\mus)', 'FontSize', 11);
ylabel('Amplitude (V)', 'FontSize', 11);
title('Zoom sur le signal AM', 'FontSize', 13, 'FontWeight', 'bold');
grid on;

saveas(gcf, '../images_td/td_ex1_signal_temporel.png');
fprintf('\n[Image 1/2] Signal temporel généré\n');

%% Figure 2 : Spectre du signal AM
figure('Position', [100, 100, 1000, 500]);

% Calcul FFT
N = length(s);
S = fft(s);
S = fftshift(S);
f = (-N/2:N/2-1)*(fs/N);

% Spectre d'amplitude
amplitude = abs(S)/N;

% Affichage centré sur fc
plot(f/1e6, amplitude, 'b', 'LineWidth', 1.5);
xlabel('Fréquence (MHz)', 'FontSize', 12);
ylabel('Amplitude', 'FontSize', 12);
title('Spectre du signal AM', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
xlim([fc/1e6 - 0.1, fc/1e6 + 0.1]);

% Marquer les fréquences importantes
hold on;
xline(fc/1e6, 'r--', 'LineWidth', 2);
xline(f_inf/1e6, 'g--', 'LineWidth', 1.5);
xline(f_sup/1e6, 'g--', 'LineWidth', 1.5);
legend('Spectre', 'Porteuse', 'Bandes latérales', 'Location', 'northeast');
hold off;

saveas(gcf, '../images_td/td_ex1_spectre.png');
fprintf('[Image 2/2] Spectre généré\n');

fprintf('\n========================================\n');
fprintf('  EXERCICE 1 TERMINÉ\n');
fprintf('========================================\n\n');

close all;
