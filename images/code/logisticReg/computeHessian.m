function H = computeHessian(tX,beta)
%computeHessian
%
%   H = computeHessian(tX,beta)

    s = sigmoid(tX*beta).*(1-sigmoid(tX*beta));
    N = length(tX);
    S = diag(s);
    H = (tX'*S*tX)/N;
end