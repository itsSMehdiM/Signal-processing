clc;
clear all;
close all;


% Define the values of sigma
sigma = [5, 4, 3, 2, 1];

% Create a range of x values for plotting
x = linspace(0, 10, 1000);

% Calculate and plot the PDF for each value of sigma
figure;
hold on;
for i = 1:length(sigma)
    pdf_rayleigh = (x / sigma(i)^2) .* exp(-(x.^2) / (2 * sigma(i)^2));
    plot(x, pdf_rayleigh, 'DisplayName', sprintf('\\sigma = %d', sigma(i)));
end
hold off;
xlabel('x');
ylabel('Probability Density');
title('Rayleigh Distribution PDF');
legend('Location', 'NorthWest');

% Calculate the quantile values for each value of sigma
quantiles = linspace(0.01, 0.99, 99);
quantile_values = zeros(length(sigma), length(quantiles));
for i = 1:length(sigma)
    quantile_values(i, :) = sigma(i) * sqrt(-2 * log(1 - quantiles));
end

% Plot the quantile values
figure;
hold on;
for i = 1:length(sigma)
    plot(quantiles, quantile_values(i, :), 'DisplayName', sprintf('\\sigma = %d', sigma(i)));
end
hold off;
xlabel('Quantile');
ylabel('Quantile Value');
title('Rayleigh Distribution Quantiles');
legend('Location', 'NorthWest');