clc;
clear;
close all;

% Define the signal chirp
chirp = dsp.Chirp('SweepDirection', 'Bidirectional','TargetFrequency', 25,'InitialFrequency', 0,'TargetTime', 1,'SweepTime', 1,'SamplesPerFrame', 400,'SampleRate', 400);

% Plot signal chirp
figure;
subplot(2,1,1)
    plot(chirp(),'m',LineWidth=1);
        ylabel("y")
        xlabel("x")
        title("chirp")
        grid on;
        axis tight
        legend('chirp');
subplot(2,1,2)
    stem(chirp(),'m') % Plot signal stem
        ylabel("y")
        xlabel("x")
        title("stem of chirp")
        grid on;
        axis tight
        legend('stem');