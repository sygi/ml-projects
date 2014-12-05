function [TestErr,TrainErr] = estimateALS(Ytrain,Ytest,noHidden,lambda, maxIter)

    if ~exist('maxIter', 'var')
        maxIter = 100;
    end
    
    if ~exist('lambda', 'var')
        lambda = 0.000001;
    end
    
    [A,U,TrainErr] = ALS(Ytrain,noHidden,lambda,maxIter);
%     TestErr = alsError(A,U,Ytest,lambda);
    TestErr = rsme(U'*A, Ytest,true);
    
end