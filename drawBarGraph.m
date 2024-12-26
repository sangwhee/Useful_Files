%%
close all; clc; clear;
cases = categorical({'case1','case2','case3','case4','case5','case6'});
cases = reordercats(cases,{'case1','case2','case3','case4','case5','case6'});
eff = [82.87 83.04; 89.99 91.02; 93.37 95.62; 90.40 95.94; 86.99 89.35; 94.10 97.37];
b = bar(cases,eff);

% put data numbers on top of the bar graph
xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(round(b(1).YData,1));
text(xtips1,ytips1,labels1,'HorizontalAlignment','center', 'VerticalAlignment','bottom')
xtips2 = b(2).XEndPoints;
ytips2 = b(2).YEndPoints;
labels2 = string(round(b(2).YData,1));
text(xtips2,ytips2,labels2,'HorizontalAlignment','center','VerticalAlignment','bottom')

ylim([80 100]); grid minor;
ylabel('efficiency (%)');
set(gcf,'units','centimeters','position',[2,2,18,7])
legend1 = legend('conventional CSM1A','proposed ASZM');set(legend1,'Interpreter','latex')
set(gca,'FontName','Times New Roman','FontSize',10);legend boxoff;