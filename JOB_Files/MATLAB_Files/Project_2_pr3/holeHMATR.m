function H = holeHMATR(XL, YL, XM, YM, N, NB, NL)
H = zeros(N,N);
beg = 1;
for k=1:NB
    for i = 1:N
        for j = beg:NL(k)
            if i~=j % off-diagonal elements of G
                if j==NL(k)
                    H(i,j) = DALPHA(XM(i),YM(i),XL(j),YL(j),XL(beg),YL(beg));
                else
                    H(i,j) = DALPHA(XM(i),YM(i),XL(j),YL(j),XL(j+1),YL(j+1));
                end
            elseif i == j % diagonal elements of G
                H(i,j) = -0.5;
            end
        end
    end
    beg = NL(k)+1;
end

% for i=1:N
%     for j=1:N
%         if (H(i,j)==0)
%             if j==16
%                 H(i,j) = DALPHA(XM(i),YM(i),XL(j),YL(j),XL(1),YL(1));
%             elseif j==24
%                 H(i,j) = DALPHA(XM(i),YM(i),XL(j),YL(j),XL(17),YL(17));
%             else
%                 H(i,j) = DALPHA(XM(i),YM(i),XL(j),YL(j),XL(j+1),YL(j+1));
%             end
%         end
%     end
% end

end
