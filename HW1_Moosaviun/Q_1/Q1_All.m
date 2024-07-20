clc;
clear;
close all;

x= -3:.001:10;
y=exp(x);

figure;
subplot(2,6,1)
    plot(x,y,'r',LineWidth=2)
        ylabel("y")
        xlabel("x")
        title("exp(x)")
        grid on;
        axis tight
        legend('exp');
subplot(2,6,2)
    stem(y,'r')
        ylabel("y")
        xlabel("x")
        title("Stem")
        legend('stem of exp')
        grid on;
        axis tight

x= -1:.001:1;
f=1;% considered f=1
y=cos(2*pi*f*x);

subplot(2,6,3)
    plot(x,y,'g',LineWidth=2)
        ylabel("y")
        xlabel("x")
        title("cos(x)")
        grid on;
        axis tight
        legend('cos');
subplot(2,6,4)
    stem(y,'g')
        ylabel("y")
        xlabel("x")
        title("Stem")
        legend('stem of cos')
        grid on;
        axis tight

x= -1:.001:3;
x0=1; %we want a step in 1 so we gave x0=1
y=stepfun(x,x0);

subplot(2,6,5)
    plot(x,y,'b',LineWidth=1,LineStyle='--')
        ylabel("y")
        xlabel("x")
        title("unit step")
        grid on;
        axis tight
        legend('step');
subplot(2,6,6)
    stem(y,'b')
        ylabel("y")
        xlabel("x")
        title("Stem")
        legend('stem of step')
        grid on;
        axis tight


[u,t]= gensig("square",5,30);  %is a function for plot waves

subplot(2,6,7)
    plot(t,u,'k',LineWidth=1,LineStyle='-.')
        axis([0 30 -0.5 1.5])
        ylabel("y")
        xlabel("x")
        title("square wave")
        legend('square wave');
        grid on;
subplot(2,6,8)
    stem(t,u,'k')
        axis([0 30 -0.5 1.5])
        ylabel("y")
        xlabel("x")
        title("stem of square wave")
        legend('stem');
        grid on;


ymax=5;
xmin=-15;
xmax= 15;
x0=0;
T=5;
step=0.01;
n=(xmax-xmin)/step;
y=1:n;
x=1:n;

for i=1:n
    x(i)=xmin+i*step;
    y(i)=ymax*abs(((mod(x(i),T))*2/T-1));
end

subplot(2,6,9)
    plot(x,y);
        ylabel("y")
        xlabel("x")
        title("Triangule")
        grid on;
        axis tight
        legend('triangule');
subplot(2,6,10)
    stem(x,y)
        ylabel("y")
        xlabel("x")
        title("stem of triangule wave")
        grid on;
        axis tight
        legend('stem');


chirp = dsp.Chirp('SweepDirection', 'Bidirectional','TargetFrequency', 25,'InitialFrequency', 0,'TargetTime', 1,'SweepTime', 1,'SamplesPerFrame', 400,'SampleRate', 400);

subplot(2,6,11)
    plot(chirp(),'m',LineWidth=1);
        ylabel("y")
        xlabel("x")
        title("chirp")
        grid on;
        axis tight
        legend('chirp');
subplot(2,6,12)
    stem(chirp(),'m')
        ylabel("y")
        xlabel("x")
        title("stem of chirp")
        grid on;
        axis tight
        legend('stem');