clear;close all; clc;

addpath 'C:\Users\lee884\Desktop\CSI_EMI\Experimental result\APEC_experimental result\PF0deg\conventional'
rmpath 'C:\Users\lee884\Desktop\CSI_EMI\Experimental result\APEC_experimental result\PF0deg\conventional'
temp2 = readmatrix('Vbo--0.5-8A--00000.csv');

fig1 = figure(1);
tiledlayout(1,1,'Padding','tight');nexttile;

semilogx(freq,mag2db(v_CMFFT*1e6),'linewidth',0.8); xlim([500,30e6]); ylim([50,150]);hold on;
set(gcf,'units','centimeters','position',[3,3,8,4]); 
legend1 = legend('Conventional PWM','Proposed AVM'); legend boxoff; set(legend1,'Interpreter','latex');
xlabel('frequency (Hz)'); ylabel('$v_{CM}$ (dB$\mu$V)','Interpreter','latex','FontSize',8,'FontName','TimesNewRoman');
set(gca,'FontName','Times New Roman','FontSize',8); box on;