function f = LARASolve(x)

%% nonlinearEquations
Jm = 0.006; JL = 0.002; br = 0.005; Kr = 500; Kra = 0;
%% MA
t1 = 2*pi*1;
t2 = 2*pi*10;
t3 = 2*pi*100;
t4 = x(1);
t5 = x(1);
KLisa = x(2);
KLsa = x(3);
bLa = x(4);
bra = x(5);

%% System of Nonlinear Equations
f(1) = ((JL+Jm)*br+JL*bra)/(JL*Jm) - (t1+t2+t3+t4+t5);
f(2) = ((Jm+JL)*Kr+JL*Kra+br*bLa)/(JL*Jm) - (t1*t2+t1*t3+t1*t4+t1*t5+t2*t3+t2*t4+t2*t5+t3*t4+t3*t5+t4*t5);
f(3) = (Kr*bLa+br*KLsa)/(JL*Jm) - (t1*t2*t3+t1*t2*t4+t1*t2*t5+t1*t3*t4+t1*t3*t5+t1*t4*t5+t2*t3*t4+t2*t3*t5+t2*t4*t5+t3*t4*t5);
f(4) = (Kr*KLsa+br*KLisa)/(JL*Jm) - (t1*t2*t3*t4+t1*t2*t3*t5+t1*t2*t4*t5+t1*t3*t4*t5+t2*t3*t4*t5);
f(5) = (Kr*KLisa)/(JL*Jm) - (t1*t2*t3*t4*t5);

end