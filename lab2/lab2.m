clear all;
close all;
clc;

t = linspace(0, 0.25, 1000);

fm = 25;
fc = 250;
A = 1;
xt = sin(2*pi*fm*t);
ct = cos(2*pi*fc*t);


figure;
subplot(1,2,1);
plot(t, xt);
title("Mensagem x(t)");
xlabel("t");
ylabel("sin(250Hz * t)");

subplot(1, 2, 2);
plot(t, ct);
title("Portadora c(t)");
xlabel("t");
ylabel("cos(25Hz * t)");


## SINAL MODULADO COM PORTADORA
m = 1.4;
st = A*(1 + m*xt).*ct;


figure;
subplot(2, 2, 1);
plot(t, st);
title("Sinal Modulado s(t) com portadora para m = 1.4");
xlabel("t");
ylabel("s(t)");

f = linspace(-fc, fc, 1000);
ff = fft(st);
ffs = fftshift(ff);

subplot(2, 2, 2);
plot(f, abs(ff));
title("Espectro de s(t)");
xlabel("t");
ylabel("s(t)");

subplot(2,2,3);
plot(f, abs(ffs));
title("Espectro de s(t) com shift");
xlabel("t");
ylabel("s(t)");

## SINAL MODULADO SEM PORTADORA
st2 = xt.*ct;

figure;
subplot(2, 2, 1);
plot(t, st2);
title("Sinal Modulado s(t) sem portadora");
xlabel("t");
ylabel("s(t)");

f = linspace(-fc, fc, 1000);
ff = fft(st2);
ffs = fftshift(ff);


subplot(2, 2, 2);
plot(f, abs(ff));
title("Espectro de s(t)");
xlabel("t");
ylabel("s(t)");

subplot(2,2,3);
plot(f, abs(ffs));
title("Espectro de s(t) com shift");
xlabel("t");
ylabel("s(t)");

