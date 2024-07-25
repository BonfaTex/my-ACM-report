function UIN = holeUINTER(XL, YL, XIN, YIN, UB, UNB, N, IN, NL, NB)
UIN = zeros(IN, 1);
for k = 1:IN
    for j = 1:N
        if NB == 1
            resh = DALPHA(XIN(k), YIN(k), XL(j), YL(j), XL(j+1), YL(j+1));
            resg = RLINTC(XIN(k), YIN(k), XL(j), YL(j), XL(j+1), YL(j+1));
            UIN(k) = UIN(k) + resh*UB(j) - resg*UNB(j);
        else
            if j == NL(1)
                resh = DALPHA(XIN(k), YIN(k), XL(j), YL(j), XL(1), YL(1));
                resg = RLINTC(XIN(k), YIN(k), XL(j), YL(j), XL(1), YL(1));
                UIN(k) = UIN(k) + resh*UB(j) - resg*UNB(j);
            else
                for kk = 2:NB
                    if j == NL(kk)
                        resh = DALPHA(XIN(k), YIN(k), XL(j), YL(j), XL( NL(kk-1)+1  ), YL( NL(kk-1)+1 ));
                        resg = RLINTC(XIN(k), YIN(k), XL(j), YL(j),  XL( NL(kk-1)+1  ), YL( NL(kk-1)+1 ));
                        UIN(k) = UIN(k) + resh*UB(j) - resg*UNB(j);
                    else
                        resh = DALPHA(XIN(k), YIN(k), XL(j), YL(j), XL(j+1), YL(j+1));
                        resg = RLINTC(XIN(k), YIN(k), XL(j), YL(j), XL(j+1), YL(j+1));
                        UIN(k) = UIN(k) + resh*UB(j) - resg*UNB(j);
                    end
                end
            end
        end

    end
end
end
