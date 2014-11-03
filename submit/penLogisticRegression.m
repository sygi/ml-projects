function beta = penLogisticRegression(y,tX,alpha,lambda, maxIter)
%penLogisticRegression - penalized logistic regression using
%Newtons metod
%
%       beta = penLogisticRegression(y,tX,alpha,lambda)

if ~exist('maxIter', 'var')
    maxIter = 1000;
end

[N,D]=size(tX);
beta = zeros(D,1);
for i = 1:maxIter
    gradient = (-tX'*(y - sigmoid(tX*beta))+lambda*beta)/N;
    if norm(gradient) < 1e-8
        % it converged, finish early
        return;
    end
    H = computeHessian(tX,beta)+eye(length(beta))*lambda/length(y);
    tmp = H\gradient;
    beta = beta-alpha*tmp;
end
end
