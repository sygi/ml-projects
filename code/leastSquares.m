function beta = leastSquares(y,tX)
%leastSquares - Least squares using normal equations
%
%   some comment
%   
%   beta = leastSquares(y,tX)

beta = (tX'*tX)\(tX'*y);
end