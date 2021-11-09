clc
clear
close all

% sample # 1
load('sinusoidalSignalExampleData.mat','X','fs')
t = (0:length(X)-1)/fs;

% sample # 2
% fs = 2000;
% t = 0:1/fs:2-1/fs;
% X = chirp(t-2,4,1/2,6,'quadratic',100,'convex').*exp(-4*(t-1).^2);

subplot(2,2,1);
plot(t,X);
xlabel('Time(s)');

subplot(2,2,2);
pspectrum(X,fs,'spectrogram','TimeResolution',1);

[imf,residual,info] = emd(X,'Interpolation','pchip','Display',1);

subplot(2,2,3);
hht(imf,fs);
