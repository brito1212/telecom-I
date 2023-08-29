clear all;
close all;
clc;

amostra = 10000000;
t = 0.15 : 1/amostra : 1;

A = 1;
xt = sin(2*pi*25*t);
ct = cos(2*pi*250*t);
m = 0.3;


st = xt.*ct;



figure;
plot(t, xt);
title("Mensagem x(t)");
xlabel("t");
ylabel("sin(250Hz * t)");

figure;
plot(t, ct);
title("Portadora c(t)");
xlabel("t");
ylabel("cos(25Hz * t)");

figure;
plot(t, st);
title("Sinal Modulado s(t) sem portadora");
xlabel("t");
ylabel("s(t)");

St = fft(st);

figure;
plot(t, St);
title("Espectro de s(t) sem portadora");
xlabel("t");
ylabel("s(t)");

