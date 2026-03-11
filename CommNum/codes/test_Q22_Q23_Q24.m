% Test Q22, Q23, Q24 - Modulations (plan complexe, DSP, TEB)

clear all; close all; clc;

fprintf('=== Test Q22-Q24: Modulations ===\n\n');

%% Paramètres
N = 24000;        % Nombre de bits
Db = 2;           % Débit binaire: 2 bits/sec
Fs = 100;         % Fréquence d'échantillonnage: 100 Hz
f0 = 13;          % Fréquence porteuse: 13 Hz
method_fil = 'NRZ';

% 3 modulations à comparer
modulations = {'BPSK', 'QPSK', '8PSK'};
M_values = [2, 4, 8];

%% Q22: Plan complexe des symboles
fprintf('\n--- Q22: Plan complexe ---\n');

figure('Name', 'Q22: Symboles dans le plan complexe', 'Position', [100 100 1400 400]);

for mod_idx = 1:length(modulations)
    method_mod = modulations{mod_idx};
    M = M_values(mod_idx);
    
    % Générer un message
    N_bits = 1000 * log2(M);
    dn = randi([0 1], 1, N_bits);
    
    % Émetteur modulé
    [e, t_e, alphak, K, T, E_bit, I, Q] = emetteur_mod(dn, Db, Fs, M, method_mod, method_fil, f0);
    
    % Canal avec bruit (Eb/N0 = 10 dB)
    [r, t_r] = canal_mod(e, t_e, E_bit, 10);
    
    % Récepteur
    [dn_hat, alphak_hat, ~] = recepteur_mod(r, t_r, T, K, Fs, M, method_fil, method_mod, f0);
    
    % Affichage dans le plan complexe
    subplot(1,3,mod_idx);
    plot(real(alphak), imag(alphak), 'bo', 'MarkerSize', 8, 'LineWidth', 2);
    hold on;
    plot(real(alphak_hat), imag(alphak_hat), 'rx', 'MarkerSize', 6, 'LineWidth', 1.5);
    grid on;
    axis equal;
    xlabel('I (partie réelle)');
    ylabel('Q (partie imaginaire)');
    title(sprintf('%s (M=%d)', method_mod, M));
    legend('Émis', 'Reçu', 'Location', 'best');
end

saveas(gcf, '../images/Q22_plan_complexe.png');
fprintf('✓ Image sauvegardée: images/Q22_plan_complexe.png\n');

%% Q23: Densité Spectrale de Puissance (DSP)
fprintf('\n--- Q23: DSP des signaux modulés ---\n');

figure('Name', 'Q23: DSP des modulations', 'Position', [100 100 1400 400]);

for mod_idx = 1:length(modulations)
    method_mod = modulations{mod_idx};
    M = M_values(mod_idx);
    
    N_bits = 10000 * log2(M);
    dn = randi([0 1], 1, N_bits);
    
    [e, t_e, ~, ~, ~, ~, ~, ~] = emetteur_mod(dn, Db, Fs, M, method_mod, method_fil, f0);
    
    % Calcul de la DSP
    [Pxx, f] = pwelch(e, hamming(1024), 512, 2048, Fs, 'centered');
    
    % Affichage
    subplot(1,3,mod_idx);
    plot(f, 10*log10(Pxx), 'b', 'LineWidth', 1.5);
    grid on;
    xlabel('Fréquence (Hz)');
    ylabel('DSP (dB/Hz)');
    title(sprintf('DSP - %s', method_mod));
    xlim([-50 50]);
end

saveas(gcf, '../images/Q23_DSP.png');
fprintf('✓ Image sauvegardée: images/Q23_DSP.png\n');

%% Q24: TEB en fonction de Eb/N0
fprintf('\n--- Q24: TEB des modulations ---\n');

EbN0_dB_range = 0:1:10;
TEB_modulations = zeros(length(modulations), length(EbN0_dB_range));
TEB_theo = zeros(length(modulations), length(EbN0_dB_range));

for mod_idx = 1:length(modulations)
    method_mod = modulations{mod_idx};
    M = M_values(mod_idx);
    
    fprintf('\nModulation: %s\n', method_mod);
    
    for i = 1:length(EbN0_dB_range)
        EbN0_dB = EbN0_dB_range(i);
        
        N_bits = 10000 * log2(M);
        dn = randi([0 1], 1, N_bits);
        
        [e, t_e, ~, K, T, E_bit, ~, ~] = emetteur_mod(dn, Db, Fs, M, method_mod, method_fil, f0);
        [r, t_r] = canal_mod(e, t_e, E_bit, EbN0_dB);
        [dn_hat, ~, ~] = recepteur_mod(r, t_r, T, K, Fs, M, method_fil, method_mod, f0);
        
        [TEB_modulations(mod_idx, i), ~] = calcul_TEB(dn, dn_hat);
        
        % TEB théorique
        EbN0_lin = 10^(EbN0_dB/10);
        switch method_mod
            case 'BPSK'
                TEB_theo(mod_idx, i) = 0.5 * erfc(sqrt(EbN0_lin));
            case 'QPSK'
                TEB_theo(mod_idx, i) = 0.5 * erfc(sqrt(EbN0_lin));
            case '8PSK'
                TEB_theo(mod_idx, i) = (1/3) * erfc(sqrt(3*EbN0_lin) * sin(pi/8));
        end
        
        fprintf('  Eb/N0=%d dB: TEB=%.6f\n', EbN0_dB, TEB_modulations(mod_idx, i));
    end
end

% Affichage
figure('Name', 'Q24: TEB des modulations', 'Position', [100 100 800 600]);

for mod_idx = 1:length(modulations)
    semilogy(EbN0_dB_range, TEB_modulations(mod_idx,:), 'o-', ...
             'LineWidth', 2, 'MarkerSize', 8, ...
             'DisplayName', sprintf('%s (exp)', modulations{mod_idx}));
    hold on;
    semilogy(EbN0_dB_range, TEB_theo(mod_idx,:), '--', ...
             'LineWidth', 1.5, ...
             'DisplayName', sprintf('%s (theo)', modulations{mod_idx}));
end

grid on;
xlabel('E_b/N_0 (dB)');
ylabel('TEB');
title('Q24: Comparaison des modulations');
legend('Location', 'southwest');
ylim([1e-5 1]);

saveas(gcf, '../images/Q24_TEB_modulations.png');
fprintf('\n✓ Image sauvegardée: images/Q24_TEB_modulations.png\n');

fprintf('\n=== Tests Q22-Q24 terminés ===\n');
