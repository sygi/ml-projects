function error = estimateCombiningAlgorithms(train, test, split1, split2, normalize)
%ESTIMATECOMBININGALGORITHMS - estimate testing error using combination
% of different algorithms. First, makes a clusterization of the data.

if ~exist('normalize', 'var')
    normalize = false;
end

%userMax = max(train, [], 2);
%train = train ./ repmat(userMax, 1, size(train, 2));

dataForBig = train(:, sum(train) > 1e4);
if (normalize)
    transformData(train); % counts mean and std
    test = transformTestData(test);
end

[clusters, smallTr, middleTr, bigTr] = splitClusters(train, split1, split2);

if (normalize)
    train = transformTestData(train);
    smallTr = transformTestData(smallTr);
    middleTr = transformTestData(middleTr);
    bigTr = transformTestData(bigTr);
    dataForBig = transformTestData(dataForBig);
end

smallTe = test(:, clusters == 1);
middleTe = test(:, clusters == 2);
bigTe = test(:, clusters == 3);
fprintf('Calculated clusters, sizes %d %d %d\n', full(sum(smallTr(:) ~= 0)), full(sum(middleTr(:) ~= 0)), full(sum(bigTr(:) ~= 0)));

[smallErr, smallPre] = estimateMeanPrediction(train, smallTe, false);
if (normalize)
    lambda = 0.001;
else
    lambda = 200;
end
fprintf('Error on small dataset %f\n', smallErr);
[middleErr, middlePre] = estimateALS(middleTr, middleTe, 15, false, lambda);
fprintf('Error on middle dataset %f\n', middleErr);
%[middleErr, middlePre] = estimateMeanPrediction(middleTr, middleTe, normalize);
% bigTr = train(:, clusters > 1);
%[bigErr, bigPre] = estimateSlopeOne(bigTr, bigTe, false);
[bigErr, bigPre] = estimateALS(bigTr, bigTe, 70, false, lambda);
fprintf('Error on big dataset %f\n', bigErr);

fprintf('Calculated algorithms, got errors: %f %f %f\n', smallErr, middleErr, bigErr);

prediction = sparse([], [], [], size(train,1), size(train, 2));
prediction(:, clusters == 1) = smallPre;
prediction(:, clusters == 2) = middlePre;
prediction(:, clusters == 3) = bigPre;

% prediction = prediction .* repmat(userMax, 1, size(train, 2));
error = logError(prediction, test, normalize);

end

