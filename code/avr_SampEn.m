function [ se ] = avr_SampEn(img, m, r, v, n)
    
  % ---------------------
  % This function calculates the average SampEn of the sub-images (Equation 9 in [1])
  %
  % Input:
  % img - image
  % m, r - SampEn parameters
  % v - number of sub-images
  % n - subimage size
  %
  % Output: 
  % se - a SampEn value
  %
  % [1] Rozendo, G. B., Nascimento, M. Z., Roberto G. F., Faria, P. R., Silva, A. B., Tosta, T. A. A., Neves, L. A. (2022). Classification of Non-Hodgkin Lymphomas Based on Sample Entropy Signatures. Expert Systems with Applications.
  % ---------------------

  img = int16(img); % convert uint8 to int16
  
  h = size(img, 1); % image height
  w = size(img, 2); % image width
  
  se = zeros(1, v);
  
  map = zeros(h, w); % this map keeps track of which sub-images were drawn
  
  % draw a position for the sub-image
  vx = randi(w-n+1, 1, v);
  vy = randi(h-n+1, 1, v);
  
  for i = 1 : v
    % check if the subimage has already been drawn
    while map(vy(1, i), vx(1, i)) == 1
      vy(1, i) = randi(h-n+1);
      vx(1, i) = randi(w-n+1);
    end
    
    img_temp = img(vy(1, i):vy(1, i)+n-1, vx(1, i):vx(1, i)+n-1); % sub-image
    
    se(1, i) = SampEn(img_temp, m, r);
    
    map(vx(1, i), vx(1, i)) = 1;
    
    i = i + 1;
    
  end
  
  se = mean(se);
    
end