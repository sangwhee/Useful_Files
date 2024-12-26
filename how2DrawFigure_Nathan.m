clc;clear;close all;
addpath 'C:\Users\lee884\Documents\MATLAB\Examples'
x = linspace(-pi,pi,1e2);
y = linspace(-pi,pi,1e2);
M = 1;
w_inches = 3; h_inches = 2.5;


carrier = abs(2/pi*x) - 1;
referenceSignal  = M*cos(y);

fig1 = figure(1);
t = tiledlayout(1,1,'TileSpacing','compact','Padding','compact');
nexttile; plot(x,carrier); grid minor;

xlabel('carrier angle $x$ (rad)', 'Interpreter','latex')
ylabel('reference signal angle $y$ (rad)','Interpreter', 'latex')
set(gca,'FontName','Times New Roman','FontSize',10);

save_fig(fig1, 'testPlot','pdf', w_inches, h_inches)