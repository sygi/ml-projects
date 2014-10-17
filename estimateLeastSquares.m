function y_test = estimateLeastSquares(X_train, y_train, X_test)
%ESTIMATE - train least squares used X_train and y_train and estimate y_test 
beta = leastSquares(X_train, y_train);
y_test = beta * X_test;
end
