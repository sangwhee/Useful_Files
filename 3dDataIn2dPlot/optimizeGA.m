clear all;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following web pages may be useful references:
% https://www.mathworks.com/help/gads/gamultiobj-algorithm.html
% https://www.mathworks.com/help/gads/gamultiobj.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is a simple example to demonstrate the functionality of the
% multiobjective genetic algorithm command gamultiobj( )in MATLAB's
% optimization toolbox. In this example, we will optimizing a cuboid. The
% dimensions of the cuboid (all in units of [mm]) namely, width (w), 
% height (h) and depth (d) are the free variables that will be swept in the 
% given range. The objectives are: O_1: Minimize the volume; 
% O_2: Maximize the Total surface area.
% Each candidate design is evaluated and the objectives are computed in the 
% function evaluateChromosome.m. Constraints if any, can be set in 
% constraintFunction.m  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Define variables
numVariables = 3; % Number of free variables

% variables: [w, h, d] (width, height, depth all in units of[mm])
boundsLo = [0.5, 0.1, 0.25]; % Lower bounds [mm]
boundsHi = [10, 3, 5];% Upper Bounds [mm]

%% Define the constraint/s
A =[]; % Linear inequality constraints (We are not using it for this problem)
b =[]; % Linear inequality constraints (We are not using it for this problem)
Aeq = []; % Linear equality constraints (We are not using it for this problem)
beq = []; % Linear equality constraints (We are not using it for this problem)

%% Set the number of Objectives and the function that evaluates the objectives
numObj =2; %Number of objectives
evalObjectives = @evaluateDesign;% This will be the MATLAB function that evaluates each generation
constraint = @constraintFunction;% This will be the MATLAB function that evaluates constraints

%% Set the optimization options
generations = 5; % Set the number of generations
population = 30; % Set the population size (This is the number of individuals per generation)
options = optimoptions(@gamultiobj,'PlotFcn',@gaplotpareto, 'MaxGenerations',generations, 'PopulationSize',...
                       population,'UseParallel',1);

%% Run the optimization
[x56,Fval,exitFlag,Output,population,scores] = gamultiobj(evalObjectives,numVariables,A, ...
    b,Aeq,beq,boundsLo,boundsHi,constraint,options);

%% Plot the the final generation population
close all;
dotsize = 15;
plot_size = [0.25 2.5 2.3 1.75]; %You can change this to vary the plot size
figure(1)
scatter([scores(:,1)], [scores(:,2)],dotsize,'filled')
xlabel('$O_1$: Volume [mm$^3$]', 'Interpreter','latex','FontSize',6,...
            'FontName','TimesNewRoman');
ylabel('$O_2$: -1 $\times$ Total Surface Area [mm$^2$]', 'Interpreter','latex','FontSize',6,...
            'FontName','TimesNewRoman');
set(gca,'FontName','TimesNewRoman','FontSize',6, 'color', 'none');
set(gcf, 'PaperPositionMode', 'manual', 'PaperUnits', 'inches', 'PaperPosition', plot_size);
print('-dsvg','-noui','finalPopulation'); 

%% Plot only the pareto front from the final generation
dotsize = 15;
plot_size = [0.25 2.5 2.3 1.75]; %You can change this to vary the plot size
figure(2)
scatter([Fval(:,1)], [Fval(:,2)],dotsize,'filled')
xlabel('$O_1$: Volume [mm$^3$]', 'Interpreter','latex','FontSize',8,...
            'FontName','TimesNewRoman');
ylabel('$O_2$: -1 $\times$ Total Surface Area [mm$^2$]', 'Interpreter','latex','FontSize',8,...
            'FontName','TimesNewRoman');
set(gca,'FontName','TimesNewRoman','FontSize',8, 'color', 'none');
set(gcf, 'PaperPositionMode', 'manual', 'PaperUnits', 'inches', 'PaperPosition', plot_size);
print('-dsvg','-noui','paretoFront'); 