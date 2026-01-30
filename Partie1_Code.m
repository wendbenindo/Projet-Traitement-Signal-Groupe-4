%% TP 2 : Modulation FM - Partie I
% Analyse théorique du signal modulé FM sous Matlab
% ISGE/IC 2 - Année académique 2018-2019

clear all;
close all;
clc;

%% Paramètres du signal
% Signal modulant sinusoïdal
Ax = 1;              % Amplitude du signal modulant (1V)
fx = 10;             % Fréquence du signal modulant (10 Hz)
fc = 100*fx;         % Fréquence de la porteuse (100*fx = 1000 Hz)
fs = 10000;          % Fréquence d'échantillonnage (10 kHz)
T = 1;               % Durée du signal (1 seconde)
t = 0:1/fs:T-1/fs;   % Vecteur temps

%% 1) Génération du signal modulant x(t)
x = Ax * cos(2*pi*fx*t);

% Affichage du signal modulant
figure('Name', 'Signal Modulant');
plot(t, x, 'b', 'LineWidth', 1.5);
xlabel('Temps (s)');
ylabel('Amplitude (V)');
title('Signal Modulant x(t)');
grid on;

%% 2) Génération du signal modulé FM avec fmmod
% Test avec différentes valeurs de déviation en fréquence
deviations = [1, 10, 50, 100];  % Valeurs de Δf en Hz

figure('Name', 'Signaux Modulés FM');
for i = 1:length(deviations)
    delta_f = deviations(i);
    
    % Génération du signal FM avec fmmod
    s_FM = fmmod(x, fc, fs, delta_f);
    
    % Calcul de l'indice de modulation β = Δf / fx
    beta = delta_f / fx;
    
    % Affichage
    subplot(2, 2, i);
    plot(t(1:500), s_FM(1:500), 'r', 'LineWidth', 1);
    xlabel('Temps (s)');
    ylabel('Amplitude');
    title(sprintf('Signal FM - Δf = %d Hz, β = %.2f', delta_f, beta));
    grid on;
end

