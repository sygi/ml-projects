function beta = leastSquaresGD(y,tX,alpha,maxIter)
%leastSquaresGD - least squares using gradient descent 
%
%   some comment
%   
%   beta = leastSquaresGD(y,tX,alpha)
%   beta = leastSquaresGD(y,tX,alpha,maxIter)


if ~exist('maxIter', 'var')
    maxIter = 1000;
end

[N,D] = size(tX);
beta = zeros(D,1);
for i = 1:maxIter
   gradient =  -(1/N)*tX'*(y - tX*beta);
   beta = beta - alpha*gradient;
end
end