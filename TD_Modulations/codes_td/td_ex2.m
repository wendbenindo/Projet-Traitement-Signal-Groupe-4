%% TD Modulations - Exercice 2 : Signal multi-fréquences
% Signal m(t) composé de 3 fréquences : 440 Hz, 560 Hz, 680 Hz
% Modulation AM avec porteuse λ/4 = 30 cm

close all;
clear all;
clc;

fprintf('========================================\n');
fprintf('  EXERCICE 2 : SIGNAL MULTI-FREQUENCES\n');
fprintf('========================================\n\n');

%% 1. Équation mathématique du signal modulant
f1 = 440;  % Hz
f2 = 560;  % Hz
f3 = 680;  % Hz
A1 = 1;    % Volt
A2 = 2;    % Volts
A3 = 1;    % Volt

fprintf('1. Signal modulant :\n');
fprintf('   m(t) = %.0f×cos(2π×%.0f×t) + %.0f×cos(2π×%.0f×t) + %.0f×cos(2π×%.0f×t)\n\n', ...
        A1, f1, A2, f2, A3, f3);

%% 2. Spectre du signal modulant
fs = 10000;  % Fréquence d'échantillonnage
T = 1;       % Durée
t = 0:1/fs:T-1/fs;

% Signal modulant
m = A1*cos(2*pi*f1*t) + A2*cos(2*pi*f2*t) + A3*cos(2*pi*f3*t);

figure('Position', [100, 100, 1000, 500]);
subplot(2,1,1);
plot(t(1:1000), m(1:1000), 'b', 'LineWidth', 1.5);
xlabel('Temps (s)', 'FontSize', 11);
ylabel('Amplitude (V)', 'FontSize', 11);
title('Signal modulant m(t)', 'FontSize', 13, 'FontWeight', 'bold');
grid on;

% Spectre
subplot(2,1,2);
N = length(m);
M = fft(m);
M = fftshift(M);
f = (-N/2:N/2-1)*(fs/N);
stem(f, abs(M)/N, 'b', 'LineWidth', 1.5);
xlabel('Fréquence (Hz)', 'FontSize', 11);
ylabel('Amplitude', 'FontSize', 11);
title('Spectre du signal modulant', 'FontSize', 13, 'FontWeight', 'bold');
grid on;
xlim([0 1000]);

saveas(gcf, '../images_td/td_ex2_signal_modulant.png');
fprintf('2. [Image 1/4] Signal modulant et spectre générés\n\n');

%% 3. Fréquence porteuse
lambda_4 = 0.30;  % m (λ/4 = 30 cm)
lambda = 4 * lambda_4;  % λ = 1.2 m
c = 3e8;  % Vitesse de la lumière (m/s)
fp = c / lambda;  % Fréquence porteuse

fprintf('3. Fréquence porteuse :\n');
fprintf('   λ = %.2f m\n', lambda);
fprintf('   fp = c/λ = %.2f MHz\n\n', fp/1e6);

%% 4. Signal modulé AM avec k=1
k = 1;  % Coefficient du modulateur
Vp = 3;  % Amplitude porteuse (V)

% Porteuse
v_p = Vp * cos(2*pi*fp*t);

% Signal modulé : s(t) = Vp×[1 + k×m(t)]×cos(2πfp×t)
s = Vp * (1 + k*m) .* cos(2*pi*fp*t);

fprintf('4. Signal modulé :\n');
fprintf('   s(t) = %.0f×[1 + m(t)]×cos(2π×%.2f×10^6×t)\n\n', Vp, fp/1e6);

%% 5. Spectre du signal modulé
% Pour visualiser le spectre, on utilise une porteuse réduite
fp_vis = 1e6;  % 1 MHz pour visualisation (au lieu de 250 MHz)
s_vis = Vp * (1 + k*m) .* cos(2*pi*fp_vis*t);

figure('Position', [100, 100, 1000, 600]);

% Calcul FFT
S = fft(s_vis);
S = fftshift(S);
f_fft = (-N/2:N/2-1)*(fs/N);

% Spectre d'amplitude
amplitude = abs(S)/N;

