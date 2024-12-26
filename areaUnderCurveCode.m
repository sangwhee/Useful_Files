% Creates a figure showing the area under the curve
% y = (x - 3)^2 + 5 between 1 and 4.

clear

y1 = @(x)(x - 3).^2 + 5;
xx = 0 : 0.01 : 5;
yy = y1(xx);
xx_top = 1 : 0.01 : 4;
xx_bottom = [4 1];
yy_top = y1(xx_top);
yy_bottom = xx_bottom*0;
clf
hold on
plot(xx, yy, 'k')
fill([xx_top, xx_bottom], [yy_top, yy_bottom], 'c')
text(0.6, 12, 'y = (x-3)^2 + 5')
text(1.75, 3, 'Find area of this region')
hold off