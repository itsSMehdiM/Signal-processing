clc;
clear all;
close all;


% Given parameters
m = [1 2];   % Mean vector
c = [4 -4; -4 9];   % Covariance matrix

% a. Find the correlation coefficient between X and Y
sigma_x = sqrt(c(1, 1));  % Standard deviation of X
sigma_y = sqrt(c(2, 2));  % Standard deviation of Y
cov_xy = c(1, 2);         % Covariance between X and Y
rho = cov_xy / (sigma_x * sigma_y);
fprintf('Correlation coefficient between X and Y: %.4f\n', rho);

% b. Find COV(Z, W), where W = X - 2Y and Z = 2X + Y
W = [1 -2];
Z = [2 1];
cov_ZW = W * c * Z';
fprintf('COV(Z, W): %.4f\n', cov_ZW);

% c. Plot the PDF of Z
x = linspace(-10, 10, 1000);
Z_mean = Z * m';           % Mean of Z (transposed m)
Z_cov = Z * c * Z';        % Covariance of Z
x_col = x(:);              % Convert x to a column vector
pdf_Z = mvnpdf(x_col, Z_mean, Z_cov);
figure;
plot(x, pdf_Z);
xlabel('Z');
ylabel('Probability Density');
title('Probability Density Function of Z');