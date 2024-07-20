clear;
clc;
close all;

%calculate the number of time sampels
start_time = 0;
end_time = 0.01;
delta_time = 1e-5;
number_time_samples = (end_time - start_time)/delta_time;

%create the ime vector for x_axsis
t = start_time:delta_time:end_time;

%the sampling rate is 100000 samples per second
sampling_rate = 1/delta_time;

%create the time domain function with a frequency of 200 Hz 
freq = 200;
period = 1/freq;
time_func = 0.5 * sin(2 * pi * 300 * t) + 2 * sin(2 * pi * 400 * t) + 3 * sin(2 * pi * 500 * t)+ sin(2 * pi * 600 * t) + 2 * sin(2 * pi * 700 * t)+ .5 * sin(2 * pi * 800 * t) +sin(2 * pi * 900 * t) + 3 * sin(2 * pi * 1000 * t);

%plot the signaal to see that
plot(t,time_func,'r',LineWidth=1)
title('time function with 1000 data points')
ylabel('volts')
xlabel('time-second')
grid on
pause(1)

%do an FFT on this time domain function
fft_result = fft(time_func);

%create the X_axis for frequencies starting at dc value 0 hz
dc_value = 0 ;

freq_spacing = sampling_rate/number_time_samples;

%maximum frequency for the fft
freq_max = (sampling_rate/2) - freq_spacing;

%create the X_axis points
freq_plot_xaxis = dc_value:freq_spacing:freq_max;

number_freq_sample = number_time_samples/2;

%the magnitude of the fft must be computed from the complex fft_result
magnitude = abs(fft_result);
%normalize magnitude
nor_magnitude = magnitude/number_freq_sample;
%plot the first 30 frequencies 
figure;
plot(freq_plot_xaxis(1:30), nor_magnitude(1:30), 'ro')
title('FFT')
ylabel('volts')
xlabel('time-second')
grid on
pause(1)