function [predictionTest,predictionTrain] = estimateLogisticReg(X_train,y_train,X_test,lambda)

tX_train = addOnes(X_train);
tX_test = addOnes(X_test);
beta = penLogisticRegression(y_train,tX_train,1,lambda);
% trErr = sum((sigmoid(tX_train*beta)-y_train).^2);
% trErr = sqrt(trErr/length(y_train))
predictionTrain = sigmoid(tX_train*beta);

predictionTest = sigmoid(tX_test*beta);
% teErr = sum((prediction-y_test).^2);
% teErr = sqrt(teErr/length(y_test))

end

