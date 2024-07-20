clc
clear all
close all

% Load user-provided audio file
[inputAudio, Fs] = audioread('Q3-Test.mp3');
inputDuration = length(inputAudio) / Fs;

% Generate noise with the same duration as the input audio
noise = 0.5 * randn(size(inputAudio)); 

% Add noise to the input audio
noisyAudio = inputAudio + noise;

% Plot original and noisy audio
t = linspace(0, inputDuration, length(inputAudio));
figure;
    plot(t, inputAudio, 'b', t, noisyAudio, 'r');
        xlabel('Time (s)');
        ylabel('Amplitude');
        legend('Original Audio', 'Noisy Audio');
        title('Original vs Noisy Audio');

% Save the plot as a JPEG file
saveas(gcf, 'Original_vs_Noisy_Q3.jpg');

% Save the noisy audio as a new audio file
audiowrite('noisy_Q3.wav', noisyAudio, Fs);

% Reverse the input audio
reversedAudio = flip(inputAudio);

% Plot the reversed audio
t_reversed = linspace(0, inputDuration, length(reversedAudio));
figure;
    plot(t_reversed, reversedAudio, 'g');
        xlabel('Time (s)');
        ylabel('Amplitude');
        title('Reversed Audio');

% Save the plot as a JPEG file
saveas(gcf, 'Reversed_Q3.jpg');

% Save the reversed audio as a new audio file
audiowrite('reversed_Q3.wav', reversedAudio, Fs); 

% Wait for user to press Enter to play noisy audio
disp('Press Enter to play noisy audio...');
pause;

% Play the noisy audio
sound(noisyAudio, Fs);

% Wait for the noisy audio to finish playing
pause(inputDuration);

% Wait for user to press Enter to play reversed audio
disp('Press Enter to play reversed audio...');
pause;

% Play the reversed audio
sound(reversedAudio, Fs);

