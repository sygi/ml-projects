function prediction = estimateSVM(X_train,y_train,X_test,kernel)

SVMStruct = fitcsvm(X_train,y_train,'KernelFunction',kernel);
[sharp,doubledPrediction]  = predict(SVMStruct,X_test);
prediction = doubledPrediction(:,2);
end

