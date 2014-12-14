function [predictionTest,predictionTrain] = estimateSVM(X_train,y_train,X_test,kernel)

SVMStruct = fitcsvm(X_train,y_train,'KernelFunction',kernel);
[~,doubledPrediction]  = predict(SVMStruct,X_train);
predictionTrain = doubledPrediction(:,2);
[~,doubledPrediction]  = predict(SVMStruct,X_test);
predictionTest = doubledPrediction(:,2);
end

