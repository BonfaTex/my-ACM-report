function G = Fortran_GMATR(XL, YL, XM, YM, N, NB, NL)
G = zeros(N,N);
for I = 1:N
    X0 = XM(I);
    Y0 = YM(I);
    
    for J = 1:N
        X1 = XL(J);
        Y1 = YL(J);
        X2 = XL(J+1);
        Y2 = YL(J+1);
        
        if NB <= 1
            goto60 = true;
        else
            if J ~= NL(1)
                goto50 = true;
            else
                X2 = XL(1);
                Y2 = YL(1);
                goto60 = true;
            end
        end
        
        if goto50
            for K = 2:NB
                if J ~= NL(K)
                    goto30 = true;
                else
                    X2 = XL(NL(K-1)+1);
                    Y2 = YL(NL(K-1)+1);
                    goto60 = true;
                end
            end
        end
        
        if goto30
            continue; % GOTO 30 in Fortran
        end
        
        if goto60
            if I ~= J
                RESULT = RLINTC(X0, Y0, X1, Y1, X2, Y2);
                G(I, J) = RESULT;
            elseif I == J
                RESULT = SLINTC(X1, Y1, X2, Y2);
                G(I, J) = RESULT;
            end
        end
    end
end

end


                