function beta = logisticRegression(y,tX,alpha,maxIter)
% logisticRegression - logistic regression using gradient descent
%   
%   beta = logisticRegression(y,tX,alpha)
%   beta = logisticRegression(y,tX,alpha,maxIter)

if ~exist('maxIter', 'var')
    maxIter = 1000;
end

[N,D]=size(tX);
beta = zeros(D,1);
for i = 1:maxIter
    gradient = -(tX')*(y - sigmoid(tX*beta))/N;
    beta = beta-alpha*gradient;
end
end