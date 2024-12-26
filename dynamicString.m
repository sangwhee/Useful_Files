%%
clc; clear; 
close all;
addpath 'C:\Users\lee884\Documents\MATLAB\Examples'
motorType = 1; % 0: CW 1: TW
kfreq = 50; % 10 kHz, 50 kHz;

%% import simulated i_cm data
if(motorType == 0)
    fileName = ['CM_Ckt_Sim_', num2str(kfreq), 'kHz_CW.txt'];
    data = importdata(fileName);
else % motorType == 1;
    data = importdata(['CM_Ckt_Sim_',num2str(kfreq),'kHz_TW.txt']);
end

%%
time = data.data(:,1);
i_CM = data.data(:,2);
fspl = 100e6;
[freq_I,i_CMFFT] = myFFT(time,i_CM,fspl);

figure(1); semilogx(freq_I, mag2db(i_CMFFT*1e6),'linewidth',0.8); hold on;
set(gcf,'units','centimeters','position',[3,3,8,4]); grid minor;
xlim([150e3, 30e6]);
xlabel('frequency (Hz)'); ylabel('$i_{CM}$ (dB$\mu$A)','Interpreter','latex','FontSize',8,'FontName','TimesNewRoman');
set(gca,'FontName','Times New Roman','FontSize',8);
xticks([150e3, 1e6, 10e6, 30e6])                                         % 또 다른 방법
xticklabels({'150k','1M','10M','30M'})

if(motorType == 0)
legend1 = legend('TW','CW'); legend boxoff; set(legend1,'Interpreter','latex');
end


