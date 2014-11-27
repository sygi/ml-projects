function ERR = estimateRidge(X_train, y_train, X_test,y_test,lambda)
%ESTIMATE - train least squares used X_train and y_train and estimate y_test 
% 
%   estimateLeastSquares(X_train, y_train, X_test)
X_train = addOnes(X_train);
X_test = addOnes(X_test);
beta = ridgeRegression(y_train, X_train,lambda);
errTrain = squareError(X_train,y_train,beta);
errTest = squareError(X_test,y_test,beta);
ERR = [errTrain,errTest];
end
