% Exemple de code MATLAB pour le projet CommNum
% Ce fichier montre comment structurer vos codes

clear all;
close all;
clc;

%% Parametres
fs = 10000;  % Frequence d'echantillonnage (Hz)
T = 1;       % Duree du signal (s)
t = 0:1/fs:T-1/fs;  % Vecteur temps

%% Generation du signal
f = 10;  % Frequence du signal (Hz)
signal = cos(2*pi*f*t);

%% Affichage
figure('Name', 'Exemple de Signal');
plot(t, signal, 'b', 'LineWidth', 2);
xlabel('Temps (s)');
ylabel('Amplitude');
title('Signal Exemple');
grid on;
xlim([0 0.5]);

%% Sauvegarde de la figure
% IMPORTANT: Sauvegarder dans le dossier images/
saveas(gcf, '../images/exemple.png');

fprintf('Image sauvegardee: exemple.png\n');
