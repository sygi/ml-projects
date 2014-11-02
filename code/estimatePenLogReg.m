function Error = estimatePenLogReg(Xtr,y_train,Xte,y_test,alpha,lambda)
%ESTIMATE - train penalized logistic regresion used Xtr and y_train 
%and estimate y_test 
% 
%   estimatePenLogReg(X_train,y_train,X_test,y_test,alpha,lambda, maxIter)

X_train = addOnes(Xtr);
X_test = addOnes(Xte);
% y_train = (y_train +1)/2;
% y_test = (y_test +1)/2;
beta = penLogisticRegression(y_train, X_train,alpha,lambda);
%errTrain = (y_train - sigmoid(X_train*beta))'*(y_train - sigmoid(X_train*beta))/size(y_train,1);
%errTrain = sqrt(errTrain);
%errTest = (y_test - sigmoid(X_test*beta))'*(y_test - sigmoid(X_test*beta))/size(y_test,1);
%errTest = sqrt(errTest);

errTrain = logError(X_train,y_train,beta);
errTest = logError(X_test,y_test,beta);
Error = [errTrain,errTest];

end