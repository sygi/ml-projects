function Y = unTransformData(X)
% apply this function after prediction, so that data preprocessing will be
% reversed and we get reasonable results for original data
% should be that unTransformData(transformData(X)) = X
global gStd gMean;
X(find(X)) = X(find(X)) .* gStd;
X(find(X)) = X(find(X)) + gMean;
X(find(X)) = exp(X(find(X)));

X(find(X)) = X(find(X)) - 1e-10;
Y = X;

end

