function beta = leastSquaresGD(y,tX,alpha,maxIter)
%leastSquaresGD - least squares using gradient descent 
%   
%   beta = leastSquaresGD(y,tX,alpha)
%   beta = leastSquaresGD(y,tX,alpha,maxIter)


if ~exist('maxIter', 'var')
    maxIter = 1000;
end

if ~exist('alpha', 'var')
    alpha = 0.01;
end

[N,D] = size(tX);
beta = zeros(D,1);
for i = 1:maxIter
   gradient =  -(1/N)*tX'*(y - tX*beta);
   e = (y - tX * beta);
   beta = beta - alpha*gradient;
end
end
