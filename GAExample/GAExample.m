%% GA Example Code

clear all;
close all;
clc;

%% Define optimization knob variables that will be defined by the built in GA 
numVariables = 5; % ����ȭ ������ ������ �� ���� �ǹ�
% [a, b, c],    [mm, mm, mm, mm, mm, deg]
lowerBound = [1, 3, 20, 4, 0]; % Lower bounds 
upperBound = [5, 4, 30, 5, 1];    % Upper Bounds 

%% Define the constraint
A =[]; % Linear inequality constraints (We are not using it for this problem)
b =[]; % Linear inequality constraints (We are not using it for this problem)
Aeq = []; % Linear equality constraints (We are not using it for this problem)
beq = []; % Linear equality constraints (We are not using it for this problem)

%% Set the number of Objectives and the function that evaluates the objectives
settings = 1;
numObj = 3; % Number of objectives, minimize the losses, torque ripple, active material cost
evaluateObjectiveFtHandle = @(chromosome)evaluateFitness(chromosome, settings); % GA�� �����ִ� chromosome�� 
evaluateConstraintFtHandle = @(chromosome)evaluateConstraint(chromosome, settings); % This will be the MATLAB function that evaluates constraints

%% Set the optimization options
numGenerations = 3; % Set the number of generations
numPopulation = 50; % Set the population size (This is the number of individuals per generation)
% gamultiobj: 
% gaplotpareto: 
% https://www.mathworks.com/help/gads/gamultiobj.html#bvf79ug-options

% �������� ����� ����� �޾Ƽ� ���� ����ȭ�� ����ϵ��� �ϴ� �Լ�
if isfile('lastGenChromosomeMatrix.mat')
     % File exists.
     load('lastGenChromosomeMatrix.mat');
     options = optimoptions(@gamultiobj,'PlotFcn',@gaplotpareto, 'MaxGenerations',numGenerations, 'PopulationSize',...
                       numPopulation, 'UseParallel',1, 'InitialPopulationMatrix', lastGenChromosome);         % UseParallel : ���� ��ǻ���� �̿��ϰ� ����
                   % gaplotpareto�� �ķ��� ����Ʈ�� ��Ÿ���� �Լ��� �����ش�.
                   
else
     % File does not exist.
     options = optimoptions(@gamultiobj,'PlotFcn',@gaplotpareto, 'MaxGenerations',numGenerations, 'PopulationSize',...
                       numPopulation, 'UseParallel',1);         % UseParallel : ���� ��ǻ���� �̿��ϰ� ����
                   % gaplotpareto�� �ķ��� ����Ʈ�� ��Ÿ���� �Լ��� �����ش�.
end  


%% Run the optimization
[paretoChromosome,partoChromosomeObj,exitFlag,Output,lastGenChromosome,lastGenObj] = gamultiobj(evaluateObjectiveFtHandle,numVariables,A, ...
    b,Aeq,beq,lowerBound,upperBound,evaluateConstraintFtHandle,options);
% paretoChromosome�� �ķ��� ����Ʈ�� [Bd A delta r Wm] �� ���⿡ ����
% partoChromosomeObj �ش� �ķ��� ����Ʈ�� Objective fuctnion�� ��ġ�� Fval�� ����ִ�
% Output structure
% lastGenChromosome: �̹� ���ʷ��̼��� ��� variable ���� ����
% lastGenObj�� ���� ���ʷ��̼��� Objective function ���� �����ش�,
% evalObjectives�� evaluateDesign�� �޾ƿ´�

lastGenChromosome;
save('lastGenChromosomeMatrix','lastGenChromosome')

%% Plot the the final generation population
% 12-a)
close all;
dotsize = 15;
plot_size = [0.25 2.5 2.3 1.75]; %You can change this to vary the plot size
figure(1)   % final generation of the final 
%scatter3([Fval(:,1)], [Fval(:,2)],[Fval(:,3)],dotsize,'filled')
% O1: O_1: Maximize Efficiency [W].
% O2: Minimize Torque ripple 
% O3: Minimize active material cost
scatter3(lastGenObj(:,1), lastGenObj(:,2)*100,lastGenObj(:,3),dotsize,'filled')
xlabel('$O_1$: Efficiency [\%]', 'Interpreter','latex')
ylabel('$O_2$: Torque Ripple [\%]', 'Interpreter','latex');
zlabel('$O_3$: Cost [\$]', 'Interpreter','latex');
title('Final Generation Evaluation Result')
set(gca,'FontName','Times New Roman','FontSize',12, 'color', 'none');
set(gcf, 'PaperPositionMode', 'manual', 'PaperUnits', 'inches', 'PaperPosition', plot_size);

print('-dsvg','-noui','finalPopulation'); 

%% Plot only the pareto front from the final generation
% 12-b)
dotsize = 15;
plot_size = [0.25 2.5 2.3 1.75]; %You can change this to vary the plot size
figure(2)       % only the 
scatter3(partoChromosomeObj(:,1), partoChromosomeObj(:,2)*100, partoChromosomeObj(:,3),dotsize,'filled')
xlabel('$O_1$: Efficiency [\%]', 'Interpreter','latex')
ylabel('$O_2$: Torque Ripple [\%]', 'Interpreter','latex');
zlabel('$O_3$: Cost [\$]', 'Interpreter','latex');
title('Patreto Front')
set(gca,'FontName','TimesNewRoman','FontSize',12, 'color', 'none');
set(gcf, 'PaperPositionMode', 'manual', 'PaperUnits', 'inches', 'PaperPosition', plot_size);
print('-dsvg','-noui','paretoFront'); 
