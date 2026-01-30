%% Code 9 - Analyse du seuil de démodulation FM
% Ce code détermine le seuil SNR pour une démodulation correcte

close all;

% Paramètres
Ax = 1;
fx = 10;
fc = 100*fx;
fs = 10000;
T = 1;
t = 0:1/fs:T-1/fs;

% Signal modulant
x = Ax * cos(2*pi*fx*t);

% Signal FM
delta_f = 50;
s_FM = fmmod(x, fc, fs, delta_f);

% Test avec différentes valeurs de SNR
SNR_values = 0:2:30;  % SNR de 0 à 30 dB
MSE_values = zeros(size(SNR_values));
SNR_out_values = zeros(size(SNR_values));

fprintf('=== ANALYSE DU SEUIL DE DÉMODULATION FM ===\n\n');
fprintf('%-10s %-15s %-15s\n', 'SNR in (dB)', 'MSE', 'SNR out (dB)');
fprintf('------------------------------------------------\n');

for i = 1:length(SNR_values)
    SNR_dB = SNR_values(i);
    
    % Ajout de bruit
    s_FM_noisy = awgn(s_FM, SNR_dB, 'measured');
    
    % Démodulation
    x2_noisy = fmdemod(s_FM_noisy, fc, fs, delta_f);
    
    % Calcul de l'erreur quadratique moyenne
    erreur = x - x2_noisy;
    MSE_values(i) = mean(erreur.^2);
    
    % Calcul du SNR de sortie
    SNR_out_values(i) = 10*log10(mean(x.^2)/MSE_values(i));
    
    fprintf('%-10d %-15.4e %-15.2f\n', SNR_dB, MSE_values(i), SNR_out_values(i));
end

% Détermination du seuil (MSE < 0.1 comme critère)
seuil_idx = find(MSE_values < 0.1, 1, 'first');
if ~isempty(seuil_idx)
    SNR_seuil = SNR_values(seuil_idx);
    fprintf('\n==> Seuil de démodulation correcte : SNR >= %d dB\n', SNR_seuil);
else
    fprintf('\n==> Aucun seuil trouvé dans la plage testée\n');
end

% Affichage graphique
figure('Position', [100, 100, 1000, 600]);

% Graphique 1 : MSE en fonction du SNR
subplot(2,1,1);
semilogy(SNR_values, MSE_values, 'b-o', 'LineWidth', 2, 'MarkerSize', 6);
xlabel('SNR d''entrée (dB)', 'FontSize', 12);
ylabel('MSE (échelle log)', 'FontSize', 12);
title('Erreur Quadratique Moyenne en fonction du SNR', 'FontSize', 13, 'FontWeight', 'bold');
grid on;
hold on;
if ~isempty(seuil_idx)
    xline(SNR_seuil, 'r--', 'LineWidth', 2);
    text(SNR_seuil+1, max(MSE_values)/2, sprintf('Seuil: %d dB', SNR_seuil), ...
         'FontSize', 11, 'Color', 'red', 'FontWeight', 'bold');
end
hold off;

% Graphique 2 : SNR de sortie en fonction du SNR d'entrée
subplot(2,1,2);
plot(SNR_values, SNR_out_values, 'r-s', 'LineWidth', 2, 'MarkerSize', 6);
hold on;
plot(SNR_values, SNR_values, 'k--', 'LineWidth', 1.5);  % Ligne de référence
hold off;
xlabel('SNR d''entrée (dB)', 'FontSize', 12);
ylabel('SNR de sortie (dB)', 'FontSize', 12);
title('SNR de Sortie en fonction du SNR d''Entrée', 'FontSize', 13, 'FontWeight', 'bold');
legend('SNR sortie', 'Référence (SNR in = SNR out)', 'Location', 'northwest', 'FontSize', 10);
grid on;
xlim([0 30]);

sgtitle('Analyse du Seuil de Démodulation FM', 'FontSize', 15, 'FontWeight', 'bold');

% Sauvegarder la figure
saveas(gcf, '../images/image9.png');
fprintf('\nImage 9 générée avec succès!\n');
