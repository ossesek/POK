function [solution, iter] = GaussSeidel(A,tol)
n = size(A,1);
m = size(A,2);
solution = zeros(n,1);
if(n ~= m-1)
    error('Base matrix is ot a square matrix');
end
for i = 1:n
    row = abs(A(i,1:end-1));
    tmp = sum(row) - row(i);
    if(tmp >= row(i))
        error('Matrix is not diagonlly dominant');
    end
end

D = diag(diag(A));
L = tril(A(:,1:end-1)) - D;
U = triu(A(:,1:end-1)) - D;
err = inf;
iter = 0;
while err > tol
    betterSolution = (D+L)\(-U*solution + A(:,end));
    err = max(abs((betterSolution-solution)./solution));
    solution= betterSolution;
    iter = iter +1;
end
end

