%% example scatteredInterpolant
% result of 'scatteredInterpolant' defines z = f(x,y) 
% where the best guesses of z will be provided based on data provided to define f
% this function also allows for extrapolation
clc; clear; close all;
x = 0:10;
y = [1 5 6 8 3 2 5 0 2 4 7];
z = [39 10 11 45 32 23 99 15 31 77 63];
x = x'; y = y'; z = z';

scatter3(x,y,z); hold on;

% define z = f(x,y) using sampled x,y,z data
function_x_y_to_z = scatteredInterpolant(x,y,z);

% define new set of x and y to evaluate the function z = f(x,y)
x_new = -5:5;
y_new = [10 2 4 4 8 0 9 3 5 7 8];
x_new = x_new'; y_new = y_new';

z_new = function_x_y_to_z(x_new,y_new);
scatter3(x_new,y_new,z_new)