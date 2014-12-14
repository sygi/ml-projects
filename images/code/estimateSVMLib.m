function [predictionTest,predictionTrain] = estimateSVMLib(X_train,y_train,X_test,y_test,parameters)

y_train  = 2*y_train -1;
y_test = 2*y_test -1;
model = svmtrain(y_train, X_train, parameters);
[~, ~, predictionTrain] = svmpredict(y_train, X_train, model);
[~, ~, predictionTest] = svmpredict(y_test, X_test, model);
end

