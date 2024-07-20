clear;
clc;
close all;

%create the sinc wave with -40 to 40 domain
x_1 = linspace(-40,40,1000);
sinc_signal_1 = sinc(x_1);

%calculate the Energy of the signal
E1 = trapz(x_1, abs(sinc_signal_1).^2);

%create the sinc wave with -1 to 1 domain
x_2 = linspace(-1,1,1000);
sinc_signal_2 = sinc(x_2);
%plot the signals
figure;
subplot(2,1,1)
    plot(x_1,sinc_signal_1,'g',LineWidth=1.5);
        title('sinc signal with -40 40 domain')
        grid on
subplot(2,1,2)
    plot(x_2,sinc_signal_2,'r',LineWidth=1.5);
        title('sinc signal with -1 1 domain')
        grid on

%calculate the Energy of the signal
E2 = trapz(x_2, abs(sinc_signal_2).^2);

% Display the energies
disp(['Energy of sinc signal within domain -1 to 1: ', num2str(E1)]);
disp(['Energy of sinc signal within domain -40 to 40: ', num2str(E2)]);

% Compare the energies
if E1 > E2
    disp('Energy of sinc signal in domain -1 to 1 is greater.');
elseif E1 < E2
    disp('Energy of sinc signal in domain -40 to 40 is greater.');
else
    disp('Energies of sinc signals in both domains are equal.');
end