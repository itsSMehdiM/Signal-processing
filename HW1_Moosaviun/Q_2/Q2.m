clc;
clear;
close all;

fs=100;
t0= -0.1;
tf= pi+0.1;
ts= 1/fs;
t= t0:ts:tf;

h= square(t)+1;
x = conv(h,h,'same')*ts;
y = conv(x,x,'same')*ts;
z = conv(y,y,'same')*ts;

figure;
subplot(4,1,1)
    plot(t,h,'r',LineWidth=2)
        xlim([-2 5])
        ylim([0 3])
        title('Square Pulse');
        xlabel('x');
        ylabel('y');
        grid on;
        legend('square pulse');
subplot(4,1,2)
    plot(t,x,'g',LineWidth=2)
        title('Convolution: tow Pulses');
        xlabel('x');
        ylabel('y');
        grid on;
        axis tight
        legend('tow pulse');
subplot(4,1,3)
    plot(t,y,'y',LineWidth=2)
        xlabel('x');
        ylabel('y');
        title('Convolution: Four Pulses');
        grid on;
        axis tight
        legend('four pulse');
subplot(4,1,4)
    plot(t,z,'k',LineWidth=2)
        xlabel('x');
        ylabel('y');
        title('Convolution: eight Pulses');
        grid on;
        axis tight
        legend('eight pulse');
