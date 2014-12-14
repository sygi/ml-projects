function H = computeHessian(tX,beta)
%computeHessian
%
%   H = computeHessian(tX,beta)

    s = sigmoid(tX*beta).*(1-sigmoid(tX*beta));
    S = diag(s);
    H = (tX'*S*tX);
end