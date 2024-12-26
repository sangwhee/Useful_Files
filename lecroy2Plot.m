%% Lecroy to Plot
clc;clear;close all;

%% Plot IL = 20 A, Rg = 2 ohm
figure(1)
adjFactor = -1230;
%% Worst case: no snubber = Blue
temp = xlsread('vds1Vab--csi module 3 phase 30a 500v no snub--00000.csv');
v_ds1.time = temp(15000-adjFactor:end,1);
v_ds1.value = temp(15000-adjFactor:end,2);
v_ds1.time = v_ds1.time - v_ds1.time(1);
tadj = 0;
p1 = plot(v_ds1.time,v_ds1.value,'linewidth',0.7); hold on;grid on; ylim([-200 1200]);

% find 5% settling time
index = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index1 = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index = index(end);
t_1 = v_d2.time(index);
% find starting time
index = find(v_d2.value>10,1);
t_0 = v_d2.time(index);
settlingTimeNoSnub = t_1 - t_0;

% setting time point
index1 = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index1 = index1(end);
plot(v_d2.time(index1),v_d2.value(index1),'k.','markerSize',5); hold on; grid on;

% verify that this is the 5% settling time
%plot(v_d2.time(index1),v_d2.value(index1),'k.','markerSize',5); hold on; grid on;

%% Optimal case A: R_dp = 6.04; C_dp = 14.1 nF = orange
temp = xlsread('vd2Vbc--csi module 3 phase 30a 500v no snub--00000.csv');
v_d2.time = temp(19153-adjFactor:end,1);
v_d2.value = temp(19153-adjFactor:end,2);
v_d2.time = v_d2.time - v_d2.time(1);
tadj = 0;
p2 = plot(v_d2.time,v_d2.value,':','linewidth',2,'color',[0.8500    0.3250    0.0980],'markersize',2); hold on;grid on; ylim([-200 1200]);
% find 5% settling time
index = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index = index(end);
t_1 = v_d2.time(index);
% find starting time
index = find(v_d2.value>10,1);
t_0 = v_d2.time(index);
settlingTimeCaseA = t_1 - t_0;

% setting time point
index1 = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index1 = index1(end);
plot(v_d2.time(index1),v_d2.value(index1),'k.','markerSize',5); hold on; grid on;

%% Non optimal case B: R_dp = 9.1; C_dp = 18.8 nF = yellow
temp = xlsread('vd2--csi module dpt 30a 500v 18.8nf9.1ohm--00000.csv');
v_d2.time = temp(19143-adjFactor:end,1);
v_d2.value = temp(19143-adjFactor:end,2);
v_d2.time = v_d2.time - v_d2.time(1);
tadj = 0;
p3 = plot(v_d2.time,v_d2.value,'--','linewidth',1.0,'color',[0.9290    0.6940    0.1250]); hold on;grid on; ylim([-200 1200]);

% find 5% settling time
index = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index = index(end);
t_1 = v_d2.time(index);
% find starting time
index = find(v_d2.value>10,1);
t_0 = v_d2.time(index);
settlingTimeCaseB = t_1 - t_0;

% setting time point
index1 = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index1 = index1(end);
plot(v_d2.time(index1),v_d2.value(index1),'k.','markerSize',5); hold on; grid on;

%% Decoupling capacitor case C: R_dp = 0; C_dp = 14.1 nF purple
temp = xlsread('vd2--csi module dpt 30a 500v 14.1nf0ohm--00000.csv');
v_d2.time = temp(14523-adjFactor:end,1);
v_d2.value = temp(14523-adjFactor:end,2);
v_d2.time = v_d2.time - v_d2.time(1);
tadj = 0;
p4 = plot(v_d2.time,v_d2.value,':','linewidth',1.0,'color',[0.4940    0.1840    0.5560]); hold on;grid on; ylim([-200 1200]);
% find 5% settling time
index = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index = index(end);
t_1 = v_d2.time(index);
% find starting time
index = find(v_d2.value>10,1);
t_0 = v_d2.time(index);
settlingTimeCaseC = t_1 - t_0;

% setting time point
index1 = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index1 = index1(end);
plot(v_d2.time(index1),v_d2.value(index1),'k.','markerSize',5); hold on; grid on;

%% Non optimal case D: R_dp = 2; C_dp = 1 nF
temp = xlsread('vd2--csi module dpt 30a 500v 1nf2ohm--00000.csv');
v_d2.time = temp(14477-adjFactor:end,1);
v_d2.value = temp(14477-adjFactor:end,2);
v_d2.time = v_d2.time - v_d2.time(1);
tadj = 0;
p5 = plot(v_d2.time,v_d2.value,'-.','linewidth',1.0,'color',[0.4660    0.6740    0.1880]); hold on;grid on; ylim([-200 1200]);
% find 5% settling time
index = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index = index(end);
t_1 = v_d2.time(index);
% find starting time
index = find(v_d2.value>10,1);
t_0 = v_d2.time(index);
settlingTimeCaseD = t_1 - t_0;

