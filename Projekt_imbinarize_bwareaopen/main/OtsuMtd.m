function [t,em] = OtsuMtd(calcs)

% Potwierdzenie, że tablica A należy do co najmniej jednej z podanych KLAS i zawiera wszystkie podane ATRYBUTY.
validateattributes(elems, {'numeric'}, {'real','nonsparse','vector','nonnegative','finite'}, mfilename, 'COUNTS');

calcs = double(calcs(:));
num_bins = numel(calcs);

p = calcs / sum(calcs);
omega = cumsum(p);
mu = cumsum(p .* (1:num_bins)');
mu_t = mu(end);

%Wzór do poszukiwania progu minimalizującego wariancję wewnątrzklasową, zdefiniowaną jako suma ważona wariancji dwóch klas:
sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega));

% Zlokalizuj maksymalną wartość sigma_b_squared.
% Dodaj wszystkie lokalizacje razem, ponieważ maksimum może obejmować wiele pikseli.
% Jeśli maxval jest NaN, sigma_b_squared będzie cała NaN, i bisekcja zwróci wartość 0.

drvt_sigm = diff(sigma_b_squared);

xtrem_max = BisectMtd(drvt_sigm);

isfinite_maxval = isfinite(xtrem_max);
if isfinite_maxval
    idx = mean(find(sigma_b_squared == xtrem_max));
    % Normalizacja progu do zakresu [0, 1].
    t = (idx - 1) / (num_bins - 1);
else
    t = 0.0;
end

% Obliczenie skuteczności działań
if nargout > 1
    if isfinite_maxval
        em = xtrem_max/(sum(p.*((1:num_bins).^2)') - mu_t^2);
    else
        em = 0;
    end
end

end
