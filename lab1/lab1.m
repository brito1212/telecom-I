clear all;
close all;
clc;

t = linspace(0, 0.3, 200);

freq = 10000;
xt = sin(2*pi*freq*t);

figure;
plot(t, xt);
title("Sinal senoidal x(t) = sin(10000 Hz * t)");
xlabel("t");
ylabel("x(t)");


figure;
stem(t, xt);
title("Sinal senoidal x(t) com stem()");
xlabel("t");
ylabel("x(t)");


