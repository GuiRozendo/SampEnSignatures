% ---------------------
% This script calculates the SampEn signatures and metrics for a given image
%
% [1] Rozendo, G. B., Nascimento, M. Z., Roberto G. F., Faria, P. R., Silva, A. B., Tosta, T. A. A., Neves, L. A. (2022). Classification of Non-Hodgkin Lymphomas Based on Sample Entropy Signatures. Expert Systems with Applications.
% ---------------------

% Input image
img = imread('../data/example.png');

% SampEn signatures (Section 3.2.1 in [1])
sig = signatures(img);
aux = zeros(4, 18);

aux(1, :) = sig(1, 1:18); % signature for m = 1 
aux(2, :) = sig(1, 19:36); % signature for m = 2
aux(3, :) = sig(1, 37:54); % signature for m = 3
aux(4, :) = sig(1, 55:72); % signature for m = 4

% SampEn metrics (Section 3.2.2 in [1])
met = zeros(4, 4);

met(1, :) = metrics(aux(1, :)); % metrics for m = 1
met(2, :) = metrics(aux(2, :)); % metrics for m = 2
met(3, :) = metrics(aux(3, :)); % metrics for m = 3
met(4, :) = metrics(aux(4, :)); % metrics for m = 4


% Saving the results ----------------

% Plot signatures
% For m = 1
plot(0.06:0.02:0.4, aux(1, :), 'b-s')
xlabel('r', 'FontSize', 12, 'FontWeight','bold')
ylabel('SampEn', 'FontSize', 12, 'FontWeight','bold')

saveas(gcf, '../results/sig_m1.png');

% For m = 2
plot(0.06:0.02:0.4, aux(2, :), 'b-s')
xlabel('r', 'FontSize', 12, 'FontWeight','bold')
ylabel('SampEn', 'FontSize', 12, 'FontWeight','bold')

saveas(gcf, '../results/sig_m2.png');

% For m = 3
plot(0.06:0.02:0.4, aux(3, :), 'b-s')
xlabel('r', 'FontSize', 12, 'FontWeight','bold')
ylabel('SampEn', 'FontSize', 12, 'FontWeight','bold')

saveas(gcf, '../results/sig_m3.png');

% For m = 4
plot(0.06:0.02:0.4, aux(4, :), 'b-s')
xlabel('r', 'FontSize', 12, 'FontWeight','bold')
ylabel('SampEn', 'FontSize', 12, 'FontWeight','bold')

saveas(gcf, '../results/sig_m4.png');
  
% Print metrics
fprintf("\nSampEn signatures metrics:\n");
display(met)


