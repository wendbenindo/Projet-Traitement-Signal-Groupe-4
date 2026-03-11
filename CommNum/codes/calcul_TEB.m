% Q16 - Calcul du Taux d'Erreur Binaire (TEB)
% Fonction qui calcule le TEB entre le message original et le message estimé

function [TEB, nb_erreurs] = calcul_TEB(dn, dn_hat)
    % Entrées:
    %   dn: message binaire original
    %   dn_hat: message binaire estimé
    %
    % Sorties:
    %   TEB: taux d'erreur binaire
    %   nb_erreurs: nombre de bits mal transmis
    
    % S'assurer que les deux vecteurs ont la même longueur
    N = min(length(dn), length(dn_hat));
    dn = dn(1:N);
    dn_hat = dn_hat(1:N);
    
    % Compter le nombre de bits différents
    nb_erreurs = sum(dn ~= dn_hat);
    
    % Calculer le TEB
    TEB = nb_erreurs / N;
    
    fprintf('=== Taux d''Erreur Binaire ===\n');
    fprintf('Nombre total de bits: %d\n', N);
    fprintf('Nombre d''erreurs: %d\n', nb_erreurs);
    fprintf('TEB = %.6f (%.4f%%)\n', TEB, TEB*100);
end
