clc
clear all
close all

% Generate random samples from Rayleigh distribution
sampleSize = 1000;

% Scale parameter = 1
rayleighSamples = raylrnd(1, sampleSize); 

% Define the range for the histogram
histRange = 0:0.05:5;

% Calculate the PDF of Rayleigh distribution
pdfRayleigh = histRange / 1^2 .* exp(-0.5 * (histRange / 1).^2);

% Plot histogram of the random samples
histogram(rayleighSamples, 'Normalization', 'pdf', 'BinEdges', histRange);
hold on;

% Overlay the PDF of Rayleigh distribution
plot(histRange, pdfRayleigh, 'r', 'LineWidth', 2);


legend('Histogram', 'Rayleigh PDF');
xlabel('x');
ylabel('Probability Density');
title('Histogram and PDF of Rayleigh Distribution');

% Save the plot as a JPEG file
saveas(gcf, 'Rayleigh_Distribution_Plot.jpg');

% Hold off to end plotting
hold off;
