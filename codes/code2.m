%% Code 2 - Génération du signal modulé FM
% Ce code génère le signal FM et compare avec le signal modulant

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

% Génération du signal FM avec déviation de 50 Hz
delta_f = 50;
s_FM = fmmod(x, fc, fs, delta_f);

% Calcul de l'indice de modulation
beta = delta_f / fx;

fprintf('Déviation en fréquence: %.0f Hz\n', delta_f);
fprintf('Indice de modulation beta: %.2f\n', beta);

% Affichage comparatif
figure('Position', [100, 100, 900, 600]);

subplot(2,1,1);
plot(t(1:1000), x(1:1000), 'b', 'LineWidth', 2);
xlabel('Temps (s)', 'FontSize', 11);
ylabel('Amplitude (V)', 'FontSize', 11);
title('Signal Modulant x(t)', 'FontSize', 13, 'FontWeight', 'bold');
grid on;
ylim([-1.2 1.2]);

subplot(2,1,2);
plot(t(1:1000), s_FM(1:1000), 'r', 'LineWidth', 1);
xlabel('Temps (s)', 'FontSize', 11);
ylabel('Amplitude', 'FontSize', 11);
title(sprintf('Signal Modulé FM - \\Deltaf = %d Hz, \\beta = %.2f', delta_f, beta), ...
      'FontSize', 13, 'FontWeight', 'bold');
grid on;

% Sauvegarder la figure
saveas(gcf, '../images/image2.png');
fprintf('Image 2 générée avec succès!\n');