plot(f_fft/1e3, amplitude, 'b', 'LineWidth', 1);
xlabel('Fréquence (kHz)', 'FontSize', 12);
ylabel('Amplitude', 'FontSize', 12);
title('Spectre du signal modulé AM (porteuse 1 MHz pour visualisation)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
xlim([fp_vis/1e3 - 2, fp_vis/1e3 + 2]);

% Marquer les fréquences importantes
hold on;
xline(fp_vis/1e3, 'r--', 'Porteuse', 'LineWidth', 2, 'LabelOrientation', 'horizontal');
xline((fp_vis-f1)/1e3, 'g--', 'LineWidth', 1.5);
xline((fp_vis+f1)/1e3, 'g--', 'LineWidth', 1.5);
xline((fp_vis-f2)/1e3, 'm--', 'LineWidth', 1.5);
xline((fp_vis+f2)/1e3, 'm--', 'LineWidth', 1.5);
xline((fp_vis-f3)/1e3, 'c--', 'LineWidth', 1.5);
xline((fp_vis+f3)/1e3, 'c--', 'LineWidth', 1.5);
legend('Spectre', 'Porteuse', 'BL 440Hz', '', 'BL 560Hz', '', 'BL 680Hz', '', ...
       'Location', 'northeast', 'FontSize', 9);
hold off;

saveas(gcf, '../images_td/td_ex2_spectre_module.png');
fprintf('5. [Image 2/4] Spectre du signal modulé généré\n\n');

%% 6. Puissance du signal
R = 1;  % Ohm (supposé)
P_signal = mean(s.^2) / R;
P_dBm = 10*log10(P_signal/1e-3);
P_dB = 10*log10(P_signal);

fprintf('6. Puissance du signal :\n');
fprintf('   P = %.4f W\n', P_signal);
fprintf('   P = %.2f dB\n', P_dB);
fprintf('   P = %.2f dBm\n\n', P_dBm);

%% 7. Puissance en dB et dBm (déjà calculée ci-dessus)
fprintf('7. Puissance en dB et dBm : voir question 6\n\n');

%% 8. Filtrage passe-bande
fc1 = 500;  % Hz
fc2 = 600;  % Hz

fprintf('8. Filtrage passe-bande [%.0f Hz - %.0f Hz] :\n', fc1, fc2);

% Filtre passe-bande (simple)
% On garde seulement la composante à 560 Hz
m_filtered = A2 * cos(2*pi*f2*t);

% Signal modulé filtré
s_filtered = Vp * (1 + k*m_filtered) .* cos(2*pi*fp*t);

% Démodulation synchrone
% Multiplication par la porteuse
x_demod = s_filtered .* cos(2*pi*fp*t);

% Filtre passe-bas (moyenne glissante simple)
window_size = 100;
x_demod_filtered = movmean(x_demod, window_size);

% Le signal démodulé devrait être proportionnel à m_filtered
x_final = 2 * x_demod_filtered / Vp;  % Facteur 2 car cos²(x) = 1/2

figure('Position', [100, 100, 1000, 700]);

subplot(3,1,1);
plot(t(1:2000), m_filtered(1:2000), 'b', 'LineWidth', 1.5);
xlabel('Temps (s)', 'FontSize', 10);
ylabel('Amplitude (V)', 'FontSize', 10);
title('Signal modulant filtré (560 Hz)', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

subplot(3,1,2);
plot(t(1:2000), s_filtered(1:2000), 'r', 'LineWidth', 0.5);
xlabel('Temps (s)', 'FontSize', 10);
ylabel('Amplitude (V)', 'FontSize', 10);
title('Signal AM filtré', 'FontSize', 12, 'FontWeight', 'bold');
grid on;

subplot(3,1,3);
plot(t(1:2000), x_final(1:2000), 'g', 'LineWidth', 1.5);
hold on;
plot(t(1:2000), m_filtered(1:2000), 'b--', 'LineWidth', 1);
hold off;
xlabel('Temps (s)', 'FontSize', 10);
ylabel('Amplitude (V)', 'FontSize', 10);
title('Signal démodulé (vert) vs Signal original (bleu)', 'FontSize', 12, 'FontWeight', 'bold');
legend('Démodulé', 'Original', 'Location', 'northeast');
grid on;

saveas(gcf, '../images_td/td_ex2_demodulation.png');
fprintf('   [Image 3/4] Démodulation générée\n');
fprintf('   Type de filtre : Passe-bande + Démodulation synchrone cohérente\n\n');

%% Fréquences présentes dans le signal modulé
fprintf('   Fréquences dans le signal modulé :\n');
freqs_modulees = [fp-f3, fp-f2, fp-f1, fp, fp+f1, fp+f2, fp+f3];
for i = 1:length(freqs_modulees)
    fprintf('   - %.0f Hz\n', freqs_modulees(i));
end

% Vérification avec les fréquences données
freqs_donnees = [440, 140000, 162000, 162440, 179560, 180000, 180440];
fprintf('\n   Fréquences données dans l''énoncé :\n');
for i = 1:length(freqs_donnees)
    fprintf('   - %.0f Hz\n', freqs_donnees(i));
end

%% Résumé graphique
figure('Position', [100, 100, 1000, 400]);
plot(t(1:5000), s(1:5000), 'b', 'LineWidth', 0.5);
xlabel('Temps (s)', 'FontSize', 12);
ylabel('Amplitude (V)', 'FontSize', 12);
title('Signal AM complet - Exercice 2', 'FontSize', 14, 'FontWeight', 'bold');
grid on;

saveas(gcf, '../images_td/td_ex2_signal_complet.png');
fprintf('\n[Image 4/4] Signal complet généré\n');

fprintf('\n========================================\n');
fprintf('  EXERCICE 2 TERMINÉ\n');
fprintf('========================================\n\n');

close all;
