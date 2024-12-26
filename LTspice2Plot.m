%% Ltspice to Plot
clc;clear;close all;

%% Plot IL = 20 A, Previous result
figure(1)
temp = importdata('Analyze_influence_of_parasitics_ideal_case.txt');
time = temp.data(:,1);
V_ds1 = temp.data(:,2);
V_d2 = temp.data(:,3);
figure(1)
plot(time,V_ds1); hold on; grid on;
figure(2)
plot(time,V_d2); hold on; grid on;

temp = importdata('Analyze_influence_of_parasitics_non_ideal_case.txt');
time = temp.data(:,1);
V_ds1 = temp.data(:,2);
V_d2 = temp.data(:,3);
figure(1)
plot(time,V_ds1); hold on; grid on;
figure(2)
plot(time,V_d2); hold on; grid on;




%% https://www.mathworks.com/matlabcentral/answers/473988
%% -how-to-split-a-big-text-file-based-on-specific-strings
figure(2)
fileID = fopen('V_d2.txt');
c = 1;                      %line counter 
routineLine = [];           %stores line numbers of Routine
tline = fgetl(fileID);
while ischar(tline)         %loop through each line
    a = 1;
    if regexp(tline,'^Step')==1  %Determine if line begins with "Step"
        routineLine(end+1) = c;     %store line number of "Step" lines
    end
    tline = fgetl(fileID);     %reads next line
    c = c+1;                %increment line counter
end

%%
figure(3)
temp = readmatrix('V_d2s.txt');
temp1 = temp(:,1);
index = find(isnan(temp1));

time = temp(1:index(1)-1,1);
V_ds1 = temp(1:index(1)-1,2);
plot(time,V_ds1,'linewidth',1.0); hold on; grid on;

time = temp(index(1)+1:index(2)-1,1);
V_d2 = temp(index(1)+1:index(2)-1,2);
plot(time,V_d2,'linewidth',1.0); hold on; grid on;

time = temp(index(2)+1:end-1,1);
V_d2 = temp(index(2)+1:end-1,2);
plot(time,V_d2,'linewidth',1.0); hold on; grid on;

% time = temp(index(3)+1:end-1,1);
% V_d2 = temp(index(3)+1:end-1,2);
% plot(time,V_d2,'linewidth',1.5); hold on; grid on;
xlim([2.8e-6,4e-6]);
legend('V_{d2}, L_p = 100 nH','V_{d2}, L_p = 200 nH','V_{d2}, L_p = 300 nH');
legend boxoff
xlabel('time (sec)'); ylabel('voltage (V)');

%%
figure(4)
temp = readmatrix('V_ds1s.txt');
temp1 = temp(:,1);
index = find(isnan(temp1));

time = temp(1:index(1)-1,1);
V_ds1 = temp(1:index(1)-1,2);
plot(time,V_ds1,'linewidth',1.0); hold on; grid on;

time = temp(index(1)+1:index(2)-1,1);
V_ds1 = temp(index(1)+1:index(2)-1,2);
plot(time,V_ds1,'linewidth',1.0); hold on; grid on;

% time = temp(index(2)+1:index(3)-1,1);
% V_ds1 = temp(index(2)+1:index(3)-1,2);
% plot(time,V_ds1,'linewidth',1.5); hold on; grid on;

time = temp(index(2)+1:end-1,1);
V_ds1 = temp(index(2)+1:end-1,2);
plot(time,V_ds1,'linewidth',1.0); hold on; grid on;
xlim([4.8e-6, 6e-6]); ylim([-200, 1600]);
legend('V_{ds1}, L_s = 100 nH','V_{ds1}, L_s = 200 nH','V_{ds1}, L_s = 300 nH');
legend boxoff
xlabel('time (sec)'); ylabel('voltage (V)');
