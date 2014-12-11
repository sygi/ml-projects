function [prediction,y_test] = crossValidation(y,X,k,parameter,...
                                                treshold,seed,normalized)
%       generic cross-validation 
%
%       prediction,y_test] =
%       crossValidation(y,X,k,parameter,seed,normalize,treshold)


if ~exist('seed', 'var')
    seed = 1;
end

if ~exist('normalize','var')
    normalized = false;
end

if ~exist('treshold','var')
    treshold = 0;
end


%prepering data to split
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
        if (normalized)
            X_train = normalize(X_train,mean(X_train),std(X_train));
            X_test = normalize(X_test,mean(X_train),std(X_train));
        end
        %takin only the most correlated part of data:
        c = abs(corr(y_train,X_train));
        X_train = X_train(:,c>treshold);
        X_test = X_test(:,c>treshold);
        %estimating the probabilities
        pred(:,i)=estimateSVM(X_train,y_train,X_test,parameter);
        %pred(:,i)=estimateLogisticReg(X_train,y_train,X_test,parameter);
        %here add other estimate something
    end
    prediction=mean(pred,2);
end