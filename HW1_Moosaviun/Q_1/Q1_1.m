clc;
clear;
close all;

% Define the signal 'exp'
x= -3:.001:10;
y=exp(x);

% Plot signal exp
figure;
subplot(2,1,1)
    plot(x,y,'r',LineWidth=2)
        ylabel("y")
        xlabel("x")
        title("exp(x)")
        grid on;
        axis tight
        legend('exp');
subplot(2,1,2)
    stem(y,'r') % Plot signal stem
        ylabel("y")
        xlabel("x")
        title("Stem")
        legend('stem of exp')
        grid on;
        axis tight