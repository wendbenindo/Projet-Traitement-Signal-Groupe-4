%% Code 3 - Effet de la variation de la déviation en fréquence
% Ce code montre l'impact de différentes déviations sur le signal FM

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

% Test avec différentes valeurs de déviation
deviations = [1, 10, 50, 100];

figure('Position', [100, 100, 1000, 700]);
for i = 1:length(deviations)
    delta_f = deviations(i);
    s_FM = fmmod(x, fc, fs, delta_f);
    beta = delta_f / fx;
    
    subplot(2, 2, i);
    plot(t(1:500), s_FM(1:500), 'LineWidth', 1.5);
    xlabel('Temps (s)', 'FontSize', 10);
    ylabel('Amplitude', 'FontSize', 10);
    title(sprintf('\\Deltaf = %d Hz, \\beta = %.2f', delta_f, beta), ...
          'FontSize', 12, 'FontWeight', 'bold');
    grid on;
    
    % Ajouter le type de modulation
    if beta < 0.5
        text(0.002, 0.8, 'NFM', 'FontSize', 11, 'FontWeight', 'bold', ...
             'BackgroundColor', 'yellow');
    else
        text(0.002, 0.8, 'WFM', 'FontSize', 11, 'FontWeight', 'bold', ...
             'BackgroundColor', 'cyan');
    end
end

sgtitle('Effet de la Variation de la Déviation en Fréquence', ...
        'FontSize', 15, 'FontWeight', 'bold');

% Sauvegarder la figure
saveas(gcf, '../images/image3.png');
fprintf('Image 3 générée avec succès!\n');
