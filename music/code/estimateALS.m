function [TestErr,TrainErr] = estimateALS(Ytrain,Ytest,noHidden, unnormalize, lambda, maxIter)

    if ~exist('maxIter', 'var')
        maxIter = 20;
    end
    
    if ~exist('lambda', 'var')
        lambda = 0.0001;
    end
    
    [A,U,TrainErr] = ALS(Ytrain,noHidden,lambda,maxIter);
    % TestErr = alsError(A,U,Ytest);
    TestErr = rsme(U'*A, Ytest, unnormalize);
    
end
