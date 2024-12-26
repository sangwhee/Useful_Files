%% Z analyzer to Plot
clc;clear;close all;


%% Read CSV file
temp = xlsread('Z_L_10kHz_50MHz_Litz_2.csv');
freq = temp(:,1);
Z = temp(:,2);
phase = temp(:,3);


semilogx(freq,mag2db(Z),'linewidth',1.5); grid on;
xlabel('frequency (Hz)'); ylabel('Z (\Omega)');
width = 16; height = 10;
set(gcf,'units','centimeters','position',[1,1,width,height])
ylim([0,120])

L = 121e-6; %at zero current
f_res = 1.74663e6;

% L = 7.0935e-4;
% f_res = 585e3; ==> 68.6pF NICE!
C = (1/(f_res*2*pi))^2/L;