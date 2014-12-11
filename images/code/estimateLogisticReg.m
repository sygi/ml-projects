function prediction = estimateLogisticReg(X_train,y_train,X_test,lambda)

tX_train = addOnes(X_train);
tX_test = addOnes(X_test);
beta = penLogisticRegression(y_train,tX_train,1,lambda);
prediction = tX_test*beta;

end

