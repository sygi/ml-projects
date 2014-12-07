function [TestErr,TrainErr, predicted, orig] = estimateALS(Ytrain,Ytest,noHidden, unnormalize, lambda, maxIter)
    global gStd gMean;
    if ~exist('maxIter', 'var')
        maxIter = 50;
    end
    
    if ~exist('lambda', 'var')
        lambda = 10;
    end
    
    if (unnormalize)
        % fprintf('zeroing %d elements\n', full(sum(exp((Ytrain * gStd) + gMean) > 1e5)));
        Ytrain(exp((Ytrain * gStd) + gMean) > 1e5) = 0;
    else
        Ytest(Ytrain > 1e5) = 0;
        Ytrain(Ytrain > 1e5) = 0;
    end
    
    Ytest = Ytest(:, any(Ytrain ~= 0));
    Ytest = Ytest(any(Ytrain ~= 0, 2), :); % TODO: this should not be done like this in real dataset
    Ytrain = Ytrain(:, any(Ytrain ~= 0));
    Ytrain = Ytrain(any(Ytrain ~= 0,2), :);
    
    [A,U,TrainErr] = ALS(Ytrain,noHidden,lambda,maxIter);
    % TestErr = alsError(A,U,Ytest);
    predicted = U' * A;
    [usr, art] = find(Ytest);
    for i=1:length(usr)
        predicted(usr(i), art(i)) = min(predicted(usr(i),art(i)), max(max(Ytrain(usr(i), :)), max(Ytrain(:, art(i)))));
         predicted(usr(i), art(i)) = max(predicted(usr(i), art(i)), min( ...
             min(Ytrain(usr(i), (Ytrain(usr(i), :) ~= 0))), ...
             min(Ytrain(Ytrain(:, art(i)) ~= 0, art(i)))));
        % assert(predicted(usr(i), art(i)) >= 0);
    end
    TestErr = rsme(predicted, Ytest, unnormalize);
end
