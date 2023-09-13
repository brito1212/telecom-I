clear all;
close all;
clc;

## Constantes Dadas
Ac = 2;
fc = 5 * 10^3;
fm = 100;

## Constantes Escolhidas
t = linspace(0, 0.01, 20000);
Kp = 20;
Kf = 20000;



## Sinais
mt = 2*cos(2*pi*fm*t);

PM = Ac*cos(2*pi*fc*t + Kp*mt);

int_mt = (1/(2*pi*fm))*sin(2*pi*fm*t);
FM = Ac*cos(2*pi*fc*t + Kf*int_mt);

AM_dsb = Ac*cos(2*pi*fc*t) + mt.*cos(2*pi*fc*t);


figure;
subplot(2,2,1);
plot(t, mt);
title('Sinal modulante');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,2,2);
plot(t, PM);
title('Modulação por Fase (PM)');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,2,3);
plot(t, FM);
title('Modulação por Frequência (FM)');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,2,4);
plot(t, AM_dsb);
title('Modulação por Amplitude (AM-DSB)');
xlabel('Tempo (s)');
ylabel('Amplitude');

