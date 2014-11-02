clear all;
load('classifNormalized');
lambda = 0.5;
alpha = 1;
beta = penLogisticRegression(myY_train, [myX_train,abs(myX_train)], alpha,lambda,10000);
absX = [vaultX,abs(vaultX)];
penRSME = rsmeError(absX,vaultY,beta)
pen01 = o1Error(absX,vaultY,beta)
penLog = logError(absX,vaultY,beta)
beta = logisticRegressionH(myY_train,myX_train, alpha,10000);
normRSME = rsmeError(vaultX,vaultY,beta)
norm01 = o1Error(vaultX,vaultY,beta)
normLog = logError(vaultX,vaultY,beta)

save('test_errorsa_classification.mat','pen01');