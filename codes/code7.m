%% Code 7 - Démodulation avec erreur de fréquence
% Ce code simule une erreur de synchronisation en fréquence

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

% Signal FM avec fc = 1000 Hz
delta_f = 50;
s_FM = fmmod(x, fc, fs, delta_f);

% Démodulation avec erreur de fréquence (fr = fc + 1)
fr = fc + 1;
x2_error = fmdemod(s_FM, fr, fs, delta_f);

% Démodulation correcte pour comparaison
x2_correct = fmdemod(s_FM, fc, fs, delta_f);

% Calcul de la composante continue
DC_offset = mean(x2_error);
fprintf('Composante continue introduite: %.4f V\n', DC_offset);
fprintf('Erreur de fréquence: %.0f Hz\n', fr - fc);

% Affichage comparatif
figure('Position', [100, 100, 900, 700]);

subplot(3,1,1);
plot(t, x, 'b', 'LineWidth', 2);
ylabel('Amplitude (V)', 'FontSize', 11);
title('Signal Original x(t)', 'FontSize', 12, 'FontWeight', 'bold');
grid on;
xlim([0 0.5]);
ylim([-1.2 1.2]);

subplot(3,1,2);
plot(t, x2_correct, 'g', 'LineWidth', 1.5);
ylabel('Amplitude (V)', 'FontSize', 11);
title('Démodulation Correcte (f_r = f_c)', 'FontSize', 12, 'FontWeight', 'bold');
grid on;
xlim([0 0.5]);
ylim([-1.2 1.2]);

subplot(3,1,3);
plot(t, x2_error, 'r', 'LineWidth', 1.5);
xlabel('Temps (s)', 'FontSize', 11);
ylabel('Amplitude (V)', 'FontSize', 11);
title(sprintf('Démodulation avec Erreur (f_r = f_c + 1 Hz, DC offset = %.4f V)', DC_offset), ...
      'FontSize', 12, 'FontWeight', 'bold');
grid on;
xlim([0 0.5]);

% Tracer la ligne de DC offset
hold on;
yline(DC_offset, 'k--', 'LineWidth', 1.5);
hold off;

sgtitle('Effet d''une Erreur de Fréquence sur la Démodulation FM', ...
        'FontSize', 14, 'FontWeight', 'bold');

% Sauvegarder la figure
saveas(gcf, '../images/image7.png');
fprintf('Image 7 générée avec succès!\n');
