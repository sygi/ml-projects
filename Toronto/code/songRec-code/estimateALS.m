function [TestErr,predicted] = estimateALS(Ytrain,Ytest,noHidden, lambda, maxIter)
    if ~exist('maxIter', 'var')
        maxIter = 40;
    end
    
    if ~exist('lambda', 'var')
        lambda = 0.0001;
    end
    
    %userMax = max(Ytrain, [], 2);
    %Ytrain ./ repmat(userMax, 1, size(Ytrain,2))

    orig = Ytrain;
    zeroArt = all(Ytrain == 0);
    zeroUsr = all(Ytrain == 0, 2);
    Ytrain = Ytrain(:, any(Ytrain ~= 0));
    Ytrain = Ytrain(any(Ytrain ~= 0, 2), :);
    
    %Ytest = Ytest(:, any(Ytrain ~= 0));
    %Ytest = Ytest(any(Ytrain ~= 0, 2), :);
    %Ytrain = Ytrain(:, any(Ytrain ~= 0));
    %Ytrain = Ytrain(any(Ytrain ~= 0,2), :);
    
    [A,U,TrainErr] = ALS(Ytrain,noHidden,lambda,maxIter);
    % TestErr = alsError(A,U,Ytest);
    A2 = zeros(size(A,1), size(Ytest, 2));
    U2 = zeros(size(U,1), size(Ytest, 1));
    A2(:, any(orig ~= 0)) = A;
    U2(:, any(orig ~= 0, 2)) = U;
    predicted = U2' * A2;
    
    for i=1:length(zeroArt)
        usrs = find(Ytest(:, zeroArt(i)));
        for j=1:length(usrs)
            predicted(usrs(j), zeroArt(i)) = 1e-10 + sum(orig(usrs(j), :)) ./ max(1, sum(orig(usrs(j), :) ~= 0));
        end
    end
    for i=1:length(zeroUsr)
        arts = find(Ytest(zeroUsr(i), :));
        for j=1:length(arts)
            predicted(zeroUsr(i), arts(j)) = 1e-10 + sum(orig(:, arts(j))) ./ max(1, sum(orig(:, arts(j)) ~= 0));
        end
    end
    
    predicted = boundPrediction(predicted, orig, Ytest);
    
    %Ytrain = Ytrain .* repmat(userMax, 1, size(Ytrain,2));
    [TestErr, dist] = logError(predicted, Ytest, orig);
    drawErrorDistribution(dist, orig, 0);
end
