% Test Q11-Q15 - Chaîne complète avec canal et récepteur

clear all; close all; clc;

fprintf('=== Test Q11-Q15: Chaîne complète ===\n\n');

%% Paramètres
Db = 2;           % Débit binaire: 2 bits/sec
Fs = 100;         % Fréquence d'échantillonnage: 100 Hz
M = 2;            % Dictionnaire binaire
method_fil = 'NRZ';
EbitN0_dB = 10;   % Rapport signal/bruit: 10 dB

% Message binaire
N = 20;
dn = randi([0 1], 1, N);

fprintf('Message binaire original (%d bits):\n', N);
disp(dn);

%% Émetteur (Q7)
fprintf('\n--- Émetteur ---\n');
[s, t_s, x, ak, K, T, E_bit] = emetteur(dn, Db, Fs, M, method_fil);

%% Canal avec bruit (Q11)
fprintf('\n--- Canal ---\n');
[y, t_y] = canal(s, t_s, E_bit, EbitN0_dB);

%% Récepteur (Q12-Q15)
fprintf('\n--- Récepteur ---\n');
[dn_hat, ak_hat] = recepteur(y, t_y, T, K, Fs, M, method_fil);

%% Vérification
fprintf('\nMessage binaire estimé:\n');
disp(dn_hat);

[TEB, nb_erreurs] = calcul_TEB(dn, dn_hat);

%% Affichage
figure('Name', 'Chaîne complète', 'Position', [100 100 1200 800]);

% Signal émis
subplot(4,1,1);
plot(t_s, s, 'b', 'LineWidth', 1.5);
grid on;
ylabel('x(t)');
title('Signal émis');
xlim([0 min(5*T, t_s(end))]);

% Signal bruité
subplot(4,1,2);
plot(t_y, y, 'r', 'LineWidth', 1);
grid on;
ylabel('y(t)');
title(sprintf('Signal bruité (Eb/N0 = %d dB)', EbitN0_dB));
xlim([0 min(5*T, t_y(end))]);

% Comparaison symboles
subplot(4,1,3);
stem(0:K-1, ak, 'b', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
stem(0:K-1, ak_hat, 'rx', 'LineWidth', 1.5, 'MarkerSize', 6);
grid on;
xlabel('Index k');
ylabel('Symbole');
title('Symboles émis vs estimés');
legend('Émis', 'Estimé');

% Comparaison bits
subplot(4,1,4);
N_min = min(length(dn), length(dn_hat));
stem(0:N_min-1, dn(1:N_min), 'b', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
stem(0:N_min-1, dn_hat(1:N_min), 'rx', 'LineWidth', 1.5, 'MarkerSize', 6);
grid on;
xlabel('Index');
ylabel('Bit');
title(sprintf('Bits émis vs estimés (TEB = %.4f)', TEB));
legend('Émis', 'Estimé');
ylim([-0.5 1.5]);

% Sauvegarder
if ~exist('../images', 'dir')
    mkdir('../images');
end
saveas(gcf, '../images/Q11_Q15_chaine_complete.png');

fprintf('\n✓ Image sauvegardée: images/Q11_Q15_chaine_complete.png\n');
