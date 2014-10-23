function [errTrain,errTest] = estimateLeastSquares(X_train, y_train, X_test,y_test)
%ESTIMATE - train least squares used X_train and y_train and estimate y_test 
% 
%   estimateLeastSquares(X_train, y_train, X_test)
X_train = addOnes(X_train);
X_test = addOnes(X_test);
beta = leastSquares(X_train, y_train);
errTrain = (y_train - beta*X_train)'*(y_train - beta*X_train);
errTest = (y_test - beta*X_test)'*(y_test - beta*X_test);
end
