%% Integrating data points

time = [0 0.1 0.2 0.3 0.4];
data = [1 1 1 1 1 1];

% ���������� �ð� ���͸� �־��ָ� �ȴ�.
integralData = cumtrapz(time,data); 

% ���� �ð��� ����̶�� �׳� ������ �־��൵ �ȴ�.
integralData = cumtrapz(0.1,data);