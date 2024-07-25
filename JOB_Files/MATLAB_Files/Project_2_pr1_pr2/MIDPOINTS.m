function [XM, YM] = MIDPOINTS(XL, YL, N)
xl = [XL; XL(1)];
yl = [YL; YL(1)];
XM = zeros(N,1);
YM = zeros(N,1);
for i = 1:N
    XM(i) = (xl(i)+xl(i+1))/2;
    YM(i) = (yl(i)+yl(i+1))/2;
end
end