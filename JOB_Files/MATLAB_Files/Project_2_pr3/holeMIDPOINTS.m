function [XM, YM] = holeMIDPOINTS(XL, YL, NB, NL)
XM = zeros(NL(end),1);
YM = zeros(NL(end),1);
beg = 1;
for i = 1:NB
    for j = beg:NL(i)
        if j==NL(i)
            XM(j) = (XL(j)+XL(beg))/2;
            YM(j) = (YL(j)+YL(beg))/2;
        else
            XM(j) = (XL(j)+XL(j+1))/2;
            YM(j) = (YL(j)+YL(j+1))/2;
        end
    end
    beg = NL(i)+1;
end
end