% setting time point
index1 = find(v_d2.value>500*1.05 | v_d2.value<500*0.95);
index1 = index1(end);
plot(v_d2.time(index1),v_d2.value(index1),'k.','markerSize',5); hold on; grid on;


legend1 = legend([p1(1),p2(1),p3(1),p4(1),p5(1)]...
                            ,'No damper','case A','case B','case C', 'case D');
legend boxoff
set(legend1,'Interpreter','latex')
xlabel('time (s)'); ylabel('$v_{ak2}$ (V)','Interpreter','latex')
set(gca,'FontName','Times New Roman','FontSize',8);
xlim([0, 0.5]*1e-6)

x0 = 1; y0 = 1;
width = 8;height = 5;
set(gcf,'units','centimeters','position',[x0,y0,width,height])


%% For magnified version
figure(3)
%% Worst case: no snubber = Blue
temp = xlsread('vd2--csi module dpt 30a 500v nosnub--00000.csv');
v_d2.time = temp(15000-adjFactor:end,1);
v_d2.value = temp(15000-adjFactor:end,2);
v_d2.time = v_d2.time - v_d2.time(1);
tadj = 0;
plot(v_d2.time,v_d2.value,'linewidth',0.5); hold on;grid on; ylim([-200 1200]);

%% Non optimal case 1: R_dp = 15; C_dp = 2 nF = Orange
temp = xlsread('vd2--csi module dpt 30a 500v 2nf15ohm--00000.csv');
v_d2.time = temp(17713-adjFactor:end,1);
v_d2.value = temp(17713-adjFactor:end,2);
v_d2.time = v_d2.time - v_d2.time(1);
tadj = 0;
plot(v_d2.time,v_d2.value,':','linewidth',0.5); hold on;grid on; ylim([-200 1200]);

%% Non optimal case 2: R_dp = 9.1; C_dp = 18.8 nF = yellow
temp = xlsread('vd2--csi module dpt 30a 500v 18.8nf9.1ohm--00000.csv');
v_d2.time = temp(19143-adjFactor:end,1);
v_d2.value = temp(19143-adjFactor:end,2);
v_d2.time = v_d2.time - v_d2.time(1);
tadj = 0;
plot(v_d2.time,v_d2.value,'-.','linewidth',0.5); hold on;grid on; ylim([-200 1200]);

%% Optimal case: R_dp = 6.04; C_dp = 14.1 nF = purple
temp = xlsread('vd2--csi module dpt 30a 500v 14.1nf6.04ohm--00000.csv');
v_d2.time = temp(19153-adjFactor:end,1);
v_d2.value = temp(19153-adjFactor:end,2);
v_d2.time = v_d2.time - v_d2.time(1);
tadj = 0;
plot(v_d2.time,v_d2.value,'--','linewidth',0.5); hold on;grid on; ylim([-200 1200]);

xlabel('time (s)'); ylabel('$v_{ak2}$ (V)','Interpreter','latex')
set(gca,'FontName','Times New Roman','FontSize',8);
xlim([1.1,2.5]*1e-7);ylim([300,1200])

x0 = 1; y0 = 1;
width = 4;height = 3;
set(gcf,'units','centimeters','position',[x0,y0,width,height])



%%% End of the script
temp = xlsread('I1--csi module dpt 20a Rg2 500v--00000.csv');
i_ds1.time = temp(4900:end,1);
i_ds1.value = temp(4900:end,2);
i_ds1.time = i_ds1.time - i_ds1.time(1);
tadj = 0;
yyaxis right
plot(i_ds1.time,i_ds1.value,'linewidth',1.0); hold on;grid on; ylim([-40 120]);
legend('v_{ds1}','i_{ds1}'); legend boxoff;
yyaxis left
xlim([2 2.4]*1e-6)

indexNum = 50;

index = find(i_ds1.value >= 0.2,indexNum);
V_dc = v_ds1.value(index(1));
V_ds1Last = v_ds1.value(index(indexNum)); 
time0 = v_ds1.time(index(1));
timeLast = v_ds1.time(index(indexNum));
delV_ds1 = V_dc - v_ds1.value(index(2:end));
delTime = v_ds1.time(index(2:end)) - v_ds1.time(index(1:end-1));
delI_ds1 = i_ds1.value(index(2:end)) - i_ds1.value(index(1:end-1));

L_p = delV_ds1 .* delTime ./ delI_ds1;

