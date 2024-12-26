%%
clc;clear; close all;

%%
temp1 = load('case0_time.mat'); temp2 = load('case0_i_dc_ABA.mat'); temp3 = load('case0_i_dc_BAB.mat'); 
case0_time = temp1.time; 
case0_i_dc_ABA = temp2.i_dc_ABA;
case0_i_dc_BAB = temp3.i_dc_BAB;

temp1 = load('case1_time.mat'); temp2 = load('case1_i_dc_ABA.mat'); temp3 = load('case1_i_dc_BAB.mat'); 
case1_time = temp1.time; 
case1_i_dc_ABA = temp2.i_dc_ABA;
case1_i_dc_BAB = temp3.i_dc_BAB;

temp1 = load('case2_time.mat'); temp2 = load('case2_i_dc_ABA.mat'); temp3 = load('case2_i_dc_BAB.mat'); 
case2_time = temp1.case2_time; 
case2_i_dc_ABA = temp2.case2_i_dc_ABA;
case2_i_dc_BAB = temp3.case2_i_dc_BAB;

temp1 = load('case3_time.mat'); temp2 = load('case3_i_dc_ABA.mat'); temp3 = load('case3_i_dc_BAB.mat'); 
case3_time = temp1.time; 
case3_i_dc_ABA = temp2.i_dc_ABA;
case3_i_dc_BAB = temp3.i_dc_BAB;

%%


%% 6th order buttwerwordth filter
% https://www.mathworks.com/help/signal/ug/anti-causal-zero-phase-filter-implementation.html
% d = designfilt('bandstopfir', ...       % Response type
%        'FilterOrder',100, ...            % Filter order
%        'PassbandFrequency1',2e6, ...    % Frequency constraints
%        'StopbandFrequency1',2.5e6, ...
%        'StopbandFrequency2',3.5e6, ...
%        'PassbandFrequency2',4e6, ...
%        'DesignMethod','ls', ...         % Design method
%        'PassbandWeight1',1, ...         % Design method options
%        'StopbandWeight', 3, ...
%        'PassbandWeight2',5, ...
%        'SampleRate',fsample);               % Sample rate
%%
% https://www.mathworks.com/help/signal/ref/bandstop.html

%% Case0
t = case0_time;
fsample = 1/(t(2)-t(1));
fpass = [1.5e6,4e6];
[y,d] = bandstop(case0_i_dc_BAB,fpass,fsample);

filtered_ABA = filtfilt(d,case0_i_dc_ABA);
filtered_BAB = filtfilt(d,case0_i_dc_BAB);

filtered_ABA = round(1e3*filtered_ABA)*1e-3;
filtered_BAB = round(1e3*filtered_BAB)*1e-3;

figure(1)
subplot(4,1,1); plot(t,case0_i_dc_ABA); hold on; plot(t,filtered_ABA);   title('case0 ABA');
subplot(4,1,2); plot(t,case0_i_dc_BAB); hold on; plot(t,filtered_BAB);   title('case0 BAB');
subplot(4,1,3); plot(t,case0_i_dc_ABA); hold on; plot(t,case0_i_dc_BAB); title('case0 orignal');
subplot(4,1,4); plot(t,filtered_ABA); hold on; plot(t,filtered_BAB);     title('case0 filtered');

%% Case1
t = case1_time;
fsample = 1/(t(2)-t(1));
fpass = [1.5e6,4e6];
[y,d] = bandstop(case1_i_dc_BAB,fpass,fsample);

filtered_ABA = filtfilt(d,case1_i_dc_ABA);
filtered_BAB = filtfilt(d,case1_i_dc_BAB);

filtered_ABA = round(1e3*filtered_ABA)*1e-3;
filtered_BAB = round(1e3*filtered_BAB)*1e-3;

figure(2);
subplot(4,1,1); plot(t,case1_i_dc_ABA); hold on; plot(t,filtered_ABA);   title('case1 ABA');
subplot(4,1,2); plot(t,case1_i_dc_BAB); hold on; plot(t,filtered_BAB);   title('BAB');
subplot(4,1,3); plot(t,case1_i_dc_ABA); hold on; plot(t,case1_i_dc_BAB); title('orignal');
subplot(4,1,4); plot(t,filtered_ABA); hold on; plot(t,filtered_BAB);     title('filtered');

%% Case2
t = case2_time;
fsample = 1/(t(2)-t(1));
fpass = [1.5e6,4e6];
[y,d] = bandstop(case2_i_dc_BAB,fpass,fsample);

filtered_ABA = filtfilt(d,case2_i_dc_ABA);
filtered_BAB = filtfilt(d,case2_i_dc_BAB);

filtered_ABA = round(1e3*filtered_ABA)*1e-3;
filtered_BAB = round(1e3*filtered_BAB)*1e-3;

figure(3);
subplot(4,1,1); plot(t,case2_i_dc_ABA); hold on; plot(t,filtered_ABA);   title('ABA');
subplot(4,1,2); plot(t,case2_i_dc_BAB); hold on; plot(t,filtered_BAB);   title('BAB');
subplot(4,1,3); plot(t,case2_i_dc_ABA); hold on; plot(t,case2_i_dc_BAB); title('orignal');
subplot(4,1,4); plot(t,filtered_ABA); hold on; plot(t,filtered_BAB);     title('filtered');

%% Case3
t = case3_time;
fsample = 1/(t(2)-t(1));
fpass = [1.5e6,4e6];
[y,d] = bandstop(case3_i_dc_BAB,fpass,fsample);

filtered_ABA = filtfilt(d,case3_i_dc_ABA);
filtered_BAB = filtfilt(d,case3_i_dc_BAB);

filtered_ABA = round(1e3*filtered_ABA)*1e-3;
filtered_BAB = round(1e3*filtered_BAB)*1e-3;

figure(4);
subplot(4,1,1); plot(t,case3_i_dc_ABA); hold on; plot(t,filtered_ABA);   title('ABA');
subplot(4,1,2); plot(t,case3_i_dc_BAB); hold on; plot(t,filtered_BAB);   title('BAB');
subplot(4,1,3); plot(t,case3_i_dc_ABA); hold on; plot(t,case3_i_dc_BAB); title('orignal');
subplot(4,1,4); plot(t,filtered_ABA); hold on; plot(t,filtered_BAB);     title('filtered');