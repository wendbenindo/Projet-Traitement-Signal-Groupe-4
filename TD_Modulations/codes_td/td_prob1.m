%% TD Modulations - Problème 1 : Modulation AM et FM
% Bandes de fréquences GO et FM

close all;
clear all;
clc;

fprintf('========================================\n');
fprintf('  PROBLÈME 1 : MODULATION AM ET FM\n');
fprintf('========================================\n\n');

%% Données
% GO : 1052 m à 2000 m
% FM : 87.5 MHz à 108 MHz

c = 3e8;  % Vitesse de la lumière (m/s)

%% 1. Compléter le tableau

% GO (Grandes Ondes)
lambda_GO_min = 1052;  % m
lambda_GO_max = 2000;  % m

f_GO_max = c / lambda_GO_min;  % Hz
f_GO_min = c / lambda_GO_max;  % Hz

% FM
f_FM_min = 87.5e6;  % Hz
f_FM_max = 108e6;   % Hz

lambda_FM_max = c / f_FM_min;  % m
lambda_FM_min = c / f_FM_max;  % m

fprintf('1. Tableau des fréquences et longueurs d''onde :\n\n');
fprintf('┌─────────┬──────────────────────────┬──────────────────────────┐\n');
fprintf('│  Bande  │      Fréquence           │   Longueur d''onde       │\n');
fprintf('├─────────┼──────────────────────────┼──────────────────────────┤\n');
fprintf('│   GO    │ De %.1f kHz à %.1f kHz │ De %.0f m à %.0f m      │\n', ...
        f_GO_min/1e3, f_GO_max/1e3, lambda_GO_min, lambda_GO_max);
fprintf('│   FM    │ De %.1f MHz à %.0f MHz │ De %.2f m à %.2f m    │\n', ...
        f_FM_min/1e6, f_FM_max/1e6, lambda_FM_min, lambda_FM_max);
fprintf('└─────────┴──────────────────────────┴──────────────────────────┘\n\n');

%% 2. Nombre d'émetteurs en GO

BW_canal_GO = 9e3;  % 9 kHz par canal
BW_totale_GO = f_GO_max - f_GO_min;  % Bande totale GO

nb_emetteurs_GO = floor(BW_totale_GO / BW_canal_GO);

fprintf('2. Nombre d''émetteurs en GO :\n');
fprintf('   Bande totale GO : %.2f kHz\n', BW_totale_GO/1e3);
fprintf('   Largeur par canal : %.0f kHz\n', BW_canal_GO/1e3);
fprintf('   Nombre maximum d''émetteurs : %.0f\n\n', nb_emetteurs_GO);

%% 3. Fonctions contenant le signal modulant

fprintf('3. Fonctions contenant le signal modulant :\n\n');

fprintf('   a) En modulation d''amplitude (AM) :\n');
fprintf('      Signal modulé : s(t) = X(t)·cos(θ(t))\n');
fprintf('      où X(t) = Ac[1 + m·x(t)] contient le signal modulant x(t)\n');
fprintf('      La fonction qui contient le signal modulant est : X(t)\n\n');

fprintf('   b) En modulation de fréquence (FM) :\n');
fprintf('      Signal modulé : s(t) = X(t)·cos(θ(t))\n');
fprintf('      où θ(t) = 2π·fc·t + 2π·kf·∫x(τ)dτ contient le signal modulant\n');
fprintf('      La fonction qui contient le signal modulant est : θ(t)\n\n');

%% 4. Analyse de l'enregistrement

fprintf('4. Analyse de l''enregistrement :\n');
fprintf('   (Voir figure dans le rapport)\n\n');

%% Visualisation des bandes

figure('Position', [100, 100, 1000, 500]);

% Bande GO
subplot(2,1,1);
f_GO = linspace(f_GO_min, f_GO_max, 1000);
y_GO = ones(size(f_GO));
fill([f_GO_min, f_GO, f_GO_max], [0, y_GO, 0], 'b', 'FaceAlpha', 0.3);
xlabel('Fréquence (kHz)', 'FontSize', 11);
ylabel('Amplitude', 'FontSize', 11);
title('Bande GO (Grandes Ondes)', 'FontSize', 13, 'FontWeight', 'bold');
xlim([f_GO_min*0.9, f_GO_max*1.1]);
ylim([0, 1.5]);
grid on;
text((f_GO_min+f_GO_max)/2, 0.5, sprintf('%.0f kHz - %.0f kHz', ...
     f_GO_min/1e3, f_GO_max/1e3), 'HorizontalAlignment', 'center', ...
     'FontSize', 12, 'FontWeight', 'bold');

% Bande FM
subplot(2,1,2);
f_FM = linspace(f_FM_min, f_FM_max, 1000);
y_FM = ones(size(f_FM));
fill([f_FM_min, f_FM, f_FM_max], [0, y_FM, 0], 'r', 'FaceAlpha', 0.3);
xlabel('Fréquence (MHz)', 'FontSize', 11);
ylabel('Amplitude', 'FontSize', 11);
title('Bande FM', 'FontSize', 13, 'FontWeight', 'bold');
xlim([f_FM_min*0.95, f_FM_max*1.05]);
ylim([0, 1.5]);
grid on;
text((f_FM_min+f_FM_max)/2, 0.5, sprintf('%.1f MHz - %.0f MHz', ...
     f_FM_min/1e6, f_FM_max/1e6), 'HorizontalAlignment', 'center', ...
     'FontSize', 12, 'FontWeight', 'bold');

sgtitle('Bandes de Fréquences GO et FM', 'FontSize', 15, 'FontWeight', 'bold');

saveas(gcf, '../images_td/td_prob1_bandes.png');
fprintf('[Image 1/2] Bandes de fréquences générées\n');

%% Comparaison GO vs FM

figure('Position', [100, 100, 900, 600]);

categories = {'GO', 'FM'};
freq_min = [f_GO_min/1e3, f_FM_min/1e6];
freq_max = [f_GO_max/1e3, f_FM_max/1e6];
lambda_min = [lambda_GO_min, lambda_FM_min];
lambda_max = [lambda_GO_max, lambda_FM_max];

subplot(2,2,1);
bar(freq_min);
set(gca, 'XTickLabel', categories);
ylabel('Fréquence min (kHz/MHz)', 'FontSize', 10);
title('Fréquence Minimale', 'FontSize', 11, 'FontWeight', 'bold');
grid on;

subplot(2,2,2);
bar(freq_max);
set(gca, 'XTickLabel', categories);
ylabel('Fréquence max (kHz/MHz)', 'FontSize', 10);
title('Fréquence Maximale', 'FontSize', 11, 'FontWeight', 'bold');
grid on;

subplot(2,2,3);
bar(lambda_min);
set(gca, 'XTickLabel', categories);
ylabel('λ min (m)', 'FontSize', 10);
title('Longueur d''onde Minimale', 'FontSize', 11, 'FontWeight', 'bold');
grid on;

subplot(2,2,4);
bar(lambda_max);
set(gca, 'XTickLabel', categories);
ylabel('λ max (m)', 'FontSize', 10);
title('Longueur d''onde Maximale', 'FontSize', 11, 'FontWeight', 'bold');
grid on;

sgtitle('Comparaison GO vs FM', 'FontSize', 14, 'FontWeight', 'bold');

saveas(gcf, '../images_td/td_prob1_comparaison.png');
fprintf('[Image 2/2] Comparaison générée\n');

fprintf('\n========================================\n');
fprintf('  PROBLÈME 1 TERMINÉ\n');
fprintf('========================================\n\n');

close all;
