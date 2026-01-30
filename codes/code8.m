%% Code 8 - Démodulation de signaux FM bruités
% Ce code génère des signaux FM bruités et les démodule

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

% Ajout de bruit AWGN avec différents SNR
SNR_values = [30, 20, 10, 5];  % SNR en dB

figure('Position', [100, 100, 1100, 800]);
for i = 1:length(SNR_values)
    SNR_dB = SNR_values(i);
    s_FM_noisy = awgn(s_FM, SNR_dB, 'measured');
    
    % Démodulation du signal bruité
    x2_noisy = fmdemod(s_FM_noisy, fc, fs, delta_f);
    
    % Calcul de l'erreur et du SNR de sortie
    erreur = x - x2_noisy;
    MSE = mean(erreur.^2);
    SNR_out = 10*log10(mean(x.^2)/MSE);
    
    subplot(2, 2, i);
    plot(t, x, 'b', 'LineWidth', 2);
    hold on;
    plot(t, x2_noisy, 'r--', 'LineWidth', 1.5);
    hold off;
    xlabel('Temps (s)', 'FontSize', 10);
    ylabel('Amplitude (V)', 'FontSize', 10);
    title(sprintf('SNR entrée = %d dB, SNR sortie = %.1f dB', SNR_dB, SNR_out), ...
          'FontSize', 11, 'FontWeight', 'bold');
    legend('Signal original', 'Signal démodulé', 'Location', 'northeast', 'FontSize', 8);
    grid on;
    xlim([0 0.5]);
    ylim([-1.5 1.5]);
    
    % Ajouter une indication visuelle de la qualité
    if SNR_dB >= 20
        text(0.02, 1.2, 'Bonne qualité', 'FontSize', 9, ...
             'BackgroundColor', 'green', 'Color', 'white', 'FontWeight', 'bold');
    elseif SNR_dB >= 10
        text(0.02, 1.2, 'Qualité moyenne', 'FontSize', 9, ...
             'BackgroundColor', 'yellow', 'FontWeight', 'bold');
    else
        text(0.02, 1.2, 'Mauvaise qualité', 'FontSize', 9, ...
             'BackgroundColor', 'red', 'Color', 'white', 'FontWeight', 'bold');
    end
    
    fprintf('SNR entrée = %d dB => MSE = %.4e, SNR sortie = %.2f dB\n', ...
            SNR_dB, MSE, SNR_out);
end

sgtitle('Démodulation FM en Présence de Bruit AWGN', ...
        'FontSize', 15, 'FontWeight', 'bold');

% Sauvegarder la figure
saveas(gcf, '../images/image8.png');
fprintf('Image 8 générée avec succès!\n');
