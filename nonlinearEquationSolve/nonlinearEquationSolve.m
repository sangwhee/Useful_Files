%% LARA
x0 = [183 200 37 1 6];
x0 = [0 0 0 0 0];
options = optimoptions('fsolve','MaxFunctionEvaluations',1e5,'MaxIterations',1e5);
xLARA = fsolve(@LARASolve,x0,options); % [183.7 200.8 37.7 0.9565 6.385] = [eig1, KLida, KLsa,bLa,bra] 

% FRF Td/thetaL
KLisa = xLARA(2);
KLsa = xLARA(3);
bLa = xLARA(4);
bra = xLARA(5);