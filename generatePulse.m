function out = generatePulse(theta,D,V)

    logic1 = theta <= pi/2*D;
    logic2 = theta>(3/2*pi + pi/2*(1-D)) & (theta <= 2*pi);
    out = 1*(logic1 + logic2);

    logic1 = theta> pi/2*D & theta <=pi/2;
    logic2 = theta>3/2*pi & theta <= 3/2*pi + pi/2*(1-D);
    out = out + V*(logic1 + logic2);

    logic1 = theta>pi/2 & (theta <= pi/2 + pi/2*(1-D));
    logic2 = (theta>pi + pi/2*D) & theta <= 3/2*pi;
    out = out + (-V)*(logic1 + logic2);

    logic1 = (theta > pi/2 + pi/2*(1-D)) & theta <=pi;
    logic2 = theta>pi & (theta <= pi + pi/2*D);
    out = out + (-1)*(logic1 + logic2);

end