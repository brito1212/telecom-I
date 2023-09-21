clear all;
close all;
clc;

t = linspace(0, 0.02, 20000);
Kf = 2000;
fm_am = 80;
fm_FM = 200;
fc_amdsb = 1000
fc_amdsbsc = 2000
fc_FM = 5000

## Sinais
mt_am = cos(2*pi*fm_am*t);
mt_fm = cos(2*pi*fm_FM*t);
int_mt = 10*sin(2*pi*fm_FM*t);

AM_dsb = 2*cos(2*pi*fc_amdsb*t) + mt_am.*cos(2*pi*fc_amdsb*t);
AM_dsb_sc = 2*mt_am.*cos(2*pi*fc_amdsbsc*t);
FM = 2*cos(2*pi*fc_FM*t + int_mt);

FDM = AM_dsb + AM_dsb_sc + FM;

## Espectros
f_amdsb = linspace(-fc_amdsb, fc_amdsb, 20000);
ff_amdsb = fft(AM_dsb);
ffs_amdsb = fftshift(ff_amdsb);

f_amdsbsc = linspace(-fc_amdsbsc, fc_amdsbsc, 20000);
ff_amdsbsc = fft(AM_dsb_sc);
ffs_amdsbsc = fftshift(ff_amdsbsc);

f_FM = linspace(-fc_FM, fc_FM, 20000);
ff_FM = fft(FM);
ffs_FM = fftshift(ff_FM);

f_FDM = linspace(-fc_FM, fc_FM, 20000);
ff_FDM = fft(FDM);
ffs_FDM = fftshift(ff_FDM);

figure;
subplot(1,2,1);
plot(t, mt_am);
title('Sinal modulante para AM');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(1,2,2);
plot(t, mt_fm);
title('Sinal modulante para FM');
xlabel('Tempo (s)');
ylabel('Amplitude');

figure;
subplot(2,1,1);
plot(t, FM);
title('Modulação por Fase (FM)');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,2,3);
plot(t, AM_dsb_sc);
title('Modulação por AM-DSB-SC');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,2,4);
plot(t, AM_dsb);
title('Modulação por AM-DSB');
xlabel('Tempo (s)');
ylabel('Amplitude');

figure;
subplot(2,1,1);
plot(f_FM, abs(ffs_FM));
title('Modulação por Fase (FM)');
xlabel('Frequencia (Hz)');
ylabel('Amplitude');

subplot(2,2,3);
plot(f_amdsb, abs(ffs_amdsb));
title('Espectro AM-DSB');
xlabel('Frequencia (Hz)');
ylabel('Amplitude');

subplot(2,2,4);
plot(f_amdsbsc, abs(ffs_amdsbsc));
title('Espectro AM-DSB-SC');
xlabel('Frequencia (Hz)');
ylabel('Amplitude');

figure;
subplot(2,1,1);
plot(t, FDM);
title('Sinal Multiplexado FDM');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(f_FDM, abs(ffs_FDM));
title('Espectro do Sinal Multiplexado FDM');
xlabel('Frequencia (Hz)');
ylabel('Amplitude');
