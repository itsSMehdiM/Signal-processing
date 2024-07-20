clear
close all
clear all

t = -1:0.00001:1;
x = zeros(size(t));

for i = 1:length(t)
    if rem(t(i), 0.04) < 0.02
        x(i) = t(i)/0.02;
    else
        x(i) = -(t(i)-0.04)/0.02;
    end
end

figure('Name','Triangle Signal','NumberTitle','off');
    plot(t,x,'LineWidth',2);
        xlabel('Time (s)'); ylabel('Amplitude');
        title('Triangle Signal');
        grid on;
saveas(gcf,'Triangle_Signal.png');
% A --------------------------------------------------------------------
fs = 1000;
ts = 1/fs;
n = -1:ts:1;
x_sampled = zeros(size(n));

for i = 1:length(n)
    if rem(n(i), 0.04) < 0.02
        x_sampled(i) = n(i)/0.02;
    else
        x_sampled(i) = -(n(i)-0.04)/0.02;
    end
end

figure('Name','Standard Sampling','NumberTitle','off');
        subplot(2,1,1); plot(t,x,'k','LineWidth',1.5); title('Original Continuous-Time Signal'); xlabel('Time (s)'); ylabel('Amplitude');
        subplot(2,1,2); stem(n,x_sampled,'--rs','MarkerFaceColor','r','LineWidth',1.2); title('Sampled Discrete-Time Signal'); xlabel('Sample Index'); ylabel('Amplitude');
            legend('Location','northwest'); legend('Samples');
saveas(gcf,'Standard_Sampling.png');
% B --------------------------------------------------
fs_low = 15;
ts_low = 1/fs_low;
n_low = -1:ts_low:1;
x_undersampled = zeros(size(n_low));

for i = 1:length(n_low)
    if rem(n_low(i), 0.04) < 0.02
        x_undersampled(i) = n_low(i)/0.02;
    else
        x_undersampled(i) = -(n_low(i)-0.04)/0.02;
    end
end

figure('Name','Undersampling','NumberTitle','off');
        subplot(2,1,1); plot(t,x,'k','LineWidth',1.5); title('Original Continuous-Time Signal'); xlabel('Time (s)'); ylabel('Amplitude');
        subplot(2,1,2); stem(n_low,x_undersampled,'--go','MarkerFaceColor','g','LineWidth',1.2); title('Undersampled Discrete-Time Signal'); xlabel('Sample Index'); ylabel('Amplitude');
            legend('Location','northwest'); legend('Samples');
saveas(gcf,'Undersampling.png');
% Compare ---------------------------------
figure('Name','Sampling Comparison','NumberTitle','off');
    subplot(2,1,1); plot(t,x,'k','LineWidth',1.5); hold on;
        stem(n,x_sampled,'--rs','MarkerFaceColor','r','LineWidth',1.2); title('Standard Sampling');
            xlabel('Time (s)'); ylabel('Amplitude'); legend('Original Signal','Sampled Signal','Location','northwest');

    subplot(2,1,2); plot(t,x,'k','LineWidth',1.5); hold on;
        stem(n_low,x_undersampled,'--go','MarkerFaceColor','g','LineWidth',1.2); title('Undersampling');
            xlabel('Time (s)'); ylabel('Amplitude'); legend('Original Signal','Undersampled Signal','Location','northwest');

saveas(gcf,'Sampling_Comparison.png');