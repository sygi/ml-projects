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
    lambda = 10;
    fprintf('blabla\n');
    return
end

[usr,art] = size(X);
A = rand(noHidden,art);
A(1, :) = sum(X) ./ max(1,sum(X ~= 0));
U = rand(noHidden,usr);
U(1, :) = sum(X,2) ./ max(1,sum(X ~= 0, 2));
err = zeros(1,maxIter);

for i=1:maxIter
    if (mod(i, 20) == 0)
        fprintf('ALS iteration %d\n', i);
    end
%    err(i)= rmse(A'*U,Ytrain;
%    for j = 1:10
   [A, U] = alsUpdate(A, U, X, lambda);
%    end
   %err(i) = alsError(A, U, X);
   if (false && mod(i, 10) > 1 && mod(i, 10) < 4)
      err(i) = alsError(A, U, X, lambda);
      err(i)
      if (i > 1 && abs(err(i-1)-err(i)) < 1e-6)
          fprintf('converged');
          break;
      end
   end
   if (i == maxIter - 1)
       matr  = U' * A;
       [xSize ySize] = size(matr);
       xPerm = randperm(xSize);
       yPerm = randperm(ySize);
       checks = min(100,min(size(matr)));
       randomValues = zeros(checks, 1);
       for j = 1:length(randomValues)
           randomValues(j) = matr(xPerm(j), yPerm(j));
       end
   elseif (i == maxIter)
       diff = 0;
       matr = U' * A;
       for j = 1:length(randomValues)
           diff = diff + (matr(xPerm(j), yPerm(j)) - randomValues(j)) .^ 2;
       end
       diff = diff / length(randomValues);
       fprintf('My difference is %f\n', diff);
       if (diff > 1e2)
           fprintf('Too small lambda, getting too high variance\n');
       end
   end
end

end

