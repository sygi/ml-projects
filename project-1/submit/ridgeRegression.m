function beta = ridgeRegression(y,tX, lambda)
%ridgeRegression - Ridge regression using normal equations
%
%   beta = ridgeRegression(y,tX, lambda)

[N,D]=size(tX);
beta = (tX'*tX + lambda*eye(D))\(tX'*y);
end
