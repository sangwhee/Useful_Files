%%
clear; close all; clc;

addpath 'C:\Users\lee884\Desktop\Conferences\2020_ECCE\Myver\0_journal\experimental results\motor impedance measurement\impedance with ground cable and motor cable'

%%
windingType = 1; % 1: CW, 2: TW

%% CW Common-mode impedance
figure(1)
if windingType == 1
    % [f_CM,Zmag_CM,theta_CM] = getImpedanceData('CW-Zabcg.csv');
    [f_CM,Zmag_CM,theta_CM] = getImpedanceData('CW-ZABCG+GROUND+CABLE.CSV');
    % [f_CM,Zmag_CM,theta_CM] = getImpedanceData('CW-ZABCG+GROUND.CSV');
else
    % [f_CM,Zmag_CM,theta_CM] = getImpedanceData('TW-Zabcg.csv');
    [f_CM,Zmag_CM,theta_CM] = getImpedanceData('TW-ZABCG+GROUND+CABLE.CSV');
end
semilogx(f_CM,mag2db(Zmag_CM),'linewidth',2); hold on;

%%
% get C_C
index0 = find(f_CM>=1000, 1);
C_C = 1/(Zmag_CM(index0)*2*pi*f_CM(index0));
plot(f_CM(index0),mag2db(Zmag_CM(index0)),'k.','markerSize',10);

% find dip and peak 1
if windingType == 1 % CW winding
    indexTemp1 = find(f_CM>344747,1);
    indexTemp2 = find(f_CM>585464,1);
else % TW winding
    indexTemp1 = find(f_CM>341477,1);
    indexTemp2 = find(f_CM>855637,1);
end 

[minValue,minIndex] = min(Zmag_CM(indexTemp1:indexTemp2));
[maxValue,maxIndex] = max(Zmag_CM(indexTemp1:indexTemp2));

index_d1 = minIndex + indexTemp1 - 1;
index_p1 = maxIndex + indexTemp1 - 1;

f_d1 = f_CM(index_d1);
f_p1 = f_CM(index_p1);

plot(f_d1,mag2db(Zmag_CM(index_d1)),'m.','markerSize',10);
plot(f_p1,mag2db(Zmag_CM(index_p1)),'m.','markerSize',10);

% find dip 2
[minValue,minIndex] = min(Zmag_CM);

index_d2 = minIndex;

f_d2 = f_CM(index_d2);

plot(f_d2, mag2db(Zmag_CM(index_d2)),'g.','markerSize',10);

% get capacitance
C_C1 = (C_C)*(1-(f_d1/f_p1)^2);
C_C2 = C_C - C_C1;


% get inductance
L_C1 = 1/(2*pi*f_d1)^2/C_C1;
L_C2 = 1/(2*pi*f_d2)^2/C_C2;

% get resistance R
R_C1 = Zmag_CM(index_d1);
R_C2 = Zmag_CM(index_d2);

% get eddy current loss R
R_Ce1 = Zmag_CM(index_p1);


% Lets plot the obtained model
s = 1j*2*pi*f_CM;

%% fold equation
Z_CM_model_1stOrder_LC = ((C_C1.*C_C2.*L_C1.*L_C2.*R_C1 + C_C1.*C_C2.*L_C1.*L_C2.*R_C2 + C_C1.*C_C2.*L_C1.*L_C2.*R_Ce1).*s.^4 ...
    + (C_C1.*L_C1.*L_C2 + C_C2.*L_C1.*L_C2 + C_C1.*C_C2.*L_C1.*R_C1.*R_C2 ...
    + C_C1.*C_C2.*L_C1.*R_C2.*R_Ce1 + C_C1.*C_C2.*L_C2.*R_C1.*R_Ce1 + C_C1.*C_C2.*L_C2.*R_C2.*R_Ce1).*s.^3 ...
    + (C_C1.*L_C1.*R_C1 + C_C2.*L_C1.*R_C2 + C_C1.*L_C1.*R_Ce1 + C_C1.*L_C2.*R_Ce1 + C_C2.*L_C2.*R_Ce1 ...
    + C_C1.*C_C2.*R_C1.*R_C2.*R_Ce1).*s.^2 + (L_C1 + C_C1.*R_C1.*R_Ce1 + C_C2.*R_C2.*R_Ce1).*s + R_Ce1)./...
    ((C_C1.*C_C2.*L_C1.*R_C1 + C_C1.*C_C2.*L_C1.*R_C2 + C_C1.*C_C2.*L_C1.*R_Ce1).*s.^3 ...
    + (C_C1.*L_C1 + C_C2.*L_C1 + C_C1.*C_C2.*R_C1.*R_Ce1 + C_C1.*C_C2.*R_C2.*R_Ce1).*s.^2 ...
    + (C_C1.*R_Ce1 + C_C2.*R_Ce1).*s);
 

