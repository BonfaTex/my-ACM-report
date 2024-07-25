function [UB, UNB] = REORDER(UB, UNB, INDEX)
n = length(UB);
% Rearrange the arrays
for i = 1:n
    if INDEX(i) ~= 0
        ch = UB(i);
        UB(i) = UNB(i);
        UNB(i) = ch;
    end
end
end
