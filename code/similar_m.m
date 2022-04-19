function [flag] = similar_m (img, m, r, y1, x1, y2, x2)
    
    % ---------------------
    % Check if two m-size patterns are similar
    % This code was provided by [1].
    %
    % The first pattern start at (y1, x1), the second start at (y2,x2)
    % flag = 0 means 'false'
    % flag = 1 means 'true'
    %
    % [1] Silva, L. E. V., Senra Filho, A. C. S., Fazan, V. P. S., Felipe, J. C., & Junior, L. M. (2016). Two-dimensional sample entropy: Assessing image texture through irregularity. Biomedical Physics & Engineering Express, 2(4), 045002.
    %---------------------

    flag = 1;

    for i = 0 : m - 1
        for j = 0 : m - 1
            d = abs(img(y1 + i, x1 + j) - img(y2 + i, x2 + j));
            if d >= r
                flag = 0;
                return;
            end
        end
    end
end