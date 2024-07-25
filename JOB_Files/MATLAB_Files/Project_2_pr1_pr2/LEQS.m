function [x, lsing] = LEQS(A, B, n)
% This function uses Gauss elimination to solve a system of linear equations [A]{X}={B}

% Initialize variables
lsing = 0;
jj = -n;

% Perform Gauss elimination
for j = 1:n
    jy = j+1;
    jj = jj+n+1;
    amax = 0;
    ihelp = jj-j;
    for i = j:n        
        ij = ihelp+i;
        if abs(amax)-abs(A(ij)) < 0
            amax = A(ij);
            imax = i;
        end
    end
    if abs(amax) == 0
        lsing = 1;
        x = [];
        return
    end
    i1 = j+n*(j-2);
    ihelp = imax-j;
    for k = j:n
        i1 = i1+n;
        i2 = i1+ihelp;
        atemp = A(i1);
        A(i1) = A(i2);
        A(i2) = atemp;
        A(i1) = A(i1)/amax;
    end
    atemp = B(imax);
    B(imax) = B(j);
    B(j) = atemp/amax;
    if j ~= n
        iqs = n*(j-1);
        for ix = jy:n
            ixj = iqs+ix;
            ihelp = j-ix;
            for jx = jy:n
                ijref = n*(jx-1)+ix;
                jjx = ijref+ihelp;
                A(ijref) = A(ijref)-(A(ixj)*A(jjx));
            end
            B(ix) = B(ix)-B(j)*A(ixj);
        end
    end
end

% Back-substitution
ny = n-1;
nn = n*n;
for j = 1:ny
    i1 = nn-j;
    i2 = n-j;
    i3 = n;
    for k = 1:j
        B(i2) = B(i2)-A(i1)*B(i3);
        i1 = i1-n;
        i3 = i3-1;
    end
end

% Return the solution vector
x = B;
end
