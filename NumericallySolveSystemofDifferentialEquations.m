%% Numerical soultion of system of differential equation

% https://www3.nd.edu/~nancy/Math20750/Demos/3dplots/dim3system.html

% x' = -x +3z
% y' = -y +2z
% z' = x^2 -2z;

% Let x = [x;y,z]= [x(1); x(2), x(3)];
%1.  Form a system of equation while x = [x;y;z]
f = @(t,x) [-x(1)+3*x(3);-x(2)+2*x(3);x(1)^2-2*x(3)];
%2. numerical soultion
tspan = [0,1.5];          % time span
initialCondition = [0, 0.5, 3];
[t, xa] = ode45(f, tspan, initialCondition);

% 3. plot
figure(1)
plot(t,xa(:,1)); % x plot
figure(2)
plot(xa(:,1),xa(:,2)); % x-y plot
figure(3)
plot3(xa(:,1), xa(:,2), xa(:,3))