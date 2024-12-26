%% interplolate 3D data

voltage = [100 200 400];
current = [10 50 70 80];

% lets make z axis data... but! this can be replaced with real measurements
[V,I] = meshgrid(voltage,current);
P = V.*I;

%% Interpolate

% set up v and i under consideration
vq = 153.3;
iq = 32.9;

% use interp2 to get P(vq,iq)
interplated_P = interp2(V,I,P,vq,iq)
surf(V,I,P); hold on; grid on; grid minor;
plot3(vq,iq,interplated_P,'g.','markerSize',20);