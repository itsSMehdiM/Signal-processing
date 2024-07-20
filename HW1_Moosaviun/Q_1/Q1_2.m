clc;
clear;
close all;

% Define the signal step
x= -1:.001:3;
x0=1; %we want a step in 1 so we gave x0=1
y=stepfun(x,x0);

% Plot signal step
figure;
subplot(2,1,1)
    plot(x,y,'b',LineWidth=1,LineStyle='--')
        ylabel("y")
        xlabel("x")
        title("unit step")
        grid on;
        axis tight
        legend('step');
subplot(2,1,2)
    stem(y,'b') % Plot signal stem
        ylabel("y")
        xlabel("x")
        title("Stem")
        legend('stem of step')
        grid on;
        axis tight
g="this figure illustrate a unit step with its stem";
disp(g);