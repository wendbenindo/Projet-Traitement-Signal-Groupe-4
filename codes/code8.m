%% Code 8 - Signaux FM bruités
% Ce code génère des signaux FM avec différents niveaux de bruit

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

figure('Position', [100, 100, 1000, 700]);
for i = 1:length(SNR_values)
    SNR_dB = SNR_values(i);
    s_FM_noisy = awgn(s_FM, SNR_dB, 'measured');
    
    subplot(2, 2, i);
    plot(t(1:1000), s_FM_noisy(1:1000), 'LineWidth', 1);
    xlabel('Temps (s)', 'FontSize', 10);
    ylabel('Amplitude', 'FontSize', 10);
    title(sprintf('Signal FM Bruité - SNR = %d dB', SNR_dB), ...
          'FontSize', 12, 'FontWeight', 'bold');
    grid on;
    
    % Ajouter une indication visuelle de la qualité
    if SNR_dB >= 20
        text(0.001, 0.8, 'Bonne qualité', 'FontSize', 9, ...
             'BackgroundColor', 'green', 'Color', 'white');
    elseif SNR_dB >= 10
        text(0.001, 0.8, 'Qualité moyenne', 'FontSize', 9, ...
             'BackgroundColor', 'yellow');
    else
        text(0.001, 0.8, 'Mauvaise qualité', 'FontSize', 9, ...
             'BackgroundColor', 'red', 'Color', 'white');
    end
end

sgtitle('Signaux FM Bruités pour Différents Niveaux de SNR', ...
        'FontSize', 15, 'FontWeight', 'bold');

% Sauvegarder la figure
saveas(gcf, '../images/image8.png');
fprintf('Image 8 générée avec succès!\n');
