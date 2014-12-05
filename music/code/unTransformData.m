function Y = unTransformData(X, where)
% apply this function after prediction, so that data preprocessing will be
% reversed and we get reasonable results for original data
% should be that unTransformData(transformData(X)) = X
% where are indices that should transformation be applied to
global gStd gMean;
X(where) = X(where) .* gStd;
X(where) = X(where) + gMean;
X(where) = exp(X(where));

X(where) = X(where) - 1e-10;
Y = X;

end

