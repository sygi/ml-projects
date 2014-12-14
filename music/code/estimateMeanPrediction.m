function [error, prediction] = estimateMeanPrediction(train, test)
% predictor which just returns mean for each artist
    artists = sum(train) ./ max(1, sum(train ~= 0));
    prediction = sparse([], [], [], size(test,1), size(test, 2));
    [i1, j2] = find(test);
    for i=1:length(i1)
        if artists(j2(i)) == 0
            continue;
            prediction(i1(i), j2(i)) = sum(train(i1(i), :)) ./ max(1, sum(train(i1(i), :) ~= 0));
            if (prediction(i1(i), j2(i)) == 0)
                prediction(i1(i), j2(i)) = 1e-10;
                fprintf('giving zero\n');
            end
        else
            prediction(i1(i), j2(i)) = artists(j2(i));
        end
    end
    [error, dist] = logError(prediction, test, train);
    %drawErrorDistribution(dist', train', 'mean prediction');
end