%%
clc;clear; close all;

%% ABA
addpath 'D:\Sangwhee\PWAM_experiments\case8\ABA'
temp = readmatrix('Idc--case8ABA--00000.csv');
time_ABA = temp(:,4); time_ABA = time_ABA - time_ABA(1);
i_dc_ABA = temp(:,5);
rmpath 'D:\Sangwhee\PWAM_experiments\case8\ABA'

t = time_ABA;
fsample = 1/(t(2)-t(1));
fpass = [1.5e6,4e6];
[y,d] = bandstop(i_dc_ABA,fpass,fsample);

filtered_i_dc_ABA = filtfilt(d,i_dc_ABA);
filtered_i_dc_ABA = round(1e3*filtered_i_dc_ABA)*1e-3;

%% BAB
addpath 'D:\Sangwhee\PWAM_experiments\case8\BAB'
temp = readmatrix('Idc--case8BAB--00000.csv');
time_BAB = temp(:,4); time_BAB = time_BAB - time_BAB(1);
i_dc_BAB = temp(:,5);
rmpath 'D:\Sangwhee\PWAM_experiments\case8\BAB'

t = time_BAB;
fsample = 1/(t(2)-t(1));
fpass = [1.5e6,4e6];
[y,d] = bandstop(i_dc_BAB,fpass,fsample);

filtered_i_dc_BAB = filtfilt(d,i_dc_BAB);
filtered_i_dc_BAB = round(1e3*filtered_i_dc_BAB)*1e-3;

%% BAB-ABA
addpath 'D:\Sangwhee\PWAM_experiments\case8\BAB-ABA'
temp = readmatrix('Idc--case8BAB-ABA--00000.csv');
time_BAB_ABA = temp(:,4); time_BAB_ABA = time_BAB_ABA - time_BAB_ABA(1);
i_dc_BAB_ABA = temp(:,5);
clear temp;
rmpath 'D:\Sangwhee\PWAM_experiments\case8\BAB-ABA'

t = time_BAB_ABA;
fsample = 1/(t(2)-t(1));
fpass = [1.5e6,4e6];
[y,d] = bandstop(i_dc_BAB_ABA,fpass,fsample);
%%
filtered_i_dc_BAB_ABA = filtfilt(d,i_dc_BAB_ABA);
filtered_i_dc_BAB_ABA = round(1e3*filtered_i_dc_BAB_ABA)*1e-3;
%% plot
figure(1); 
subplot(2,1,1); plot(time_ABA,i_dc_ABA); hold on; plot(time_BAB,i_dc_BAB,':');
subplot(2,1,2); plot(time_BAB_ABA,i_dc_BAB_ABA); hold on; plot(time_BAB,i_dc_BAB,':');

figure(2); 
subplot(2,1,1); plot(time_ABA,filtered_i_dc_ABA); hold on; plot(time_BAB,filtered_i_dc_BAB,':');
subplot(2,1,2); plot(time_BAB_ABA,filtered_i_dc_BAB_ABA); hold on; plot(time_BAB,filtered_i_dc_BAB,':');

%%
ABA_data = [time_ABA, filtered_i_dc_ABA];
BAB_data = [time_BAB, filtered_i_dc_BAB];
BAB_ABA_data = [time_BAB_ABA,filtered_i_dc_BAB_ABA];
save('case8_ABA_filtered','ABA_data')
save('case8_BAB_filtered','BAB_data')
save('case8_BAB_ABA_filtered','BAB_ABA_data')