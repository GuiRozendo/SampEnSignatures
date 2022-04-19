function [results] = metrics(features)
  
    % ---------------------
    % This function calculates the SampEn signatures metrics for a given image (Section 3.2.2 in [1])
    %
    % [1] Rozendo, G. B., Nascimento, M. Z., Roberto G. F., Faria, P. R., Silva, A. B., Tosta, T. A. A., Neves, L. A. (2022). Classification of Non-Hodgkin Lymphomas Based on Sample Entropy Signatures. Expert Systems with Applications.
    % ---------------------

    % Discart irrelevant observations
    infs = isinf(features);
    nans = isnan(features);

    indices = ones(1, size(features,2));

    for j = 1 : size(features,2)
        for i = 1 : size(features,1)
            if infs(i, j) == true || nans(i, j) == true
                indices(1, j) = 0;
            end
        end
    end

    indices = logical(indices);

    features = features(:, indices);
    features = features';

    % area under curve (A)
    results(:, 1) = trapz(features); % Equation 10 in [1]

    % area ratio (R)
    first = features;
    last = features;

    first = first( 1:floor(size(first,1)/2), :);
    last = last(((floor(size(last,1)/2)) + 1) : end, :);

    results(:, 2) = trapz(last) ./ trapz(first); % Equation 12 in [1]

    % skewness (S)
    results(:, 3) = skewness(features); % Equation 11 in [1]

    %p maximum point of entropy (Pmax)
    results(:, 4) = max(features);
   
end

