function [ se ] = SampEn(img, m, r)
    
  % ---------------------
  % This function calculates the SampEn for a given grayscale image (Section 3.2 in [1]).
  % This code was provided by [2].
  %
  % Input:
  % img - grayscale image
  % m - pattern size
  % r - tolerance
  %
  % Output: 
  % se - a SampEn value
  %
  % [1] Rozendo, G. B., Nascimento, M. Z., Roberto G. F., Faria, P. R., Silva, A. B., Tosta, T. A. A., Neves, L. A. (2022). Classification of Non-Hodgkin Lymphomas Based on Sample Entropy Signatures. Expert Systems with Applications.
  % [2] Silva, L. E. V., Senra Filho, A. C. S., Fazan, V. P. S., Felipe, J. C., & Junior, L. M. (2016). Two-dimensional sample entropy: Assessing image texture through irregularity. Biomedical Physics & Engineering Express, 2(4), 045002.
  % ---------------------
  
  h = size(img, 1); % image height
  w = size(img, 2); % image width
  
  r = r * std2(img); % Equation 5 in [1]
  D = (w - m) * (h - m); % total of patterns
  
  Phim = 0; % Similarity coefficient for m-size patterns (Equation 8 in [1])
  Phim1 = 0; % Similarity coefficient for m+1-size patterns (Equation 7 in [1])
  
  % img(yi, xi) is the top left pixel of the fixed window
  for yi = 1 : h - m
    for xi = 1 : w - m
      Cm = 0; % Cm is the average count of similar m-size patterns (Equation 3 in [1])
      Cm1 = 0; % Cm1 is the average count of similar m+1-size patterns
      
      % img(yj, xj) is the top left pixel of the sliding window
      yj = yi;
      xj = xi + 1;
      while xj <= w - m
        % check if m-size partterns are similar
        if similar_m(img, m, r, yi, xi, yj, xj) == 1
          Cm = Cm + 1;
          
          % check if m+1-size partterns are similar
          if similar_m1(img, m, r, yi, xi, yj, xj) == 1
            Cm1 = Cm1 + 1;
          end
        end
        xj = xj + 1;
      end
      
      for yj = yi + 1 : h - m
        for xj = 1 : w - m
          % check if m-size partterns are similar
          if similar_m(img, m, r, yi, xi, yj, xj) == 1
            Cm = Cm + 1;
            
            % check if m+1-size partterns are similar
            if similar_m1(img, m, r, yi, xi, yj, xj) == 1
              Cm1 = Cm1 + 1;
            end
          end
          
        end
      end
      
      Phim = Phim + Cm/(D - 1);
      Phim1 = Phim1 + Cm1/(D - 1);
      
    end
  end
  
  Phim = Phim / D;
  Phim1 = Phim1 / D;
  
  se = - log(Phim1 / Phim); % Equation 6 in [1]

end