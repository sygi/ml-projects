function Y = transformTestData(X)
% applies preprocessing transformation to test data (having already gMean
% and gStd)
% declare gMean and gStd global in workspace before usage
global gMean gStd;
Y = X;
Y(find(X)) = log(X(find(X)) + 1e-10);
Y(find(Y)) = Y(find(Y)) - gMean;
Y(find(Y)) = Y(find(Y)) ./ gStd;
end

