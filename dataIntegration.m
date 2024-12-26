%% Integrating data points

time = [0 0.1 0.2 0.3 0.4];
data = [1 1 1 1 1 1];

% 직관적으로 시간 벡터를 넣어주면 된다.
integralData = cumtrapz(time,data); 

% 만약 시간이 등간격이라면 그냥 간격을 넣어줘도 된다.
integralData = cumtrapz(0.1,data);