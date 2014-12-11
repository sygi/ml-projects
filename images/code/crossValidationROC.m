function [prediction,y_test] = crossValidationROC(y,X,k,seed,lambda,alpha)

if ~exist('seed', 'var')
    seed = 1;
end


setSeed(seed);
N = length(y);
Nk = floor(N/k);
idx = randperm(Nk*k)';
y = y(1:Nk*k);
X = X(1:Nk*k,:);
pred = zeros(Nk,k);
    for i = 1:k
        y_test = y(idx(1:Nk));
        X_test = X(idx(1:Nk),:);
        y_train = y(idx(Nk+1:end));
        X_train = X(idx(Nk+1:end),:);
        pred(:,i)=estimateSVM(X_train,y_train,X_test);
        circshift(idx,[0,Nk]);
    end
prediction=mean(pred,2);
end