function [error, small, prediction, distribution] = estimateALSweak(train, test, social, lambda, hidden)
%estimates knn error using lower rank approximation got by ALS

orig = train;
train = train(:, any(train ~= 0));
train = train(any(train ~= 0, 2), :);
    
maxIter = 40;
[A,U] = ALS(train,hidden,lambda,maxIter);
% TestErr = alsError(A,U,Ytest);
A2 = zeros(size(A,1), size(test, 2));
U2 = zeros(size(U,1), size(test, 1));
A2(:, any(orig ~= 0)) = A;
U2(:, any(orig ~= 0, 2)) = U;

prediction = sparse([], [], [], size(test,1), size(test,2));
[usr, art] = find(test);

for i=1:length(usr)
    nei = neighbours(social, usr(i), 1);
    neiNumber = 0;
    meanUserVector = zeros(size(U2,1), 1);
    
    for j=1:length(nei)
        if (all(U2(:, nei(j)) == 0))
            fprintf('zero vector!\n');
        else
            meanUserVector = meanUserVector + U2(:, nei(j));
            neiNumber = neiNumber + 1;
        end
    end
    if (neiNumber == 0)
        prediction(usr(i), art(i)) = sum(orig(:, art(i))) ./ max(1, sum(orig(:, art(i)) ~= 0));
    else
        meanUserVector = meanUserVector ./ neiNumber;
        prediction(usr(i), art(i)) = meanUserVector' * A2(:, art(i));
    end
end

prediction = boundPrediction(prediction, orig, test);

[error, distribution, small] = logError(prediction, test, orig);
%drawErrorDistribution(distribution', orig', 'distribution of error using estimateALSweak');
end