% Test Q7 - Émetteur complet

clear all; close all; clc;

fprintf('=== Test Q7 - Émetteur complet ===\n\n');

%% Paramètres
Db = 2;           % Débit binaire: 2 bits/sec
Fs = 100;         % Fréquence d'échantillonnage: 100 Hz
M = 2;            % Dictionnaire binaire
method_fil = 'NRZ';

% Génération d'un message binaire aléatoire
N = 10;
dn = randi([0 1], 1, N);

fprintf('Message binaire (N=%d bits):\n', N);
disp(dn);

%% Appel de l'émetteur complet
[s, t_s, x, ak, K, T, E_bit] = emetteur(dn, Db, Fs, M, method_fil);

fprintf('\nRésultats:\n');
fprintf('- Nombre de symboles: %d\n', K);
fprintf('- Période symbole: %.6f s\n', T);
fprintf('- Énergie moyenne par bit: %.6f\n', E_bit);
fprintf('- Durée du signal: %.6f s\n', t_s(end));

%% Affichage
figure('Name', 'Émetteur complet', 'Position', [100 100 1200 600]);

% Signal émis
subplot(2,1,1);
plot(t_s, s, 'b', 'LineWidth', 1.5);
grid on;
xlabel('Temps (s)');
ylabel('x(t)');
title(sprintf('Signal émis - Filtre %s, M=%d, Db=%d bits/s', method_fil, M, Db));

% Zoom sur les premiers symboles
subplot(2,1,2);
t_zoom = min(5*T, t_s(end));
idx_zoom = t_s <= t_zoom;
plot(t_s(idx_zoom), s(idx_zoom), 'r', 'LineWidth', 2);
hold on;
% Marquer les positions des symboles
for k = 0:min(K-1, 4)
    xline(k*T, 'k--', 'LineWidth', 0.5);
    if k < K
        text(k*T + T/2, max(s(idx_zoom))*0.9, sprintf('a_%d=%d', k, ak(k+1)), ...
             'HorizontalAlignment', 'center');
    end
end
grid on;
xlabel('Temps (s)');
ylabel('x(t)');
title('Zoom sur les 5 premiers symboles');
xlim([0 t_zoom]);

% Sauvegarder l'image
if ~exist('../images', 'dir')
    mkdir('../images');
end
saveas(gcf, '../images/Q7_emetteur_complet.png');

fprintf('\n✓ Image sauvegardée: images/Q7_emetteur_complet.png\n');

%% Test avec différents filtres
fprintf('\n=== Comparaison des filtres ===\n');
filtres = {'NRZ', 'RZ', 'biphase'};

figure('Name', 'Comparaison des filtres', 'Position', [100 100 1200 800]);

for i = 1:length(filtres)
    [s_i, t_s_i, ~, ~, ~, ~, E_bit_i] = emetteur(dn, Db, Fs, M, filtres{i});
    
    subplot(3,1,i);
    plot(t_s_i, s_i, 'LineWidth', 1.5);
    grid on;
    xlabel('Temps (s)');
    ylabel('x(t)');
    title(sprintf('Filtre %s - E_{bit}=%.6f', filtres{i}, E_bit_i));
    xlim([0 min(5*T, t_s_i(end))]);
end

saveas(gcf, '../images/Q7_comparaison_filtres.png');
fprintf('✓ Image sauvegardée: images/Q7_comparaison_filtres.png\n');
