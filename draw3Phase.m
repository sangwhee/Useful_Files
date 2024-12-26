%%
clc; clear; close all;

theta = linspace(-pi/6,2*pi-pi/6,1e2); % section I
phi =  1*pi/6; m =1/sqrt(3);
i_ak = cos(theta); i_bk = cos(theta - 2*pi/3); i_ck = cos(theta - 4*pi/3);
v_as = cos(theta + phi); v_bs = cos(theta - 2*pi/3 + phi); v_cs = cos(theta - 4*pi/3 + phi);

% Vxs voltages
fig1 = figure(1);
subplot(2,1,1);
plot(theta,(v_as),'linewidth',1.5); hold on;
plot(theta,(v_bs),'linewidth',1.5); 
plot(theta,(v_cs),'linewidth',1.5); 

yline(0); grid minor; ylim([-2 2]); 
%xlim([-pi/6, 2*pi-pi/6]); xlim([-pi/6, pi/6])
xticks(-pi/6:pi/6:11*pi/6)                                         % 또 다른 방법
xticklabels({'-\pi/6','0','\pi/6','2\pi/6','3\pi/6','4\pi/6','5\pi/6','\pi','7\pi/6','8\pi/6','9\pi/6','10\pi/6','11\pi/6'});
set(gca,'FontName','Times New Roman','FontSize',10);
xline(-pi/6);xline(pi/6);xline(3*pi/6);xline(5*pi/6);xline(7*pi/6);xline(9*pi/6);xline(11*pi/6); grid on;
legend('$v_{as}$','$v_{bs}$','$v_{cs}$','Interpreter', 'latex'); legend boxoff;

% VLL voltages
subplot(2,1,2);
plot(theta, (v_as - v_bs),'linewidth',1.5); hold on;
plot(theta, (v_as - v_cs),'linewidth',1.5); 
plot(theta, (v_bs - v_cs),'linewidth',1.5,'color','b'); 
plot(theta, (v_cs - v_bs),'linewidth',1.5,'color','r'); 
plot(theta,theta./theta*3/2*m*cos(phi),'linewidth',1.5);

yline(0); grid minor; ylim([-2 2]); xlim([-pi/6, 2*pi-pi/6]);xlim([-pi/6, pi/6])
xline(pi/6);xline(pi/6+pi/3); xline(pi/6+2*pi/3); xline(pi/6+3*pi/3); xline(pi/6+4*pi/3);
ylabel('$v_{LL}$ (V)','interpreter','latex');
set(gca,'XTick',[-pi/6,0, pi/6,3*pi/6,5*pi/6,7*pi/6,9*pi/6,11*pi/6]) 
set(gca,'XTickLabel',{'-\pi/6','0','\pi/6','3\pi/6','5\pi/6','7\pi/6','9\pi/6','11\pi/6'}) % xlabel에서 내가 원하는 스케일로 
set(gca,'FontName','Times New Roman','FontSize',10);
set(gcf,'units','centimeters','position',[2,2,15,20])
legend('$v_{ab}$','$v_{ac}$','$v_{bc}$','Interpreter', 'latex'); legend boxoff;

figure(2)
i_ab = i_ak-i_bk;
i_bc = i_bk-i_ck;
i_ca = i_ck-i_ak;

i_bkNew = (i_bc - i_ab)/3;
i_akNew = i_ab +i_bk;
i_ckNew = -i_akNew - i_bkNew;

plot(theta,i_akNew,'linewidth',1.5);  hold on;
plot(theta,i_bkNew,'linewidth',1.5); 
plot(theta,i_ckNew,'linewidth',1.5); 
plot(theta,i_bk,'--','linewidth',1.5); 
