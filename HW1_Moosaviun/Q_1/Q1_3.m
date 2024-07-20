clc;
clear;
close all;

% Define the signal cos
x= -1:.001:1;
f=1; % considered f=1
y=cos(2*pi*f*x);

% Plot signal cos
figure;
subplot(2,1,1)
     plot(x,y,'g',LineWidth=2)
        ylabel("y")
        xlabel("x")
        title("cos(x)")
        grid on;
        axis tight
        legend('cos');
subplot(2,1,2)
    stem(y,'g') % Plot signal stem
        ylabel("y")
        xlabel("x")
        title("Stem")
        legend('stem of cos')
        grid on;
        axis tight
g="this figure illustrate a cos with its stem";
disp(g);