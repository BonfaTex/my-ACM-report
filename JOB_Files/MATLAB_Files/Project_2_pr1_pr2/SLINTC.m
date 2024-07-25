function result = SLINTC(x1, y1, x2, y2)
% Compute constants
ax = (x2-x1)/2;
ay = (y2-y1)/2;
sl = sqrt(ax^2 + ay^2);
% Compute the line integral
result = sl*(log(sl)-1)/pi;
end
