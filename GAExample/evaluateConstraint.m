function[c, ceq] = evaluateConstraint(chromosome, settings)
%% CONSTRAINTFUNCTION computes the constraints. The input is an array x 
% containing the free variables. The outputs are the evaluated values of
% the inequality constraint c and equality constraint ceq. MMATLAB
% reference:https://www.mathworks.com/help/gads/gamultiobj.html#bvf79ug-nonlcon

%% chromosome Variables
x1 = chromosome(1);
x2 = chromosome(2);
x3 = chromosome(3);

%% Inequality constraints
    % c is an inequality constraint. You can specify this as a function of 
    % the variables in x. MATLAB checks if c <= 0; Designs with c > 0 
    % are discarded.
    % ceq is an equality constraint. You can specify this as a function of 
    % the variables in x. MATLAB checks if ceq = 0; 
    % Designs for which ceq is non-zero are discarded.


c1 = -x1*x2 ;
c2 = x1-x2;      % [mm]
c3 = -x3 - settings*0.001;

%% Compute the inequality and equality constraints 
% Set to a safe value <0;
c = [c1 c2 c3];
        
% Valid = 0 /invalid = 1
ceq = 0;

end