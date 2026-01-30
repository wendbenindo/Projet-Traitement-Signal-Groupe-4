%% Code 4 - Analyse spectrale du signal FM
% Ce code calcule et affiche les spectres pour différentes déviations

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

% Test avec différentes déviations
deviations = [1, 10, 50, 100];

figure('Position', [100, 100, 1100, 750]);
for i = 1:length(deviations)
    delta_f = deviations(i);
    s_FM = fmmod(x, fc, fs, delta_f);
    beta = delta_f / fx;
    
    % Calcul de la FFT
    N = length(s_FM);
    S_FM_f = fft(s_FM);
    S_FM_f = fftshift(S_FM_f);
    f = (-N/2:N/2-1)*(fs/N);
    
    % Spectre d'amplitude normalisé
    amplitude_spectrum = abs(S_FM_f)/N;
    
    % Calcul de la bande de Carson
    BW_Carson = 2*(delta_f + fx);
    
    subplot(2, 2, i);
    plot(f, amplitude_spectrum, 'b', 'LineWidth', 1);
    xlabel('Fréquence (Hz)', 'FontSize', 10);
    ylabel('Amplitude', 'FontSize', 10);
    title(sprintf('\\Deltaf=%d Hz, \\beta=%.2f, BW=%.0f Hz', ...
                  delta_f, beta, BW_Carson), 'FontSize', 11, 'FontWeight', 'bold');
    xlim([fc-150 fc+150]);
    ylim([0 max(amplitude_spectrum)*1.1]);
    grid on;
    
    % Marquer la bande de Carson
    hold on;
    xline(fc-BW_Carson/2, 'r--', 'LineWidth', 1.5);
    xline(fc+BW_Carson/2, 'r--', 'LineWidth', 1.5);
    
    % Ajouter légende pour la première figure
    if i == 1
        legend('Spectre FM', 'Bande de Carson', 'Location', 'northeast');
    end
    hold off;
end

sgtitle('Spectres d''Amplitude des Signaux FM', 'FontSize', 15, 'FontWeight', 'bold');

% Sauvegarder la figure
saveas(gcf, '../images/image4.png');
fprintf('Image 4 générée avec succès!\n');
