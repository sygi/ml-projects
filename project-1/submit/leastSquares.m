function beta = leastSquares(y,tX)
%leastSquares - Least squares using normal equations
%   
%   beta = leastSquares(y,tX)

beta = (tX'*tX)\(tX'*y);
end
