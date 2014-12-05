function [error, prediction] = estimateMeanPrediction(train, test, unnormalize)
% predictor which just returns mean for each artist
    artists = sum(train) ./ max(1, sum(train ~= 0));
    prediction = sparse([], [], [], size(train,1), size(train, 2));
    [i1, j2] = find(test);
    for i=1:length(i1)
        prediction(i1(i), j2(i)) = artists(j2(i));
    end
    error = rsme(prediction, test, unnormalize);
end