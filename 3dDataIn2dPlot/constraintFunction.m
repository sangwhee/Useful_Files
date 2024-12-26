function[c, ceq] = constraintFunction(x)
%% CONSTRAINTFUNCTION computes the constraints. The input is an array x 
% containing the free variables. The outputs are the evaluated values of
% the inequality constraint c and equality constraint ceq. MMATLAB
% reference:https://www.mathworks.com/help/gads/gamultiobj.html#bvf79ug-nonlcon

    %% Assign variables
    w = x(1);
    h = x(2);
    d = x(3);

    
    %% Compute the inequality and equality constraints
    % c is an inequality constraint. You can specify this as a function of 
    % the variables in x. MATLAB checks if c <= 0; Designs with c > 0 
    % are discarded.
    % ceq is an equality constraint. You can specify this as a function of 
    % the variables in x. MATLAB checks if ceq = 0; 
    % Designs for which ceq is non-zero are discarded.
    
    c =-0.1; %Not used in this example, Set to a safe value <0;
    ceq = 0; % Not used in this example. Set to 0

end