function [A, UNB] = ABMATR(G, H, UB, INDEX)
n = size(G,1);
A = zeros(n,n);
UNB = zeros(n,1);
% Reorder the columns of the system of equations and store them in A
for j = 1:n
    if INDEX(j) == 0
        A(:,j) = -G(:,j);
    else
        A(:,j) = H(:,j);
    end
end
% Compute the right-hand side vector and store it in UNB
for i = 1:n
    for j = 1:n
        if INDEX(j) == 0
            UNB(i) = UNB(i) - H(i,j)*UB(j);
        else
            UNB(i) = UNB(i) + G(i,j)*UB(j);
        end
    end
end
end
