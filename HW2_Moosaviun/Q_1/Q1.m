clear;
clc;
close all;


x = linspace(0, 5.5, 3000);  % Create 3000 points on the interval [0, 5.5]
Const = -2/pi;               % Constant factor in the expression for B_n
Sn = 0;                      % Initialize vector sum series to zero

for n = 1 : 20                     % we can see the sum of terms with changing the N to 1,5,10,20 - right now in code N = 20 
    Const = -Const;                % Efficient way to implement alternating sign
    Bn = Const/n;                  % Coefficients inversely proportional to n
    Fn = Bn * sin(n*pi*x);         % Calculate Fourier term
    Sn = Sn + Fn;                  % Add the term to Fourier sum
    plot(x, Sn,LineWidth= n/8);    % Plot the fourier sum
    hold on;
end

xlabel('x'); 
ylabel('Sum(B_nsin(n\pix))');
title('Sum of terms in the sine series');
plot(x, mod(x+1,2)-1,  'k-', 'linewidth', 1.5) % Tricky part of the code: generate saw-tooth wave
grid on
axis tight

