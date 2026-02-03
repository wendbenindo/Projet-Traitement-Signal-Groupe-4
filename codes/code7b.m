%% Code 7b - Génération du signal FM bruité (Question 1 Partie II)
% Ce code génère et visualise un signal FM bruité

close all;

% Paramètres
Ax = 1;
fx = 10;
fc = 100*fx;
fs = 10000;
T = 0.5;  % Durée réduite pour meilleure visualisation
t = 0:1/fs:T-1/fs;

% Signal modulant
x = Ax * cos(2*pi*fx*t);

% Signal FM
delta_f = 50;
s_FM = fmmod(x, fc, fs, delta_f);

% Ajout de bruit AWGN
SNR_dB = 20;  % Rapport signal/bruit en dB
s_FM_noisy = awgn(s_FM, SNR_dB, 'measured');

% Visualisation
figure('Position', [100, 100, 1000, 600]);

subplot(2,1,1);
plot(t, s_FM, 'b', 'LineWidth', 1.5);
title('Signal FM sans bruit', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Temps (s)', 'FontSize', 10);
ylabel('Amplitude (V)', 'FontSize', 10);
grid on;
xlim([0 0.1]);  % Zoom sur les premières 100ms

subplot(2,1,2);
plot(t, s_FM_noisy, 'r', 'LineWidth', 1.5);
title(sprintf('Signal FM avec bruit AWGN (SNR = %d dB)', SNR_dB), ...
      'FontSize', 12, 'FontWeight', 'bold');
xlabel('Temps (s)', 'FontSize', 10);
ylabel('Amplitude (V)', 'FontSize', 10);
grid on;
xlim([0 0.1]);  % Zoom sur les premières 100ms

sgtitle('Génération du Signal FM Bruité', 'FontSize', 14, 'FontWeight', 'bold');

% Sauvegarder la figure
saveas(gcf, '../images/image7b.png');
fprintf('Image 7b générée avec succès!\n');
fprintf('Signal FM bruité généré avec SNR = %d dB\n', SNR_dB);
