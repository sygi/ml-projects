function [prediction,y_test] = estimateROC_SVM(labels,X,k,kernel,treshold,cutTo,seed)

if ~exist('cutTo', 'var')
    cutTo = size(X,1);
end

if ~exist('treshold', 'var')
    treshold = 0;
end

%take only part of data
l2 = labels(1:cutTo);
X2 = X(1:cutTo,:);

%split to k-1/k and 1/k
[X_train,X_test,y_train,y_test] = splitVector(X2,l2,k,seed);

c = corr(y_train,X_train);

%take only correlated features
X_test=X_test(:,abs(c)>treshold);
X_train=X_train(:,abs(c)>treshold);

SVMStruct = svmtrain(X_train,y_train,'kernel_function',kernel);
prediction  = svmclassify(SVMStruct,X_test);


end

