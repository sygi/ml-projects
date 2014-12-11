function [error, prediction] = estimateMeanPrediction(train, test, normalize)
% predictor which just returns mean for each artist
if (normalize)
    train = transformData(train);
    test = transformTestData(test);
end
    artists = sum(train) ./ max(1, sum(train ~= 0));
    prediction = sparse([], [], [], size(test,1), size(test, 2));
    [i1, j2] = find(test);
    for i=1:length(i1)
        if artists(j2(i)) == 0
            prediction(i1(i), j2(i)) = sum(train(i1(i), :)) ./ max(1, sum(train(i1(i), :) ~= 0));
            prediction(i1(i), j2(i)) = 1;
        else
            prediction(i1(i), j2(i)) = artists(j2(i));
        end
    end
    error = logError(prediction, test, normalize);
end