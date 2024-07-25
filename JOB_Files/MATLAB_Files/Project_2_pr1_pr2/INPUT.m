function INPUT(XL, YL, XM, YM, XIN, YIN, INDEX, UB, N, IN)
fprintf('%s', repmat('*', 1, 69));
fprintf('\nDATA\n');
fprintf('%s', repmat('*', 1, 69));
fprintf('\n\n# BOUNDARY ELEMENTS: N = %d', N);
fprintf('\n\n# INTERNAL POINTS WHERE THE FUNCTION IS CALCULATED: IN = %d', IN);
fprintf('\n\nCOORDINATES OF THE EXTREME POINTS OF THE BOUNDARY ELEMENTS:');
fprintf('\n                   |--------*--------|');
fprintf('\n                 XL(1)    XM(1)    XL(2)');
fprintf('\n\nPOINT        XL            YL');
for i = 1:N
    if i<10
        fprintf('\n  %d %14.5f%14.5f', i, XL(i), YL(i));
    else
        fprintf('\n  %d%14.5f%14.5f', i, XL(i), YL(i));
    end
end
fprintf('\n\nCOORDINATES AND CONDITIONS OF THE BOUNDARY NODES:');
fprintf('\n\nNODE        XM            YM       INDEX    PRESCRIBED VALUE');
for i = 1:N
    if i<10
        fprintf('\n %d %14.5f%14.5f%7d%18.5f', i, XM(i), YM(i), INDEX(i), UB(i));
    else
        fprintf('\n %d%14.5f%14.5f%7d%18.5f', i, XM(i), YM(i), INDEX(i), UB(i));
    end
end
fprintf('\n\nCOORDINATES OF THE INTERNAL POINTS:');
fprintf('\n\nPOINT        XIN           YIN');
for i = 1:IN
    if i<10
        fprintf('\n  %d %14.5f%14.5f', i, XIN(i), YIN(i));
    else
        fprintf('\n  %d%14.5f%14.5f', i, XIN(i), YIN(i));
    end
end
fprintf('\n\n');
end


