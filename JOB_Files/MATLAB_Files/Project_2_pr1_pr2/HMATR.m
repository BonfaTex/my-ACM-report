function H = HMATR(XL, YL, XM, YM, N)
H = zeros(N,N);
for i = 1:N
    for j = 1:N
        if i ~= j % off-diagonal elements of H
            if j==N
                H(i,j) = DALPHA(XM(i),YM(i),XL(j),YL(j),XL(1),YL(1));
            else
                H(i,j) = DALPHA(XM(i),YM(i),XL(j),YL(j),XL(j+1),YL(j+1));
            end
        elseif i == j % diagonal elements of H
            H(i,j) = -0.5;
        end
    end
end
end