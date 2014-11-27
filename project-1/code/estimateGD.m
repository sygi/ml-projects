function ERR = estimateGD(X_train, y_train, X_test,y_test,alpha)
%ESTIMATE - train least squares used X_train and y_train and estimate y_test 
% 
%   estimateLeastSquares(X_train, y_train, X_test)
X_train = addOnes(X_train);
X_test = addOnes(X_test);
beta = leastSquaresGD(y_train, X_train,alpha, 100000);
errTrain = squareError(X_train,y_train,beta);
errTest = squareError(X_test,y_test,beta);
ERR = [errTrain,errTest];
end