%% This is what we have analytically
figure(1)
semilogx(f_CM,mag2db(abs(Z_CM_model_1stOrder_LC)),'-','linewidth',1.0,'color',[0.8500    0.3250    0.0980]); hold on; xlim([150e3,30e6]);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indexTemp1 = find(f_CM>150e3);
indexTemp2 = find(f_CM>30e6);
f = f_CM(indexTemp1:indexTemp2);
Zmag_CM_dB = mag2db(Zmag_CM(indexTemp1:indexTemp2));
a=1;

%% Start optimization
if isfile('coeffNew1st.mat')
     % File exists.
     coeff = load('coeffNew1st.mat');
     coeff = coeff.coeffNew;
else
    % File does not exist.
    coeff = [C_C1 C_C2 L_C1 L_C2 R_C1 R_C2 R_Ce1];
end

x0 = ones(1,length(coeff));
A = []; b = []; Aeq = []; beq = []; 
lb = 0.01*ones(1,length(x0)); ub = 100*ones(1,length(x0));
costFunctionHandle = @(x)myfun1st(x,coeff,windingType);

[x,fval] = fmincon(costFunctionHandle,x0,A,b,Aeq,beq,lb,ub)
xTemp = x;

C_C1 = coeff(1)*x(1);
C_C2 = coeff(2)*x(2);

L_C1 = coeff(3)*x(3);
L_C2 = coeff(4)*x(4);

R_C1 = coeff(5)*x(5);
R_C2 = coeff(6)*x(6);

R_Ce1 = coeff(7)*x(7);

coeffNew1st = [C_C1 C_C2, L_C1 L_C2, R_C1 R_C2, R_Ce1];
save('coeffNew1st','coeffNew1st')
%% fold equation
Z_CM_model_1stOrder_LC = ((C_C1.*C_C2.*L_C1.*L_C2.*R_C1 + C_C1.*C_C2.*L_C1.*L_C2.*R_C2 + C_C1.*C_C2.*L_C1.*L_C2.*R_Ce1).*s.^4 ...
    + (C_C1.*L_C1.*L_C2 + C_C2.*L_C1.*L_C2 + C_C1.*C_C2.*L_C1.*R_C1.*R_C2 ...
    + C_C1.*C_C2.*L_C1.*R_C2.*R_Ce1 + C_C1.*C_C2.*L_C2.*R_C1.*R_Ce1 + C_C1.*C_C2.*L_C2.*R_C2.*R_Ce1).*s.^3 ...
    + (C_C1.*L_C1.*R_C1 + C_C2.*L_C1.*R_C2 + C_C1.*L_C1.*R_Ce1 + C_C1.*L_C2.*R_Ce1 + C_C2.*L_C2.*R_Ce1 ...
    + C_C1.*C_C2.*R_C1.*R_C2.*R_Ce1).*s.^2 + (L_C1 + C_C1.*R_C1.*R_Ce1 + C_C2.*R_C2.*R_Ce1).*s + R_Ce1)./...
    ((C_C1.*C_C2.*L_C1.*R_C1 + C_C1.*C_C2.*L_C1.*R_C2 + C_C1.*C_C2.*L_C1.*R_Ce1).*s.^3 ...
    + (C_C1.*L_C1 + C_C2.*L_C1 + C_C1.*C_C2.*R_C1.*R_Ce1 + C_C1.*C_C2.*R_C2.*R_Ce1).*s.^2 ...
    + (C_C1.*R_Ce1 + C_C2.*R_Ce1).*s);
%% This is the optimization result
figure(1)
semilogx(f_CM,mag2db(abs(Z_CM_model_1stOrder_LC)),'--','linewidth',1.0,'color',[0.9290    0.6940    0.1250]); hold on; xlim([150e3,30e6]);
a = 1;


