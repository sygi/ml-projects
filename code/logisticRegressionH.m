function beta = logisticRegressionH(y,tX,alpha,maxIter)
% logisticRegression - logistic regression using gradient descent
%   
%   beta = logisticRegressionH(y,tX,alpha)
%   beta = logisticRegressionH(y,tX,alpha,maxIter)

if ~exist('maxIter', 'var')
    maxIter = 1000;
end

[N,D]=size(tX);
beta = zeros(D,1);
for i = 1:maxIter
    H = computeHessian(tX,beta);
    gradient = -(tX')*(y - sigmoid(tX*beta))/N;
    tmp = (H\gradient);
    beta = beta - alpha*tmp;
end
end
