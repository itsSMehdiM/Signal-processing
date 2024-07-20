clc;
clear;
close all;

% Define the digital signal 'a'
a = [0 0 1 1 0];

% Plot signal 'a'
figure;
subplot(4,1,1);
    stem(a,'filled','r',LineWidth=2); %beacouse of our signal is digital we must stem the signal to see it not using plot!
        title('Digital Signal a');
        xlabel('Sample');
        ylabel('y');
        grid on;
        axis tight
        legend('a');
% Calculate correlation of signal 'a'
corr_a = xcorr2(a,a);

% Plot correlation of signal 'a'
subplot(4,1,2);
    stem(corr_a, 'filled','y',LineWidth=2);
        title('correlation of Signal a');
        xlabel('x');
        ylabel('correlation');
        grid on;
        axis tight
        legend('corr a');
% Define another digital signal 'b' (example)
b = [1 0 1 0 1];

% Plot signal 'b'
subplot(4,1,3);
    stem(b, 'filled','g',LineWidth=2);
        title('Digital Signal b');
        xlabel('Sample');
        ylabel('y');
        grid on;
        axis tight
        legend('b');
% Calculate correlation between 'a' and 'b'
correlation_ab = xcorr2(a, b);

% Plot correlation between 'a' and 'b'
subplot(4,1,4)
    stem(correlation_ab, 'filled','k',LineWidth=2);
        title('correlation between a and b');
        xlabel('x');
        ylabel('correlation');
        grid on;
        axis tight
        legend('corr a-b');
