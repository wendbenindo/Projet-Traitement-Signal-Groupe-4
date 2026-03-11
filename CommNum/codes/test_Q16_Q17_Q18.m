% Test Q16, Q17, Q18 - Performances de la chaîne (TEB)

clear all; close all; clc;

fprintf('=== Test Q16-Q18: Performances (TEB) ===\n\n');

%% Paramètres
N = 20000;        % Nombre de bits
Db = 2;           % Débit binaire: 2 bits/sec
Fs = 100;         % Fréquence d'échantillonnage: 100 Hz
M = 2;            % Dictionnaire binaire
method_mod = 'antipolaire';

% Plage de Eb/N0 en dB
EbN0_dB_range = 0:1:5;  % De 0 à 5 dB

%% Q16: TEB avec filtre NRZ et dictionnaire antipolaire
fprintf('\n--- Q16: TEB avec NRZ et antipolaire ---\n');
method_fil = 'NRZ';

TEB_exp_NRZ = zeros(size(EbN0_dB_range));
TEB_theo_NRZ = zeros(size(EbN0_dB_range));

for i = 1:length(EbN0_dB_range)
    EbN0_dB = EbN0_dB_range(i);
    
    % Génération du message aléatoire
    dn = randi([0 1], 1, N);
    
    % Émetteur
    [s, t_s, x, ak, K, T, E_bit] = emetteur(dn, Db, Fs, M, method_fil);
    
    % Canal avec bruit
    [y, t_y] = canal(s, t_s, E_bit, EbN0_dB);
    
    % Récepteur
    [dn_hat, ak_hat] = recepteur(y, t_y, T, K, Fs, M, method_fil);
    
    % Calcul du TEB expérimental
    [TEB_exp_NRZ(i), ~] = calcul_TEB(dn, dn_hat);
    
    % TEB théorique pour BPSK
    EbN0_lin = 10^(EbN0_dB/10);
    TEB_theo_NRZ(i) = 0.5 * erfc(sqrt(EbN0_lin));
    
    fprintf('Eb/N0 = %d dB: TEB_exp = %.6f, TEB_theo = %.6f\n', ...
            EbN0_dB, TEB_exp_NRZ(i), TEB_theo_NRZ(i));
end

%% Q17: TEB avec différents filtres (NRZ, RZ, biphase)
fprintf('\n--- Q17: TEB avec différents filtres ---\n');
filtres = {'NRZ', 'RZ', 'biphase'};
TEB_filtres = zeros(length(filtres), length(EbN0_dB_range));

for f = 1:length(filtres)
    method_fil = filtres{f};
    fprintf('\nFiltre: %s\n', method_fil);
    
    for i = 1:length(EbN0_dB_range)
        EbN0_dB = EbN0_dB_range(i);
        
        dn = randi([0 1], 1, N);
        [s, t_s, ~, ak, K, T, E_bit] = emetteur(dn, Db, Fs, M, method_fil);
        [y, t_y] = canal(s, t_s, E_bit, EbN0_dB);
        [dn_hat, ~] = recepteur(y, t_y, T, K, Fs, M, method_fil);
        [TEB_filtres(f, i), ~] = calcul_TEB(dn, dn_hat);
    end
end

%% Q18: TEB avec NRZ et différents dictionnaires (M=2, 4, 8)
fprintf('\n--- Q18: TEB avec différents dictionnaires ---\n');
M_values = [2, 4, 8];
TEB_dict = zeros(length(M_values), length(EbN0_dB_range));
method_fil = 'NRZ';

for m_idx = 1:length(M_values)
    M = M_values(m_idx);
    fprintf('\nM = %d\n', M);
    
    for i = 1:length(EbN0_dB_range)
        EbN0_dB = EbN0_dB_range(i);
        
        % Générer plus de bits pour M > 2
        N_bits = N * log2(M);
        dn = randi([0 1], 1, N_bits);
        
        [s, t_s, ~, ak, K, T, E_bit] = emetteur(dn, Db, Fs, M, method_fil);
        [y, t_y] = canal(s, t_s, E_bit, EbN0_dB);
        [dn_hat, ~] = recepteur(y, t_y, T, K, Fs, M, method_fil);
        [TEB_dict(m_idx, i), ~] = calcul_TEB(dn, dn_hat);
    end
end

%% Affichage des résultats
figure('Name', 'Performances TEB', 'Position', [100 100 1400 500]);

% Q16: Comparaison expérimental vs théorique
subplot(1,3,1);
semilogy(EbN0_dB_range, TEB_exp_NRZ, 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
hold on;
semilogy(EbN0_dB_range, TEB_theo_NRZ, 'r--', 'LineWidth', 2);
grid on;
xlabel('E_b/N_0 (dB)');
ylabel('TEB');
title('Q16: TEB NRZ antipolaire');
legend('Expérimental', 'Théorique', 'Location', 'southwest');
ylim([1e-4 1]);

% Q17: Comparaison des filtres
subplot(1,3,2);
for f = 1:length(filtres)
    semilogy(EbN0_dB_range, TEB_filtres(f,:), 'o-', 'LineWidth', 2, ...
             'MarkerSize', 8, 'DisplayName', filtres{f});
    hold on;
end
grid on;
xlabel('E_b/N_0 (dB)');
ylabel('TEB');
title('Q17: Influence du filtre');
legend('Location', 'southwest');
ylim([1e-4 1]);

% Q18: Comparaison des dictionnaires
subplot(1,3,3);
for m_idx = 1:length(M_values)
    semilogy(EbN0_dB_range, TEB_dict(m_idx,:), 'o-', 'LineWidth', 2, ...
             'MarkerSize', 8, 'DisplayName', sprintf('M=%d', M_values(m_idx)));
    hold on;
end
grid on;
xlabel('E_b/N_0 (dB)');
ylabel('TEB');
title('Q18: Influence de M (NRZ)');
legend('Location', 'southwest');
ylim([1e-4 1]);

% Sauvegarder
if ~exist('../images', 'dir')
    mkdir('../images');
end
saveas(gcf, '../images/Q16_Q17_Q18_TEB.png');

fprintf('\n✓ Image sauvegardée: images/Q16_Q17_Q18_TEB.png\n');
