function chromsomeEvaluationResult = evaluateFitness(chromosome, settings)

% EVALUATEDESIGN evaluates a design (candidate design) and computes
% the objectives. Any constraints/constants if needed, can be defined local to this
% function. FEA runs if any, will be performed here.

%% Getting the Free Variables from the GA
    % Get the dimensions for the free variables from the chromosome.
    % If these variables are determined, everything should be defermined
% Free Variables
x1 = chromosome(1);  % [mm]
x2 = chromosome(2);  % [mm]
x3 = chromosome(3);   % [mm]
x4 = chromosome(4);
x5 = chromosome(5);


%% Call evaluateDesign 

[c, ceq] = evaluateConstraint(chromosome, settings);
    if (ceq == 1)
        chromsomeEvaluationResult = [inf, inf, inf];
    elseif (c>=0)
        chromsomeEvaluationResult = [inf, inf, inf];
    else
        
    %% Compute Objectives. Maximize Efficiency/ Minimize Torque Ripple/ Minimize the Material Cost

    % O_1: Maximize Efficiency [W].
        O_1 = x1*x2;
    
    % O_2: Minimize Torque ripple 
    
        O_2 = x1*x3 + settings; 
        
    % O_3: haha
    
        O_3 = x3^x2 +x4*x5;
    
    % The algorithm always minimizes the objectives. However, as we want to 
    % maximize O_2, we should return -1*O_2;
  
    %% Return the volume and LSA.
        chromsomeEvaluationResult = [O_1, O_2, O_3];
    end
    
end