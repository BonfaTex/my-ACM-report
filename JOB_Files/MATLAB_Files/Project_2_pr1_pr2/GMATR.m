function G = GMATR(XL, YL, XM, YM, N)
G = zeros(N,N);
for i = 1:N
    for j = 1:N
        if i ~= j % off-diagonal elements of G
            if j==N
                G(i,j) = RLINTC(XM(i),YM(i),XL(j),YL(j),XL(1),YL(1));
            else
                G(i,j) = RLINTC(XM(i),YM(i),XL(j),YL(j),XL(j+1),YL(j+1));
            end
        elseif i == j % diagonal elements of G
            if j==N
                G(i,j) = SLINTC(XL(j),YL(j),XL(1),YL(1));
            else
                G(i,j) = SLINTC(XL(j),YL(j),XL(j+1),YL(j+1));
            end
        end
    end
end
end