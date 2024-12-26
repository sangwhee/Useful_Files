function evaluatedChrom = evaluateDesign(parameter)
% EVALUATEDESIGN evaluates a design (candidate design) and computes
% the objectives. Any constraints/constants if needed, can be defined local to this
% function. FEA runs if any, will be performed here.

%% Initialization
    % Get the dimensions from the chromosome.
    w = parameter(1);
    h = parameter(2);
    d = parameter(3);
   
%% Compute Objectives.

% O_1: Volume [mm^3].
    O_1 = w*h*d;
    
% O_2: Total surface area (TSA) [mm^2]
    O_2 = 2*(w*h + h*d + d*w); 

% The algorithm always minimizes the objectives. However, as we want to 
% maximize O_2, we should return -1*O_2;
  
%% Return the volume and LSA.
    evaluatedChrom = [O_1, -1*O_2];
    
end