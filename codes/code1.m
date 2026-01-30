%% Code 1 - Génération du signal modulant
% Ce code génère le signal modulant sinusoïdal et sauvegarde la figure

close all;

% Paramètres
Ax = 1;              % Amplitude (1V)
fx = 10;             % Fréquence (10 Hz)
fc = 100*fx;         % Fréquence porteuse (1000 Hz)
fs = 10000;          % Fréquence d'échantillonnage
T = 1;               % Durée (1 seconde)
t = 0:1/fs:T-1/fs;   % Vecteur temps

% Signal modulant
x = Ax * cos(2*pi*fx*t);

% Affichage
figure('Position', [100, 100, 800, 400]);
plot(t, x, 'b', 'LineWidth', 2);
xlabel('Temps (s)', 'FontSize', 12);
ylabel('Amplitude (V)', 'FontSize', 12);
title('Signal Modulant x(t)', 'FontSize', 14, 'FontWeight', 'bold');
grid on;
xlim([0 0.5]);  % Afficher 5 périodes
ylim([-1.2 1.2]);

% Sauvegarder la figure
saveas(gcf, '../images/image1.png');
fprintf('Image 1 générée avec succès!\n');
