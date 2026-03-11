% Q20 - Canal pour signal modulé
% Identique à Q11 mais pour signal modulé

function [r, t_r] = canal_mod(e, t_e, E_bit, EbitN0_dB)
    % Entrées:
    %   e: signal modulé émis
    %   t_e: vecteur temps
    %   E_bit: énergie moyenne par bit
    %   EbitN0_dB: rapport signal/bruit en dB
    %
    % Sorties:
    %   r: signal bruité r(t) = e(t) + b(t)
    %   t_r: vecteur temps
    
    % Utiliser la même fonction que Q11
    [r, t_r] = canal(e, t_e, E_bit, EbitN0_dB);
    
    fprintf('=== Canal modulé ===\n');
    fprintf('Signal modulé bruité généré\n');
end
