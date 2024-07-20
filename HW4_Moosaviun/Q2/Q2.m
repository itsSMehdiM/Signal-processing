clc
clear all
close all

% Define the time vector
t = -10:0.01:10;

% Define the input signal x(t)
x_t = sinc(t);

% Define the impulse response h(t) of the LTI system
h_t = rectpuls(t/4); % Rectangular pulse with width t/4

% Convolve x(t) with h(t) to get the output signal y(t) in time domain
y_t = conv(x_t, h_t, 'same') * 0.01; % Convolution with normalization

% Compute the Fourier transform of x(t) and h(t)
X_f = fftshift(fft(x_t));
H_f = fftshift(fft(h_t));

% Calculate the output signal Y(f) in frequency domain
Y_f = X_f .* H_f;

% Calculate the inverse Fourier transform of Y(f) to get y(t) in time domain
y_ta = ifft(ifftshift(Y_f), 'symmetric');


figure;
    subplot(2,2,1);
        plot(t, x_t, 'r');
            xlabel('Time (t)');
            ylabel('x(t)');
            title('Input Signal x(t)');
    subplot(2,2,2);
        plot(t, h_t, 'b');
            xlabel('Time (t)');
            ylabel('h(t)');
            title('Impulse Response h(t)');
    subplot(2,2,3);
        plot(t, y_t, 'g');
            xlabel('Time (t)');
            ylabel('y(t)');
            title('Output Signal y(t) (Time Domain)');

    subplot(2,2,4);
        plot(t, y_ta);
            xlabel('Time (t)');
            ylabel('y(t)');
            title('Output Signal y(t) (Inverse Fourier Transform)');

% Save the plot as a JPEG file
saveas(gcf, 'Time_Domain_Plots.jpg');

% Plot the signals in frequency domain
figure;
    subplot(2,1,1);
        plot(t, abs(Y_f), 'r');
            xlabel('Frequency (f)');
            ylabel('|Y(f)|');
            title('Output Signal Y(f) (Frequency Domain)');

    subplot(2,1,2);
           plot(t, angle(Y_f));
            xlabel('Frequency (f)');
            ylabel('Phase(Y(f))');
            title('Phase of Output Signal Y(f)');

saveas(gcf, 'Frequency_Domain_Plots.jpg');
