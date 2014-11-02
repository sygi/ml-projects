function Error = estimatePenLogReg(Xtr,y_train,Xte,y_test,alpha,lambda)
%ESTIMATE - train penalized logistic regresion used Xtr and y_train 
%and estimate y_test 
% 
%   estimatePenLogReg(X_train,y_train,X_test,y_test,alpha,lambda, maxIter)

X_train = addOnes(Xtr);
X_test = addOnes(Xte);
y_train = (y_train +1)/2;
y_test = (y_test +1)/2;
beta = penLogisticRegression(y_train, X_train,alpha,lambda);
errTrain = (y_train - sigmoid(X_train*beta))'*(y_train - sigmoid(X_train*beta))/size(y_train,1);
errTrain = sqrt(errTrain);
errTest = (y_test - sigmoid(X_test*beta))'*(y_test - sigmoid(X_test*beta))/size(y_test,1);
errTest = sqrt(errTest);
Error = [errTrain,errTest];
% 
% probTr = sigmoid(X_train*beta);
% errTrain = - 1/size(y_train,1) * sum (y_train.*log(probTr)+(1.-y_train).*log(1.-probTr));
% probTe = sigmoid(X_test*beta);
% errTest = - 1/size(y_test,1) * sum(y_test .* log(probTe)+(1.-y_test) .* log(1.-probTe));

end