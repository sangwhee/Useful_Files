AniTest = figure('name','Animation Test','numbertitle','off');
x = [-3 -3.5  -4 -4 -3];
y = [1 1.5 1 -1 -1];
 
box = fill(x,y, 'r');
 grid on
 hold on
axis([-5 5 -5 5]);
 
t = 0:0.01:2*pi;
plot(3*cos(t), 3*sin(t))
plot(17^0.5*cos(t), 17^0.5*sin(t))
plot((3.5^2+1.5^2)^0.5*cos(t), (3.5^2+1.5^2)^0.5*sin(t), 'c')
 
for t = 0:0.01:4*pi
    updatedX = [10^0.5*cos(-(t+pi+atan(1/3))) (3.5^2+1.5^2)^0.5*cos(-(t+pi+atan(3/7))) 17^0.5*cos(-(t+pi+atan(1/4))) 17^0.5*cos(-(t+pi-atan(1/4))) 10^0.5*cos(-(t+pi-atan(1/3)))];
    updatedY = [10^0.5*sin(-(t+pi+atan(1/3))) (3.5^2+1.5^2)^0.5*sin(-(t+pi+atan(3/7))) 17^0.5*sin(-(t+pi+atan(1/4))) 17^0.5*sin(-(t+pi-atan(1/4))) 10^0.5*sin(-(t+pi-atan(1/3)))];
    set(box, 'Xdata', updatedX,'Ydata', updatedY);
    drawnow;
    
    for i=1:5000000
        temp = i;
    end
end