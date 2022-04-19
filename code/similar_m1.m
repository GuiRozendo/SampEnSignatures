function [flag] = similar_m1 (img, m, r, y1, x1, y2, x2)
    
    % ---------------------
    % Check if two m+1-size patterns are similar
    % This code was provided by [1].
    %
    % The first pattern start at (y1, x1), the second start at (y2,x2)
    % flag = 0 means 'false'
    % flag = 1 means 'true'
    %
    % [1] Silva, L. E. V., Senra Filho, A. C. S., Fazan, V. P. S., Felipe, J. C., & Junior, L. M. (2016). Two-dimensional sample entropy: Assessing image texture through irregularity. Biomedical Physics & Engineering Express, 2(4), 045002.
    % ---------------------
    
    flag = 1;
    
    for i = 0 : m
        d = abs(img(y1 + m, x1 + i) - img(y2 + m, x2 + i));
        if d >= r
            flag = 0;
            return;
        end
    end

    for j = 0 : m - 1
        d = abs(img(y1 + j, x1 + m) - img(y2 + j, x2 + m));
        if d >= r
            flag = 0;
            return;
        end
    end
end