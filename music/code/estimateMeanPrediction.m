function [error, prediction] = estimateMeanPrediction(train, test)
% predictor which just returns mean for each artist
    artists = sum(train) ./ max(1, sum(sign(train)));
    prediction = sparse([], [], [], size(train,1), size(train, 2));
    [i1, j2] = find(test);
    for i=1:length(i1)
        prediction(i1(i), j2(i)) = artists(j2(i));
    end
    error = rsme(test, prediction);
end