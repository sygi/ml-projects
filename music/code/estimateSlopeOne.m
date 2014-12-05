function [error, prediction] = estimateSlopeOne(train, test)
%http://en.wikipedia.org/wiki/Slope_One
prediction = sparse([], [], [], size(train,1), size(train, 2));
[usrs, arts] = find(test);
[ratingDiffr counts] = averageDifferenceOfArtistListenCounts(train);
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
end
error = rsme(test, prediction, true);

end

