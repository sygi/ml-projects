function err = logError(X,y,beta)
    err = -(y'*X*beta - sum(log(1+exp(X*beta))))/length(y);
end