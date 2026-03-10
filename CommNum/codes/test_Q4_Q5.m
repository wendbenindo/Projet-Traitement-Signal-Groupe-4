% Test des fonctions Q4 et Q5 - Filtres de mise en forme

clear all; close all; clc;

%% Paramètres
Db = 2;           % Débit binaire: 2 bits/sec
Fs = 100;         % Fréquence d'échantillonnage: 100 Hz
M = 2;            % Dictionnaire binaire
method_mod = 'antipolaire';
T = 0.5;          % Période symbole (sera calculée automatiquement)

% Message binaire
dn = randi([0 1], 1, 10);

fprintf('=== Test Q4 et Q5 - Filtres de mise en forme ===\n');

%% Conversion et génération du peigne
[ak, T, K] = conversion_bitsymboles(dn, Db, M, method_mod);
[a, t_a] = genere_dirac(ak, K, T, Fs);

%% Test des différents filtres
filtres = {'NRZ', 'RZ', 'biphase'};
t_he = 0 : 1/Fs : T - 1/Fs;

figure('Name', 'Filtres de mise en forme', 'Position', [100 100 1200 800]);

for i = 1:length(filtres)
    method_fil = filtres{i};
    
    % Création du filtre (Q4)
    [he, E_he] = create_filter(t_he, T, method_fil);
    
    % Application du filtre (Q5)
    [s, t_s, ~, E_s] = filtre_emission(a, t_a, K, T, Fs, method_fil);
    
    fprintf('\n--- Filtre %s ---\n', method_fil);
    fprintf('Énergie du filtre E_he: %.6f\n', E_he);
    fprintf('Énergie du signal émis E_s: %.6f\n', E_s);
    
    % Affichage du filtre
    subplot(3, 2, 2*i-1);
    plot(t_he, he, 'b', 'LineWidth', 2);
    grid on;
    xlabel('Temps (s)');
    ylabel('h_e(t)');
    title(sprintf('Filtre %s - E_{he}=%.3f', method_fil, E_he));
    ylim([-1.5 1.5]);
    
    % Affichage du signal émis
    subplot(3, 2, 2*i);
    plot(t_s, s, 'r', 'LineWidth', 1.5);
    grid on;
    xlabel('Temps (s)');
    ylabel('x(t)');
    title(sprintf('Signal émis avec filtre %s', method_fil));
    xlim([0 min(3*T, t_s(end))]);  % Afficher les 3 premiers symboles
end

% Sauvegarder l'image
if ~exist('../images', 'dir')
    mkdir('../images');
end
saveas(gcf, '../images/Q4_Q5_filtres.png');

fprintf('\n✓ Image sauvegardée: images/Q4_Q5_filtres.png\n');
