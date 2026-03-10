% Test de la fonction Q3 - Génération du peigne de Dirac

clear all; close all; clc;

%% Paramètres
Db = 2;           % Débit binaire: 2 bits/sec
Fs = 100;         % Fréquence d'échantillonnage: 100 Hz
M = 2;            % Dictionnaire binaire
method_mod = 'antipolaire';

% Message binaire
dn = [1 0 1 1 0];

fprintf('=== Test Q3 - Génération du peigne de Dirac ===\n');

%% Conversion bits -> symboles
[ak, T, K] = conversion_bitsymboles(dn, Db, M, method_mod);

fprintf('Message binaire: ');
disp(dn);
fprintf('Symboles ak: ');
disp(ak);
fprintf('Période symbole T = %.3f s\n', T);
fprintf('Nombre de symboles K = %d\n', K);

%% Génération du peigne de Dirac
[a, t_a] = genere_dirac(ak, K, T, Fs);

fprintf('Durée du signal: %.3f s\n', t_a(end));
fprintf('Nombre d''échantillons: %d\n', length(a));

%% Affichage
figure('Name', 'Peigne de Dirac', 'Position', [100 100 1000 400]);

% Signal a(t)
stem(t_a, a, 'b', 'LineWidth', 1.5, 'MarkerSize', 6);
hold on;
plot(t_a, a, 'b--', 'LineWidth', 0.5);
grid on;
xlabel('Temps (s)');
ylabel('Amplitude');
title(sprintf('Peigne de Dirac - K=%d symboles, T=%.3f s', K, T));
ylim([min(ak)-0.5, max(ak)+0.5]);

% Marquer les positions des symboles
for k = 0:K-1
    xline(k*T, 'r--', 'LineWidth', 0.5);
end

legend('Impulsions de Dirac', 'Signal', 'Positions des symboles');

% Sauvegarder l'image
if ~exist('../images', 'dir')
    mkdir('../images');
end
saveas(gcf, '../images/Q3_peigne_dirac.png');

fprintf('\n✓ Image sauvegardée: images/Q3_peigne_dirac.png\n');
