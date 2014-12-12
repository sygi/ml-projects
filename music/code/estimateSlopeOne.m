function [error, prediction] = estimateSlopeOne(train, test, normalize)
%http://en.wikipedia.org/wiki/Slope_One
if (normalize)
    train = transformData(train);
    test = transformTestData(test);
end
prediction = sparse([], [], [], size(train,1), size(train, 2));
[usrs, arts] = find(test);
[ratingDiffr, counts] = averageDifferenceOfArtistListenCounts(train);
fprintf('Calculated difference of ratings\n');
for i=1:length(usrs)
    mySum = 0;
    estimated = 0;
    listened = find(train(usrs(i), :));
    for a=1:length(listened)
        mySum = mySum + counts(arts(i), listened(a));
        estimated = estimated + ratingDiffr(arts(i), listened(a)) + train(usrs(i), listened(a)) * counts(arts(i), listened(a));
    end
    if (mySum ~= 0)
        prediction(usrs(i), arts(i)) = estimated / mySum;
    else
        prediction(usrs(i), arts(i)) = 1;
    end
         prediction(usrs(i), arts(i)) = min(prediction(usrs(i),arts(i)), max(max(train(usrs(i), :)), max(train(:, arts(i)))));
         mins = min( ...
             min(train(usrs(i), (train(usrs(i), :) ~= 0))), ...
             min(train(train(:, arts(i)) ~= 0, arts(i))));
         if min(size(mins)) > 0
         prediction(usrs(i), arts(i)) = max(prediction(usrs(i), arts(i)), min( ...
             min(train(usrs(i), (train(usrs(i), :) ~= 0))), ...
             min(train(train(:, arts(i)) ~= 0, arts(i)))));
         end
        % prediction(usrs(i), arts(i)) = max(prediction(usrs(i), arts(i)), 0);
        % assert(predicted(usr(i), art(i)) >= 0);
end
error = logError(prediction, test, normalize);
end

