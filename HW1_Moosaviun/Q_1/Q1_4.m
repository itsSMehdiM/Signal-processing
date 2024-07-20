clc;
clear;
close all;

% Define the signal square wave
[u,t]= gensig("square",5,30);  %is a function for plot waves

% Plot signal square wave
figure;
subplot(2,1,1)
    plot(t,u,'k',LineWidth=1,LineStyle='-.')
        axis([0 30 -0.5 1.5])
        ylabel("y")
        xlabel("x")
        title("square wave")
        legend('square wave');
        grid on;
subplot(2,1,2)
    stem(t,u,'k') % Plot signal stem
        axis([0 30 -0.5 1.5])
        ylabel("y")
        xlabel("x")
        title("stem of square wave")
        legend('stem');
        grid on;