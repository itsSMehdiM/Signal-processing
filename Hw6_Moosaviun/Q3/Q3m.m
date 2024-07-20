close all
clear all
clear


% Load the original audio file
[audio, Fs] = audioread('Q3-Test.mp3');

% Define the new sampling rate for high quality (44.1 kHz)
new_Fs_high_quality = 44100;

% Resample the audio
audio_high_quality = resample(audio, new_Fs_high_quality, Fs);

% Save the resampled audio
audiowrite('Q3_PartA_Resampled_Audio_High_Quality.wav', audio_high_quality, new_Fs_high_quality);

% Plot the original and resampled audio signals
figure;

subplot(2,1,1);
    plot(audio);
        title('Original Audio Signal');
        xlabel('Sample Number');
        ylabel('Amplitude');
grid on;

subplot(2,1,2);
    plot(audio_high_quality);
        title('Resampled Audio Signal (High Quality)');
        xlabel('Sample Number');
        ylabel('Amplitude');
grid on;

% Save the plot
saveas(gcf, 'Q3_PartA_Resampled_Audio_High_Quality.png');

% Display success message
disp('Q3 Part A: Resampled audio saved as Q3_PartA_Resampled_Audio_High_Quality.wav');
disp('Q3 Part A: Plot saved as Q3_PartA_Resampled_Audio_High_Quality.png');
% Define new sampling rates for 1 kbps and 4 kbps
% Assuming 16-bit mono audio, we approximate the required sampling rates
bit_depth = 16; % bits per sample
channels = 1; % mono audio
bps_1kbps = 1000; 
bps_4kbps = 4000; 

% Calculate corresponding sampling rates
new_Fs_1kbps = floor(bps_1kbps / (bit_depth * channels));
new_Fs_4kbps = floor(bps_4kbps / (bit_depth * channels)); 

% Ensure sampling rates are at least 1 to avoid zero rate
new_Fs_1kbps = max(new_Fs_1kbps, 1);
new_Fs_4kbps = max(new_Fs_4kbps, 1);

% Resample the audio at 1 kbps
audio_1kbps = resample(audio, new_Fs_1kbps, Fs);
audiowrite('Q3_PartB_Resampled_Audio_1kbps.wav', audio_1kbps, new_Fs_1kbps);

% Resample the audio at 4 kbps
audio_4kbps = resample(audio, new_Fs_4kbps, Fs);
audiowrite('Q3_PartB_Resampled_Audio_4kbps.wav', audio_4kbps, new_Fs_4kbps);

% Plot the resampled audio signals for 1 kbps and 4 kbps
figure;

subplot(2,1,1);
    plot(audio_1kbps, 'r', 'LineWidth', 1.5);
        title('Resampled Audio Signal (1 kbps)', 'FontSize', 14, 'FontWeight', 'Bold');
        xlabel('Sample Number', 'FontSize', 10, 'FontWeight', 'Bold');
        ylabel('Amplitude', 'FontSize', 10, 'FontWeight', 'Bold');
grid on;
set(gca, 'FontSize', 10, 'FontWeight', 'Bold');

subplot(2,1,2);
    plot(audio_4kbps, 'g', 'LineWidth', 1.5);
        title('Resampled Audio Signal (4 kbps)', 'FontSize', 14, 'FontWeight', 'Bold');
        xlabel('Sample Number', 'FontSize', 10, 'FontWeight', 'Bold');
        ylabel('Amplitude', 'FontSize', 10, 'FontWeight', 'Bold');
grid on;
set(gca, 'FontSize', 12, 'FontWeight', 'Bold');

% Save the plot
saveas(gcf, 'Q3_PartB_Resampled_Audio.png');

% Display success message
disp('Q3 Part B: Resampled audio for 1 kbps saved as Q3_PartB_Resampled_Audio_1kbps.wav');
disp('Q3 Part B: Resampled audio for 4 kbps saved as Q3_PartB_Resampled_Audio_4kbps.wav');
disp('Q3 Part B: Plot saved as Q3_PartB_Resampled_Audio.png');
