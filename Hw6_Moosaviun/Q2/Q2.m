close all
clear all
clear



% Load the audio file
[audio, Fs] = audioread('Q2-Test.mp3');

% Define the filter properties for the entire frequency band
lower_cutoff = 100; % Lower cutoff frequency in Hz
upper_cutoff = Fs/2 - 1; % Upper cutoff frequency must be less than Fs/2

% Design a band-pass filter for the entire frequency band
d = designfilt('bandpassiir', 'FilterOrder', 8, ...
    'HalfPowerFrequency1', lower_cutoff, 'HalfPowerFrequency2', upper_cutoff,'SampleRate', Fs);

% Apply the filter to the audio signal
filtered_audio = filtfilt(d, audio);

% Save and plot the filtered audio signal
audiowrite('Q2_PartA_Filtered_Audio.wav', filtered_audio, Fs);

figure;
plot(filtered_audio, 'b', 'LineWidth', 1);
    title('Filtered Audio Signal (Entire Frequency Band)', 'FontSize', 10, 'FontWeight', 'Bold');
        xlabel('Sample Number', 'FontSize', 10, 'FontWeight', 'Bold');
        ylabel('Amplitude', 'FontSize', 10, 'FontWeight', 'Bold');
grid on;
set(gca, 'FontSize', 8, 'FontWeight', 'Bold');

% Save the plot
saveas(gcf, 'Q2_PartA_Filtered_Audio.png');

% Display success message
disp('Q2 Part A: Filtered audio saved as Q2_PartA_Filtered_Audio.wav');
disp('Q2 Part A: Plot saved as Q2_PartA_Filtered_Audio.png');
% Define the central frequency for part B
central_freq = Fs/4; % Example central frequency

% Define initial and minimum bandwidths
initial_bandwidth = Fs/4; % Initial bandwidth
min_bandwidth = 100; % Minimum bandwidth to stop filtering

% Number of steps to reduce the bandwidth
num_steps = 5;

% Calculate bandwidth reduction step size
step_size = (initial_bandwidth - min_bandwidth) / num_steps;

% Initialize a figure for plotting
figure;
colors = lines(num_steps); % Use a colormap for different colors

for i = 1:num_steps
    % Calculate the current bandwidth
    current_bandwidth = initial_bandwidth - (i-1) * step_size;
    
    % Calculate cutoff frequencies
    lower_cutoff = max(central_freq - current_bandwidth/2, 0);
    upper_cutoff = min(central_freq + current_bandwidth/2, Fs/2 - 1);
    
    % Ensure the cutoff frequencies are valid
    if lower_cutoff < upper_cutoff
        d = designfilt('bandpassiir', 'FilterOrder', 8, 'HalfPowerFrequency1', lower_cutoff, 'HalfPowerFrequency2', upper_cutoff,'SampleRate', Fs);

        % Apply the filter to the audio signal
        filtered_audio = filtfilt(d, audio);

        % Save the filtered audio for each step
        audiowrite(['Q2_PartB_Filtered_Audio_Step' num2str(i) '.wav'], filtered_audio, Fs);

        % Plot the filtered audio signal
        subplot(num_steps, 1, i);
        plot(filtered_audio, 'Color', colors(i,:), 'LineWidth', 1);
            title(['Filtered Audio Step ' num2str(i) ' (Bandwidth ' num2str(upper_cutoff - lower_cutoff) ' Hz)'],'FontSize', 10, 'FontWeight', 'Bold');
            xlabel('Sample Number', 'FontSize', 8, 'FontWeight', 'Bold');
            ylabel('Amplitude', 'FontSize', 8, 'FontWeight', 'Bold');
        grid on;
        set(gca, 'FontSize', 8, 'FontWeight', 'Bold');
    else
        disp(['Invalid cutoff frequencies for step ' num2str(i) '.']);
    end
end

% Save the plot
saveas(gcf, 'Q2_PartB_Filtered_Audio.png');

% Display success message
disp('Q2 Part B: Filtered audio for each step saved as Q2_PartB_Filtered_Audio_StepX.wav');
disp('Q2 Part B: Plot saved as Q2_PartB_Filtered_Audio.png');
