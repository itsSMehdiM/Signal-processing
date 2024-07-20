clear
close all
clear all


t = 0:0.0001:0.1;
fc = 10e6;
u = 100*cos(2*pi*fc*t + 4*sin(2000*pi*t));
P_avg_sim = mean(u.^2)

A = 100;
P_avg_theory = (A^2)/2

figure('Name','Average Power Comparison','NumberTitle','off');
    subplot(1,2,1); stem(t,u.^2); title('Simulated Power'); xlabel('Time (s)'); ylabel('Power');
    subplot(1,2,2); stem([0 1],[P_avg_sim P_avg_theory]); title('Average Power'); xlabel('Sim/Theory'); ylabel('Power');
        legend('Simulated','Theoretical');


saveas(gcf,'Average_Power_Comparison.png');