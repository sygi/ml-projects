function [A, U, err] = ALS(X, noHidden, lambda, maxIter)
%ALS compute A, U such that:
% U' * A ~= X,
% size(A) = [noHidden size(X, 2)]
% size(U) = [noHidden size(X, 1)]
% using alternating least squares method

if ~exist('maxIter', 'var')
    maxIter = 100;
end

if ~exist('lambda', 'var')
    lambda = 0.01;
end

[usr,art] = size(X);
A = rand(noHidden,art);
% A(1, :) = sum(X) ./ max(1,sum(sign(X)));
U = rand(noHidden,usr);
% U(1, :) = sum(X,2) ./ max(1,sum(sign(X), 2));
err = zeros(1,maxIter);

for i=1:maxIter
    if (mod(i, 10) == 0)
        fprintf('ALS iteration %d\n', i);
    end
%    err(i)= rmse(A'*U,Ytrain;
%    for j = 1:10
   [A, U] = alsUpdate(A, U, X, lambda);
%    end
   %err(i) = alsError(A, U, X);
   if (mod(i, 10) > 1 && mod(i, 10) < 4)
      err(i) = alsError(A, U, X, lambda);
      err(i)
      if abs(err(i-1)-err(i)) < 1e-6;
          fprintf('converged');
          break;
      end
   end
end

end

