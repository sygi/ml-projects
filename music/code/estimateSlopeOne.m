function [error, prediction] = estimateSlopeOne(train, test)
%http://en.wikipedia.org/wiki/Slope_One
prediction = sparse([], [], [], size(train,1), size(train, 2));
[usrs, arts] = find(test);
if (size(train,2) > 2000)
    error = 1000;
    fprintf('breaking early\n');
    return;
end
[ratingDiffr, counts] = averageDifferenceOfArtistListenCounts(train);
fprintf('Calculated difference of ratings\n');
for i=1:length(usrs)
    i
    mySum = 0;
    estimated = 0;
    listened = find(train(usrs(i), :));
    for a=1:length(listened)
        mySum = mySum + counts(arts(i), listened(a));
        estimated = estimated + ratingDiffr(arts(i), listened(a)) + train(usrs(i), listened(a)) * counts(arts(i), listened(a));
    end
    if (mySum ~= 0)
        %fprintf('regular job\n');
        prediction(usrs(i), arts(i)) = estimated / mySum;
    else
        %fprintf('predicting the other way\n');
        artMean = sum(train(:, arts(i))) ./ max(1, sum(train(:, arts(i)) ~= 0));
        usrMean = sum(train(usrs(i), :)) ./ max(1, sum(train(usrs(i), :) ~= 0));
        prediction(usrs(i), arts(i)) = 1e-10;
        if ((artMean ~= 0) && (usrMean ~= 0))
            fprintf('here\n');
            prediction(usrs(i), arts(i)) = usrMean;
        elseif (artMean ~= 0)
            prediction(usrs(i), arts(i)) = artMean;
        else
            prediction(usrs(i), arts(i)) = usrMean;
        end
    end
    prediction = boundPrediction(prediction, train, test);
end
error = logError(prediction, test, train);
end

