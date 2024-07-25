function G = holeGMATR(XL, YL, XM, YM, N, NB, NL)
G = zeros(N,N);
beg = 1;
for k = 1:NB
    for i = 1:N
        for j = beg:NL(k)
            if i~=j % off-diagonal elements of G
                if j==NL(k)
                    G(i,j) = RLINTC(XM(i),YM(i),XL(j),YL(j),XL(beg),YL(beg));
                else
                    G(i,j) = RLINTC(XM(i),YM(i),XL(j),YL(j),XL(j+1),YL(j+1));
                end
            elseif i==j % diagonal elements of G
                if j==NL(k)
                    G(i,j) = SLINTC(XL(j),YL(j),XL(beg),YL(beg));
                else
                    G(i,j) = SLINTC(XL(j),YL(j),XL(j+1),YL(j+1));
                end
            end
        end
    end
    beg = NL(k)+1;
end

% for i=1:N
%     for j=1:N
%         if (G(i,j)==0)
%             if j==16
%                 G(i,j) = RLINTC(XM(i),YM(i),XL(j),YL(j),XL(1),YL(1));
%             elseif j==24
%                 G(i,j) = RLINTC(XM(i),YM(i),XL(j),YL(j),XL(17),YL(17));
%             else
%                 G(i,j) = RLINTC(XM(i),YM(i),XL(j),YL(j),XL(j+1),YL(j+1));
%             end
%         end
%     end
% end

end
