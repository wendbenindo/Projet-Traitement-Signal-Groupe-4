% Test Q19-Q21 - Émetteur et récepteur modulés

clear all; close all; clc;

fprintf('=== Test Q19-Q21: Modulation ===\n\n');

%% Paramètres
N = 12;           % Nombre de bits
Db = 2;           % Débit binaire: 2 bits/sec
Fs = 100;         % Fréquence d'échantillonnage: 100 Hz
f0 = 13;          % Fréquence porteuse: 13 Hz
M = 4;            % QPSK
method_mod = 'QPSK';
method_fil = 'NRZ';
EbitN0_dB = 10;   % Rapport signal/bruit: 10 dB

% Message binaire
dn = randi([0 1], 1, N);

fprintf('Message binaire original (%d bits):\n', N);
disp(dn);

%% Q19: Émetteur modulé
fprintf('\n--- Q19: Émetteur modulé ---\n');
[e, t_e, alphak, K, T, E_bit, I, Q] = emetteur_mod(dn, Db, Fs, M, method_mod, method_fil, f0);

%% Q20: Canal
fprintf('\n--- Q20: Canal ---\n');
[r, t_r] = canal_mod(e, t_e, E_bit, EbitN0_dB);

%% Q21: Récepteur modulé
fprintf('\n--- Q21: Récepteur modulé ---\n');
[dn_hat, alphak_hat, ak_hat] = recepteur_mod(r, t_r, T, K, Fs, M, method_fil, method_mod, f0);

%% Vérification
fprintf('\nMessage binaire estimé:\n');
disp(dn_hat);

[TEB, nb_erreurs] = calcul_TEB(dn, dn_hat);

%% Affichage
figure('Name', 'Modulation', 'Position', [100 100 1400 800]);

% Composantes I(t) et Q(t)
subplot(3,2,1);
plot(t_e, I, 'b', 'LineWidth', 1.5);
grid on;
ylabel('I(t)');
title('Composante en phase');
xlim([0 min(5*T, t_e(end))]);

subplot(3,2,2);
plot(t_e, Q, 'r', 'LineWidth', 1.5);
grid on;
ylabel('Q(t)');
title('Composante en quadrature');
xlim([0 min(5*T, t_e(end))]);

% Signal modulé
subplot(3,2,3:4);
plot(t_e, e, 'g', 'LineWidth', 1);
grid on;
xlabel('Temps (s)');
ylabel('e(t)');
title(sprintf('Signal modulé (%s, f0=%d Hz)', method_mod, f0));
xlim([0 min(5*T, t_e(end))]);

% Plan complexe
subplot(3,2,5);
plot(real(alphak), imag(alphak), 'bo', 'MarkerSize', 10, 'LineWidth', 2);
hold on;
plot(real(alphak_hat), imag(alphak_hat), 'rx', 'MarkerSize', 8, 'LineWidth', 2);
grid on;
axis equal;
xlabel('I (partie réelle)');
ylabel('Q (partie imaginaire)');
title('Symboles dans le plan complexe');
legend('Émis', 'Reçu');

% Comparaison bits
subplot(3,2,6);
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
saveas(gcf, '../images/Q19_Q21_modulation.png');

fprintf('\n✓ Image sauvegardée: images/Q19_Q21_modulation.png\n');
