function [Xtest,Xtrain] = pickTrain(Ytrain,K)
    
    idx = find(Ytrain);
    
    entries = length(find(Ytrain));
    perm = randperm(entries);
    
    Nk = floor(entries / K);
    Xtrain = sparse(size(Ytrain,1),size(Ytrain,2));
    
    Xtrain(idx(perm(Nk+1:end))) = Ytrain(idx(perm(Nk+1:end)));
    
    Xtrain = Xtrain(:,sum(Xtrain)~=0);
    Xtest = Ytrain(:,sum(Xtrain)~=0);
end