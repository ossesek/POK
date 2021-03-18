function [solutionsNumber] = KronCap(A)

if(rank(A) ~= rank(A(1:end, 1:end-1)))
    solutionsNumber = 0;        
elseif(rank(A) == size(A,2)-1)
    solutionsNumber = 1;    
else
    solutionsNumber = -1;
end

end

