function [t,em] = Otsu_mtd(counts)

AttributesConfirm(counts, {'numeric'}, {'real','nonsparse','vector','nonnegative','finite'}, mfilename, 'COUNTS');

num_bins = numel(counts);

counts = double( counts(:) );

p = counts / sum(counts);
omega = cumsum(p);
mu = cumsum(p .* (1:num_bins)');
mu_t = mu(end);

sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega));

% Find the location of the maximum value of sigma_b_squared.
% The maximum may extend over several bins, so average together the
% locations.  If maxval is NaN, meaning that sigma_b_squared is all NaN,
% then return 0.
% drvt_sigm = diff(sigma_b_squared);

drvt_sigm = diff(sigma_b_squared);
xtrem_max = bisect(drvt_sigm);
isfinite_maxval = isfinite(xtrem_max);
if isfinite_maxval
    idx = mean(find(sigma_b_squared == xtrem_max));
    % Normalize the threshold to the range [0, 1].
    t = (idx - 1) / (num_bins - 1);
else
    t = 0.0;
end

% compute the effectiveness metric
if nargout > 1
    if isfinite_maxval
        em = xtrem_max/(sum(p.*((1:num_bins).^2)') - mu_t^2);
    else
        em = 0;
    end
end

end
