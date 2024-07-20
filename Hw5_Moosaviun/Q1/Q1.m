clear
close all
clear all

t = -5:0.001:5;
m = sinc(2*t).^2;
fc = 100;
c = cos(2*pi*fc*t);

s_USSB = m.*c + hilbert(m).*sin(2*pi*fc*t);

figure('Name','USSB Modulation','NumberTitle','off');
    subplot(2,2,1); plot(t,m); title('Message Signal m(t)'); xlabel('Time (s)'); ylabel('Amplitude');
    subplot(2,2,2); plot(t,c); title('Carrier Signal c(t)'); xlabel('Time (s)'); ylabel('Amplitude');
    subplot(2,2,3); plot(t,s_USSB); title('USSB Modulated Signal'); xlabel('Time (s)'); ylabel('Amplitude');


saveas(gcf,'USSB_Modulation.png');3; plot(t,s_USSB); title('USSB Modulated Signal'); xlabel('t'); ylabel('Amplitude');t(2,2,4); plot(t,s_USSB); title('USSB Modulated Signal'); xlabel('t'); ylabel('Amplitude');