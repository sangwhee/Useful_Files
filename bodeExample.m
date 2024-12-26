%%
clc;clear; close all;

V_c = 100; D = 0.7; R = 100; L = 1e-3; C = 1e-3; I_L = V_c/R/(1-D);
f = logspace(-2,10,1e3);
s = 1j*2*pi*f; T = 1e-6;

% boost converter transfer function (conventional)
TF = ((-I_L*L*R)*s + R*V_c - D*R*V_c)./(C*L*R*s.^2 + L*s + R - 2*R*D + R*D^2);
phase = rad2deg(angle(TF));
phaseWrap = wrapTo360(phase) - 360;

figure(1); subplot(2,1,1);
semilogx(f,mag2db(abs(TF))); grid minor; hold on;
subplot(2,1,2);
semilogx(f,phaseWrap); grid minor; hold on; ylim([-360 10]); xlim([0,1e6]);

% from Ericson
G_d0 = V_c/(1-D);
omega_0 = (1-D)/sqrt(L*C);
Q = (1-D)*R*sqrt(C/L);
omega_z = (1-D)^2*R/L;
TF = G_d0*(1-s/omega_z)./(1 + s/Q/omega_0 + (s/omega_0).^2);
phase = rad2deg(angle(TF));
phaseWrap = wrapTo180(phase);

% 
s = tf('s');
TF = G_d0*(1-s/omega_z)/(1 + s/Q/omega_0 + (s/omega_0)^2);
figure(2);
bode(TF);
figure(3); pzplot(TF);
figure(4); step(TF);


