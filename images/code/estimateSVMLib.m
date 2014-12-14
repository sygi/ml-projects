function [predictionTest,predictionTrain] = estimateSVMLib(X_train,y_train,X_test,y_test,parameters)

y_train  = y_train +0;
y_test = y_test +0;
model = svmtrain(y_train, X_train);
[~, ~, predictionTrain] = svmpredict(y_train, y_train, model);
[~, ~, predictionTest] = svmpredict(y_test, X_test, model);
end

