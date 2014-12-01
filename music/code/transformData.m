function Y = transformData(X)
% applies preprocessing transformation to data
% declare gMean and gStd global in workspace before usage
Y = X;
Y(find(X)) = log(X(find(X)) + 1e-10);
global gMean;
gMean = mean(Y(find(Y)));
global gStd;
gStd = std(Y(find(Y)));
Y(find(Y)) = Y(find(Y)) - gMean;
Y(find(Y)) = Y(find(Y)) ./ gStd;
end