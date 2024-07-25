function [x, lsing] = SOLVEQ(A, UNB, n)
% This function solves the system of linear equations Ax = UNB

% Solve the system of equations
[x, lsing] = LEQS(A, UNB, n);

if lsing==0
    disp('The system has been solved regularly')
else
    disp('The system is singular')
end

end
