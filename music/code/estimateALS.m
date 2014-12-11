function [TestErr,predicted] = estimateALS(Ytrain,Ytest,noHidden, normalize, lambda, maxIter)
    if ~exist('maxIter', 'var')
        maxIter = 50;
    end
    
    if ~exist('lambda', 'var')
        lambda = 10;
    end
    
    %userMax = max(Ytrain, [], 2);
    %Ytrain ./ repmat(userMax, 1, size(Ytrain,2));
    
    if (normalize)
        Ytrain = transformData(Ytrain);
        Ytest = transformTestData(Ytest);
    end
    
    if (lambda < 1 && ~normalize)
        lambda = lambda * 200;
    end
    
    size(Ytrain)
    size(Ytest)

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
            predicted(usrs(j), zeroArt(i)) = sum(orig(usrs(j), :)) ./ max(1, sum(orig(usrs(j), :) ~= 0));
            fprintf('something here\n');
        end
    end
    for i=1:length(zeroUsr)
        arts = find(Ytest(zeroUsr(i), :));
        for j=1:length(arts)
            predicted(zeroUsr(i), arts(j)) = sum(orig(:, arts(j))) ./ max(1, sum(orig(:, arts(j)) ~= 0));
        end
    end
    
    [usr, art] = find(Ytest);
    for i=1:length(usr)
         predicted(usr(i), art(i)) = min(predicted(usr(i),art(i)), max(max(orig(usr(i), :)), max(orig(:, art(i)))));
         proposition = max(predicted(usr(i), art(i)), min( ...
             min(orig(usr(i), (orig(usr(i), :) ~= 0))), ...
             min(orig(orig(:, art(i)) ~= 0, art(i)))));
         if (min(size(proposition)) > 0)
            predicted(usr(i), art(i)) = proposition;
         end
        % assert(predicted(usr(i), art(i)) >= 0);
    end
    
    %Ytrain = Ytrain .* repmat(userMax, 1, size(Ytrain,2));
    TestErr = logError(predicted, Ytest, normalize);
end
