%%
clc;clear; close all;
x0 = 10; y0 = 10; width = 9; height = 6;
%%
figure(1)
% [         P_ind       P_CSI,cond   P_CSI,sw    P_cap      P_M,Cu      P_Eddy      P_Hys   ]
MTPA_R1 = [83.2879     84.7406      5.34        0.7927     77.5381     7.55        34.95];
minCond_R1 = [71.2635   76.0301      4.4189      0.7498     82.9174     7.99        37.45];
minIdc_R1 = [68.34      73.81        3.722       0.7519     94.1085     8.35        39.29];

x = categorical({'MTPA','MCL','MDCC'});
y = [MTPA_R1; minCond_R1; minIdc_R1];
bar(x,y,0.5,'stacked'); ylabel('CSI-fed IMD losses (W)','interpreter','latex')
set(gca,'FontName','Times New Roman','FontSize',10);
legend1 = legend('$P_{ind}$','$P_{CSI,cond}$','$P_{CSI,sw}$','$P_{cap}$','$P_{M,Cu}$','$P_{M,eddy}$','$P_{M,hys}$'); legend boxoff;
set(legend1,'Interpreter','latex');
set(gcf,'units','centimeters','position',[x0,y0,width,height])


%%
figure(2)
MTPA_2 = [328.21 234.86 3.84 2.085 372.72 7.43 37.07];
minCond_2 = [317.80 228.98 4.64 2.094 364.43 7.75 39.04];
minIdc_2 = [315.3024 227.5139 5.4507 2.1201 368.809 8.23 40.52];

x = categorical({'MTPA', 'MCL', 'MDCC'},'Ordinal',true);
x = reordercats(x,{'MTPA', 'MCL', 'MDCC'});
y = [MTPA_2; minCond_2; minIdc_2];
bar(x,y,0.5,'stacked');  ylabel('CSI-fed IMD losses (W)','interpreter','latex')
set(gca,'FontName','Times New Roman','FontSize',10);
legend1 = legend('$P_{ind}$','$P_{CSI,cond}$','$P_{CSI,sw}$','$P_{cap}$','$P_{M,Cu}$','$P_{M,eddy}$','$P_{M,hys}$'); legend boxoff;
set(legend1,'Interpreter','latex');
set(gcf,'units','centimeters','position',[x0,y0,width,height])


%%
figure(3)
MTPA_3 = [351.2585 261.5889 48.0632 8.7844 47.2507 34.12 74.74];
minCond_3 = [140.275 127.6471 34.6268 10.1882 150.8955 38.85 97.485];
minIdc_3 = [1.50 10.4 49.73 39.79 478.63 97.22 174.01];

x = categorical({'MTPA', 'MCL', 'MDCC'});
y = [MTPA_3; minCond_3; minIdc_3];
bar(x,y,0.5,'stacked');  ylabel('CSI-fed IMD losses (W)','interpreter','latex')
set(gca,'FontName','Times New Roman','FontSize',10);
legend1 = legend('$P_{ind}$','$P_{CSI,cond}$','$P_{CSI,sw}$','$P_{cap}$','$P_{M,Cu}$','$P_{M,eddy}$','$P_{M,hys}$'); legend boxoff;
set(legend1,'Interpreter','latex');
set(gcf,'units','centimeters','position',[x0,y0,width,height])

%%
figure(4)
MTPA_4 = [420.6127 302.9812 51.993 8.1258 309.526 31.89 77.14];
minCond_4 = [250.8396 197.8243 45.8121 8.9621 397.3921 38.85 94.15];
minIdc_4 = [169.5 147.5 32.0356 11.349 779.0984 47.37 116.27];

x = categorical({'MTPA', 'MCL', 'MDCC'});
y = [MTPA_4; minCond_4; minIdc_4];
bar(x,y,0.5,'stacked');  ylabel('CSI-fed IMD losses (W)','interpreter','latex')
set(gca,'FontName','Times New Roman','FontSize',10);
legend1 = legend('$P_{ind}$','$P_{CSI,cond}$','$P_{CSI,sw}$','$P_{cap}$','$P_{M,Cu}$','$P_{M,eddy}$','$P_{M,hys}$'); legend boxoff;
set(legend1,'Interpreter','latex');
set(gcf,'units','centimeters','position',[x0,y0,width,height])