function beta = penLogisticRegression(y,tX,alpha,lambda, maxIter)
%penLogisticRegression - penalized logistic regression using gradient descent
%
%       beta = penLogisticRegression(y,tX,alpha,lambda)
if ~exist('maxIter', 'var')
    maxIter = 1000;
end

[N,D]=size(tX);
beta = zeros(D,1);
for i = 1:maxIter
    gradient = (-tX'*(y - sigmoid(tX*beta))+lambda*beta)/N;
    if norm(gradient) < 10e-5
        fprintf('finished early\n');
        return;
    end
    beta = beta-alpha*gradient;
end
end