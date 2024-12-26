

clc; clear;close all;
s = tf('s');
sys = 1/(s + 1);
t = linspace(0,10,1e6);
u = (rand([1,length(t)])-0.5)*10;

[y, t] = lsim(sys,u,t);
plot(t,u); hold on; grid on;
plot(t,y)