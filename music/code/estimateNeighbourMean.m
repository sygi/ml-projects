function [error, prediction] = estimateNeighbourMean(train, Gtrain, test)
%ESTIMATE_NEIGHBOUR_MEAN estimate number of listen counts as a mean of
%friends listen count
    prediction = sparse([], [], [], size(train,1), size(train, 2));
    [usrs, arts] = find(test);
    for i=1:length(usrs)
        nei = neighbours(Gtrain, usrs(i), 1);
        values = train(nei, arts(i));
        prediction(usrs(i), arts(i)) = sum(values) ./ max(1, sum(sign(values)));
    end
    error = logError(test, prediction, false);
end

