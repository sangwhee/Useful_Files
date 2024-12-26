%% Power Factor Calculator
clc; clear; close all
%% Settings
option = 1; % 0: Small CSI
            % 1: Bread board (Bench top CSI with film cap)
            % 2: Final DoE CSI with ceramic cap 
            
%% RL load case
Rs = 20; % per phase
Ls = 1.7e-3; % 240e-6;  340e-6;
% Ls = 340e-6; % 240e-6;  340e-6;
fe = 700;
We = 2*pi*fe;

switch option
    case 0
        % small CSI
        Cs = 2.5e-6; % small CSI
    case 1
        % Bread board CSI
        Cs = 22.5e-6; % Bread board CSI
    otherwise
        % DoE integrated CSI
        Cs = 8e-6; % DoE CSI
end


%% open loop control setting
m = 0.4; Idc_Ref = 1;
i_dqke = (0 + 1j*Idc_Ref)*m;

%%
i_dqse = i_dqke/(1+1j*We*Cs*(Rs+1j*We*Ls));
Idse = real(i_dqse);
Iqse = imag(i_dqse);
v_dqse = (Rs+1j*We*Ls)*i_dqse;
i_dqce = i_dqke - i_dqse;
V_LL = abs(v_dqse)*sqrt(3)
PF_CSI = cosd(rad2deg(angle(v_dqse) - angle(i_dqke)));
PF_CSI_angle = rad2deg(angle(v_dqse) - angle(i_dqke))
