function [X_train,X_test,y_train,y_test] = splitVector(X,y,k,seed)
    
    setSeed(seed);
    N = length(y);
    Nk = floor(N/k);
    idx = randperm(Nk*k)';
    y = y(1:Nk*k);
    X = X(1:Nk*k,:);
    y_test = y(idx(1:Nk));
    X_test = X(idx(1:Nk),:);
    y_train = y(idx(Nk+1:end));
    X_train = X(idx(Nk+1:end),:);
end