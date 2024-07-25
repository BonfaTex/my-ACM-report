function result = DALPHA(x0, y0, x1, y1, x2, y2)
% Compute constants
dy1 = y1 - y0;
dx1 = x1 - x0;
dy2 = y2 - y0;
dx2 = x2 - x0;
dl1 = sqrt(dx1^2 + dy1^2);
cos1 = dx1/dl1;
sin1 = dy1/dl1;
dx2r = dx2*cos1 + dy2*sin1;
dy2r = -dx2*sin1 + dy2*cos1;
da = atan2(dy2r,dx2r);
% Compute the line integral
result = da/(2*pi);
end
