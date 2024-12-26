clear all;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This script is a plot template. It loads an optimization result from
% optResult.mat and does the following: 1) Plots a 3D scatter of the
% population from the final generation with each of the objectives as the 3
% axes. 2) Plots a 2D version of the same plot, projected onto one of the planes
% and color indicating the third objective.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('optResult.mat')


% Make 3D plot
figure()
dotsize = 10; %Size of each dot in the scatter
plot_size = [0.25 2.5 2.3 1.75]; %Dimensions of the plot (You can modify this)
scatter3(scores(:,1),scores(:,2),scores(:,3),'filled'); %create the scatter
xlabel('$O_1$: Volume [mm$^3$]', 'Interpreter','latex','FontSize',8,...
            'FontName','TimesNewRoman');
ylabel('$O_2$: -1 $\times$ Total Surface Area [mm$^2$]', 'Interpreter','latex','FontSize',8,...
            'FontName','TimesNewRoman');
zlabel('$O_3$: Lateral Surface Area [mm$^2$]', 'Interpreter','latex','FontSize',8,...
            'FontName','TimesNewRoman');
set(gca,'FontName','TimesNewRoman','FontSize',8, 'color', 'none');
set(gcf, 'PaperPositionMode', 'manual', 'PaperUnits', 'inches', 'PaperPosition', plot_size);
print('-dsvg','-noui','3Dpareto'); %Save as SVG

% Make 3D plot, projected on one surface
figure()
dotsize = 10;
plot_size = [0.25 2.5 2.3 1.75]; %Dimensions of the plot (You can modify this)
scatter([scores(:,1)], [scores(:,2)],dotsize,[scores(:,3)] , 'filled')
h = colorbar;
set(get(h,'title'),'string','$O_3$: LSA [mm$^2$]','Rotation',270.0,'Position',[40 120],'FontWeight','normal',...
'Interpreter','latex','FontSize',8,'FontName','TimesNewRoman');
xlabel('$O_1$: Volume [mm$^3$]', 'Interpreter','latex','FontSize',8,...
            'FontName','TimesNewRoman');
ylabel('$O_2$: -1 $\times$ Total Surface Area [mm$^2$]', 'Interpreter','latex','FontSize',8,...
            'FontName','TimesNewRoman');
set(gca,'FontName','TimesNewRoman','FontSize',8, 'color', 'none');
set(gcf, 'PaperPositionMode', 'manual', 'PaperUnits', 'inches', 'PaperPosition', plot_size);
print('-dsvg','-noui','projected3DPareto'); %Save as SVG
