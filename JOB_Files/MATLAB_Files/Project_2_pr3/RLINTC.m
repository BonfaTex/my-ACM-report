function result = RLINTC(x0, y0, x1, y1, x2, y2)
% Define Gauss integration points and weights
xi = [-0.86113631,-0.33998104,0.33998104,0.86113631];
wg = [0.34785485,0.65214515,0.65214515,0.34785485];
xc = zeros(4,1);
yc = zeros(4,1);
% Compute constants
ax = (x2-x1)/2;
ay = (y2-y1)/2;
bx = (x2+x1)/2;
by = (y2+y1)/2;
% Compute the line integral
result = 0;
for i = 1:4
    xc(i) = ax*xi(i) + bx;
    yc(i) = ay*xi(i) + by;
    ra = sqrt((xc(i)-x0)^2 + (yc(i)-y0)^2);
    result = result + log(ra)*wg(i);
end
sl = 2*sqrt(ax^2 + ay^2);
result = result*sl/(4*pi);
end
