clc;clear; close all;

x = [0 1];

% I dont like this one very much
colorSet1 = {[141, 211, 199];[ 255, 237, 111];[ 190, 186, 218];[ 251, 128, 114];[ 128, 177, 211];[ 253, 180, 98];[ 179, 222, 105];[ 188, 128, 189];[ 217, 217, 217];[ 204, 235, 197];[ 252, 205, 229];[ 255, 255, 179]};

% This shows pretty strong contrast
colorSet2 = {[228, 26, 28];[55, 126, 184]; [77, 175, 74];[ 255, 127, 0];[ 255, 237, 111]*.85;[ 166, 86, 40];[ 247, 129, 191];[ 153, 153, 153];[ 152, 78, 163]};

% I like this combination the most
colorSet3 = {[55, 126, 184];[228, 26, 28];[77, 175, 74];[255, 127, 0];[152, 78, 163]}; % good
                % blue
                
% some colors from princeton
red = [217,102,101]; blue = [105, 161, 203]; green = [152 180 134];
                
% I like this combination as well
colorSet3 = {[40, 53, 147];[0, 105, 92];[104, 159, 56];[251, 140, 0];[255, 204, 128]}; % good
                %dark blue  % dark green  %light green  % orange %light
                %orange
              
                
% This is colorbind friendly
colorSet4 = {[215,25,28];[253,174,97];[171,217,233];[44,123,182]}; % color bind friendly (gradually change)
                                                        % blue

for a = 1:30
    figure(1)
y =a*x;
plot(x,y,'linewidth',2,'Color',colorSet4{a}/255); grid minor; hold on
end