function H = Fortran_HMATR(XL, YL, XM, YM, N, NB, NL)
H = zeros(N,N);
for i = 1:N
    x0 = XM(i); y0 = YM(i);
    for j = 1:N
        x1 = XL(j); y1 = YL(j);
        x2 = XL(j+1); y2 = YL(j+1);
        if NB==1
            if i~=j
                H(i,j) = DALPHA(x0,y0,x1,y1,x2,y2);
            else
                H(i,j) = -0.5;
            end
        else
            if j~=NL(1)
                for k = 2:NB
                    if j==NL(k)
                        x2 = XL(NL(k-1)+1); y2 = YL(NL(k-1)+1);
                        if i~=j
                            H(i,j) = DALPHA(x0,y0,x1,y1,x2,y2);
                        else
                            H(i,j) = -0.5;
                        end
                    else
                        x2 = XL(1); y2 = YL(1);
                        if i~=j
                            H(i,j) = DALPHA(x0,y0,x1,y1,x2,y2);
                        else
                            H(i,j) = -0.5;
                        end
                    end
                end
            end
        end
    end
end
end


                