figure(100)
plot(index(2:end),L_p,'.-','linewidth',1.0,'markersize',10); grid on;
figure(101)
plot(index(2+1+6:end-5)-44,L_p(2+6:end-5),'.-','linewidth',1.5,'markersize',10); grid on;
L_pMed = median(L_p(8:end-5));
L_pAvg = mean(L_p(8:end-5));
%% Plot IL = 20 A, Rg = 1 ohm, snub
% figure(1)
temp = xlsread('vds1--csi module dpt 5a Rg1 500v snub--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
tadj = 3.6364e-6 - 2.497e-6 - 2.5662e-6 + 2.5562e-6;
plot(temp(:,1)-t0+tadj,temp(:,2),'--','linewidth',2); hold on;

temp = xlsread('vds1--csi module dpt 10a Rg1 500v snub--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
tadj = 3.6364e-6 - 2.497e-6 - 2.5662e-6 + 2.5562e-6;
plot(temp(:,1)-t0+tadj,temp(:,2),'--','linewidth',2.0); hold on;grid on;

temp = xlsread('vds1--csi module dpt 20a Rg1 500v snub--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
tadj = 3.6364e-6 - 2.497e-6 - 2.5662e-6 + 2.5562e-6;
plot(temp(:,1)-t0+tadj,temp(:,2),'--','linewidth',2.0); hold on;grid on;

temp = xlsread('vds1--csi module dpt 30a Rg1 500v snub--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
tadj = 3.6364e-6 - 2.497e-6 - 2.5662e-6 + 2.5562e-6;
plot(temp(:,1)-t0+tadj,temp(:,2),'--','linewidth',2.0); hold on;grid on;
ylim([-100,1200]); xlim([2e-6,4e-6])
legend('5 A (Rg = 2 \Omega)','10 A (Rg = 2 \Omega)','20 A (Rg = 2 \Omega)','30 A (Rg = 2 \Omega)',...
       '5 A (Rg = 1 \Omega)','10 A (Rg = 1 \Omega)','20 A (Rg = 1 \Omega)','30 A (Rg = 1 \Omega)'); legend boxoff;

%% 20 A snub
subplot(3,1,3)
temp = xlsread('Vds1--csi module dpt 20a Rg2 500v snub--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
plot(temp(:,1)-t0,temp(:,2),'linewidth',1.0); hold on;

temp = xlsread('Vd2--csi module dpt 20a Rg2 500v snub--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
plot(temp(:,1)-t0,temp(:,2),'linewidth',1.0); hold on;grid on;
ylim([-100,1200])
legend('V_{ds1}','V_{d2}'); legend boxoff;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 20A no snub
figure(2)
subplot(2,1,1)
temp = xlsread('Vds1--csi module dpt 20a Rg2 500v_singlePin--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
plot(temp(:,1)-t0,temp(:,2),'linewidth',1.0); hold on;

temp = xlsread('Vd2--csi module dpt 20a Rg2 500v_siglePin--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
tadj = 0;
plot(temp(:,1)-t0,temp(:,2),'linewidth',1.0); hold on; grid on;
ylim([-100,1200]); xlim([0+tadj,1.2e-5+tadj])
legend('V_{ds1}','V_{d2}'); legend boxoff;

subplot(2,1,2)
temp = xlsread('Is1--csi module dpt 20a Rg2 500v_singlePin--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
plot(temp(:,1)-t0,temp(:,2),'linewidth',1.0); hold on;

temp = xlsread('icap--csi module dpt 20a Rg2 500v_singlePin--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
plot(temp(:,1)-t0,-temp(:,2)+20,'linewidth',1.0); hold on
legend('i_{ds1}','i_{cap}'); legend boxoff; grid on;

%% 20A with snub
figure(3)
subplot(2,1,1)
temp = xlsread('Vds1--csi module dpt 20a Rg2 500v snub--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
plot(temp(:,1)-t0,temp(:,2),'linewidth',1.0); hold on;

temp = xlsread('Vd2--csi module dpt 20a Rg2 500v snub--00000.csv');
temp = temp(6:end,1:2);
t0 = temp(:,1);
t0 = t0(1);
tadj = 0;
plot(temp(:,1)-t0,temp(:,2),'linewidth',1.0); hold on; grid on;
ylim([-100,1200]); xlim([0+tadj,1.2e-5+tadj])
legend('V_{ds1}','V_{d2}'); legend boxoff;

subplot(2,1,2)
temp = xlsread('Is1--csi module dpt 20a Rg2 500v snub--00000.csv');
temp1 = temp(6:end,1:2);
t0 = temp1(:,1);
t0 = t0(1);
plot(temp1(:,1)-t0,temp1(:,2),'linewidth',1.0); hold on;

temp = xlsread('icap--csi module dpt 20a Rg2 500v snub--00000.csv');
temp2 = temp(6:end,1:2);
t0 = temp2(:,1);
t0 = t0(1);
plot(temp2(:,1)-t0,-temp2(:,2)+21,'linewidth',1.0); hold on
legend('i_{ds1}','i_{cap}'); legend boxoff; grid on;

plot(temp2(:,1)-t0,temp1(:,2) - (-temp2(:,2)+21),'linewidth',1.0); hold on
legend('i_{ds1}','i_{cap}','i_{sb}'); legend boxoff; grid on;