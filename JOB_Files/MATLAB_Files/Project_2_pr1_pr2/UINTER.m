function UIN = UINTER(XL, YL, XIN, YIN, UB, UNB, N, IN)
UIN = zeros(IN, 1);
for k = 1:IN
    for j = 1:N
        if j==N
            resh = DALPHA(XIN(k), YIN(k), XL(j), YL(j), XL(1), YL(1));
            resg = RLINTC(XIN(k), YIN(k), XL(j), YL(j), XL(1), YL(1));
        else
            resh = DALPHA(XIN(k), YIN(k), XL(j), YL(j), XL(j+1), YL(j+1));
            resg = RLINTC(XIN(k), YIN(k), XL(j), YL(j), XL(j+1), YL(j+1));
        end
        UIN(k) = UIN(k) + resh*UB(j) - resg*UNB(j);
    end
end
end
