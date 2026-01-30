%% Code 6 - Évaluation de la qualité de démodulation
% Ce code analyse en détail la qualité de la démodulation

close all;

% Paramètres
Ax = 1;
fx = 10;
fc = 100*fx;
fs = 10000;
T = 1;
t = 0:1/fs:T-1/fs;

% Signal modulant
x = Ax * cos(2*pi*fx*t);

% Signal FM
delta_f = 50;
s_FM = fmmod(x, fc, fs, delta_f);

% Démodulation
x2 = fmdemod(s_FM, fc, fs, delta_f);

% Calcul de l'erreur
erreur = x - x2;
MSE = mean(erreur.^2);
SNR_demod = 10*log10(mean(x.^2)/MSE);

fprintf('Erreur quadratique moyenne (MSE): %.2e\n', MSE);
fprintf('SNR de démodulation: %.2f dB\n', SNR_demod);

% Affichage détaillé
figure('Position', [100, 100, 900, 700]);

subplot(3,1,1);
plot(t, x, 'b', 'LineWidth', 2);
ylabel('Amplitude (V)', 'FontSize', 11);
title('Signal Original x(t)', 'FontSize', 12, 'FontWeight', 'bold');
grid on;
xlim([0 0.5]);
ylim([-1.2 1.2]);

subplot(3,1,2);
plot(t, x2, 'r', 'LineWidth', 1.5);
ylabel('Amplitude (V)', 'FontSize', 11);
title('Signal Démodulé x_2(t)', 'FontSize', 12, 'FontWeight', 'bold');
grid on;
xlim([0 0.5]);
ylim([-1.2 1.2]);

subplot(3,1,3);
plot(t, erreur, 'k', 'LineWidth', 1);
xlabel('Temps (s)', 'FontSize', 11);
ylabel('Erreur (V)', 'FontSize', 11);
title(sprintf('Erreur de Démodulation (MSE = %.2e, SNR = %.1f dB)', MSE, SNR_demod), ...
      'FontSize', 12, 'FontWeight', 'bold');
grid on;
xlim([0 0.5]);

sgtitle('Analyse Détaillée de la Qualité de Démodulation', ...
        'FontSize', 14, 'FontWeight', 'bold');

% Sauvegarder la figure
saveas(gcf, '../images/image6.png');
fprintf('Image 6 générée avec succès!\n');
