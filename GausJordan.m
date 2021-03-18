function [solution] = GausJordan(A)

tmp = zeros(size(A,1), size(A,1));
for i = 1:size(A,1)
    for j = 1:size(A,1)
        if(A(i,j) ~= 0)
            tmp(i,j) = 1; %map all zeros
        end
    end
end

for i = 1:size(A,1)
    if(tmp(i,i) == 0)
        for j=1:size(A,1)
            if(i~=j && tmp(j,i) ~= 0 && tmp(j,i)~= 0)
               A([i,j], :) = A([j i], :); %move zeros from diagonal
            end
        end
    end
end

for i = 1:size(A,1)
    if(A(i,i) ~= 0)
        A(i,:) = A(i,:)./A(i,i);
    end
    for j = 1:size(A,1)
        if(i~=j)
            A(j,:)=A(j,:) - A(i,:)*A(j,i);
        end
    end
end
solution = A;

end

