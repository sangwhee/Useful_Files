%% csvread Example

k=1;
fileName = ['C1_',num2str(k),'.csv'];       % the name of the csv file is C1_1.csv
vph = csvread(fileName,5,1);                % 6 means it should read from 7��
                                                            % 0 mean it reads from 1��

fileName = ['C2_',num2str(k),'.csv'];
iph = csvread(fileName,5,0);