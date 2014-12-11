function prediction = estimateSVM(X_train,y_train,X_test,kernel)

SVMStruct = svmtrain(X_train,y_train,'kernel_function',kernel);
prediction  = svmclassify(SVMStruct,X_test);

end

