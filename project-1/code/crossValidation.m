function ThisStupidError = crossValidation(y,X,k,seed,alpha,lambda)

if ~exist('seed', 'var')
    seed = 1;
end
setSeed(seed);
size(X);
N = length(y);
Nk = floor(N/k);
idx = randperm(Nk*k)';
y = y(1:Nk*k);
X = X(1:Nk*k,:);
for i = 1:k
    y_test = y(idx(1:Nk));
    X_test = X(idx(1:Nk),:);
    y_train = y(idx(Nk+1:end));
    X_train = X(idx(Nk+1:end),:);
%     ERR(i,:)= estimateLeastSquares(X_train,y_train,X_test,y_test);
    ERR(i,:)= estimatePenLogReg(X_train,y_train,X_test,y_test,alpha,lambda);
    circshift(idx,[0,Nk]);
end
trainErr = mean(ERR(:,1));
testErr = mean(ERR(:,2));
ThisStupidError = [trainErr, testErr];
end