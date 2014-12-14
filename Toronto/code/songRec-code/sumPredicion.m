function [beta,err] = sumPredicion(Ytrain,sumTest,lambda)
    counts = sum(Ytrain~=0,2);
    sumTrain = sum(Ytrain,2);
%     meanTrain = sumTrain./counts; not use it, produces NaN :/ 
    
    
    X = [counts,sumTrain];
    
    beta = (X'*X+eye(size(X'*X))*lambda)\(X'*sumTest);
    
    err = sqrt(sum((sumTest - X*beta).^2)/length(sumTest));
end