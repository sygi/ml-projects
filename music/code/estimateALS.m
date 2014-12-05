function [TestErr,TrainErr, predicted, orig] = estimateALS(Ytrain,Ytest,noHidden, unnormalize, lambda, maxIter)

    if ~exist('maxIter', 'var')
        maxIter = 50;
    end
    
    if ~exist('lambda', 'var')
        lambda = 10;
    end
    
    [A,U,TrainErr] = ALS(Ytrain,noHidden,lambda,maxIter);
    % TestErr = alsError(A,U,Ytest);
    predicted = U' * A;
    orig = Ytest;
    TestErr = rsme(U'*A, Ytest, unnormalize);
    
end
