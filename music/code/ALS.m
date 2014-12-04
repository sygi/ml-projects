function [A, U] = ALS(X, noHidden, lambda, maxIter)
%ALS compute A, U such that:
% U' * A ~= X,
% size(A) = [noHidden size(X, 2)]
% size(U) = [noHidden size(X, 1)]
% using alternating least squares method

if ~exist('maxIter', 'var')
    maxIter = 100;
end

if ~exist('lambda', 'var')
    lambda = 1;
end

[usr,art] = size(X);
A = rand(noHidden,art);
U = rand(noHidden,usr);
err = zeros(1,maxIter);

for i=1:maxIter
%    err(i)= rmse(A'*U,Ytrain;
%    for j = 1:10
   [A, U] = alsUpdate(A, U, X, lambda);
%    end
   err(i) = alsError(A, U, X);
   err(i)
   if i>2
      if abs(err(i-1)-err(i)) < 1e-4;
          fprintf('converged');
          break;
      end
   end
end

end

