clear
close all
clear all


% Define the signal parameters
Kf = 50; % Frequency modulation constant
Fc = 200; % Carrier frequency (Hz)
t = linspace(0, 0.45, 1000); % Time vector
% ------------------------------------------------
% Define the message signal
m_t = zeros(size(t));
m_t(t <= 0.15) = 1;
m_t((t > 0.15) & (t <= 0.3)) = -2;

% Perform frequency modulation
fm_t = Fc + Kf * cumsum(m_t) / (2 * pi * Fc);

% Define custom colors
messageSignalColor = [0.4660, 0.6740, 0.1880]; 
fmSignalColor = [0.8500, 0.3250, 0.0980]; 

% Plot the message signal and the frequency modulated signal
figure('Position', [100, 100, 800, 600], 'Color', 'w'); 

subplot(2, 1, 1);
    plot(t, m_t, 'LineWidth', 2, 'Color', messageSignalColor); 
        xlabel('Time (s)', 'FontSize', 14);
        ylabel('Amplitude', 'FontSize', 14);
            title('Message Signal', 'FontSize', 16, 'FontWeight', 'bold');
            set(gca, 'FontSize', 12, 'GridColor', messageSignalColor); 
grid on;

subplot(2, 1, 2);
    plot(t, fm_t, 'LineWidth', 2, 'Color', fmSignalColor); 
        xlabel('Time (s)', 'FontSize', 14);
        ylabel('Frequency (Hz)', 'FontSize', 14);
            title('Frequency Modulated Signal', 'FontSize', 16, 'FontWeight', 'bold');
            set(gca, 'FontSize', 12, 'GridColor', fmSignalColor); 
grid on;

% Adjust the spacing between subplots
subplotSpacingRatio = 0.05;
    set(gcf, 'PaperPositionMode', 'auto');
        set(gcf, 'DefaultAxesPosition', [0.1, 0.1, 0.8, 0.8 - subplotSpacingRatio]);

% Save the plot as a JPEG file with a custom filename
filename = sprintf('fm_modulation_%dHz_%dKf.jpg', Fc, Kf);
saveas(gcf, filename);
