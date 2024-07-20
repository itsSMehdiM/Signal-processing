clc;
clear;
close all;

% Define the signal triangule wave
ymax=5;
xmin=-15;
xmax= 15;
x0=0;
T=5;
step=0.01;
n=(xmax-xmin)/step;
y=1:n;
x=1:n;

for i=1:n
    x(i)=xmin+i*step;
    y(i)=ymax*abs(((mod(x(i),T))*2/T-1));
end

% Plot signal triangule wave
figure;
subplot(2,1,1)
    plot(x,y);
        ylabel("y")
        xlabel("x")
        title("Triangule")
        grid on;
        axis tight
        legend('triangule');
subplot(2,1,2)
    stem(x,y) % Plot signal stem
        ylabel("y")
        xlabel("x")
        title("stem of triangule wave")
        grid on;
        axis tight
        legend('stem');