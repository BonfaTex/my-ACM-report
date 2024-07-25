function OUTPUT(XM, YM, XIN, YIN, UB, UNB, UIN, N, IN)
fprintf('%s', repmat('*', 1, 69));
fprintf('\nRESULTS\n');
fprintf('%s', repmat('*', 1, 69));
fprintf('\n\nBOUNDARY NODES:');
fprintf('\n\nNODE        XM            YM            U             U_n');
for i = 1:N
    if i<10
        fprintf('\n %d %14.5f%14.5f%14.5f%14.5f', i, XM(i), YM(i), UB(i), UNB(i));
    else
        fprintf('\n %d%14.5f%14.5f%14.5f%14.5f', i, XM(i), YM(i), UB(i), UNB(i));
    end
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
