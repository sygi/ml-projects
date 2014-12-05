function [TestErr,TrainErr] = estimateALS(Ytrain,Ytest,noHidden,lambda, maxIter)

    if ~exist('maxIter', 'var')
        maxIter = 100;
    end
    
    if ~exist('lambda', 'var')
        lambda = 1;
    end
    
    [A,U,TrainErr] = ALS(Ytrain,noHidden,lambda,maxIter);
    TestErr = alsError(A,U,Ytest);
    
end