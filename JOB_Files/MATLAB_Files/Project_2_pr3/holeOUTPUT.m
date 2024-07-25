function holeOUTPUT(XM, YM, XIN, YIN, UB, UNB, UIN, N, IN, NL, NB)
fprintf('%s', repmat('*', 1, 69));
fprintf('\nRESULTS\n');
fprintf('%s', repmat('*', 1, 69));
fprintf('\n\nBOUNDARY NODES:');
fprintf('\n\nNODE        XM            YM            U                   U_n');
beg = 1;
for k=1:NB
    for i = beg:NL(k)
        if i<10
            fprintf('\n %d %14.5f%14.5f%16d%18.5f', i, XM(i), YM(i), UB(i), UNB(i));
        else
            fprintf('\n %d%14.5f%14.5f%16d%18.5f', i, XM(i), YM(i), UB(i), UNB(i));
        end
        if i==NL(k) && i~=NL(end)
            fprintf('\n');
            fprintf('%s', repmat('-', 1, 69));
        end
    end
    beg = NL(k)+1;
end
fprintf('\n\nINTERNAL POINTS:');
fprintf('\n\nPOINT        XIN           YIN           U');
for i = 1:IN
    if i<10
        fprintf('\n  %d %14.5f%14.5f%14.5f', i, XIN(i), YIN(i), UIN(i));
    else
        fprintf('\n  %d%14.5f%14.5f%14.5f', i, XIN(i), YIN(i), UIN(i));
    end
end
fprintf('\n\n');
end
