%% Code 5 - Démodulation FM
% Ce code démodule le signal FM et compare avec l'original

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

% Signal FM avec déviation de 50 Hz
delta_f = 50;
s_FM = fmmod(x, fc, fs, delta_f);

% Démodulation
x2 = fmdemod(s_FM, fc, fs, delta_f);

% Affichage
figure('Position', [100, 100, 900, 500]);
plot(t, x, 'b', 'LineWidth', 2.5);
hold on;
plot(t, x2, 'r--', 'LineWidth', 1.8);
hold off;
xlabel('Temps (s)', 'FontSize', 12);
ylabel('Amplitude (V)', 'FontSize', 12);
title('Démodulation FM : Comparaison Signal Original vs Signal Démodulé', ...
      'FontSize', 14, 'FontWeight', 'bold');
legend('Signal original x(t)', 'Signal démodulé x_2(t)', 'Location', 'northeast', ...
       'FontSize', 11);
grid on;
xlim([0 0.5]);
ylim([-1.2 1.2]);

% Sauvegarder la figure
saveas(gcf, '../images/image5.png');
fprintf('Image 5 générée avec succès!\n');
