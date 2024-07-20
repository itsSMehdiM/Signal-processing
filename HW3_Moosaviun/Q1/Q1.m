clc;
clear all;
close all;

% Define the mean vector and covariance matrix
mean_vector = [0, 0];
covariance_matrix = [1, 0.5; 0.5, 1];

% Generate a range of values for x and y
x = linspace(-4, 4, 50);
y = linspace(-4, 4, 50);
[X, Y] = meshgrid(x, y);

% Calculate the probability density function (PDF)
Z = mvnpdf([X(:) Y(:)], mean_vector, covariance_matrix);
Z = reshape(Z, size(X));

% Plot the PDF as a 3D mesh
figure;
mesh(X, Y, Z);
xlabel('X');
ylabel('Y');
zlabel('Probability Density');
title('Bivariate Gaussian Distribution');
view(45, 30); % Adjust the viewing angle