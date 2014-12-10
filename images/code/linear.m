function [linearPred,y_test] = linear(labels,X,k,lambda,treshold,cutTo,seed)

if ~exist('seed', 'var')
    seed = 20;
end

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
tX_train = addOnes(X_train);
tX_test = addOnes(X_test);

c = corr(y_train,X_train);

%take only correlated features
tX_test=tX_test(:,abs(c)>treshold);
tX_train=tX_train(:,abs(c)>treshold);

beta = penLogisticRegression(y_train,tX_train,1,lambda);
linearPred = tX_test*beta;

end

