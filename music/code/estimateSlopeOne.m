function [error, prediction] = estimateSlopeOne(train, test)
%http://en.wikipedia.org/wiki/Slope_One
average = sum(train) ./ max(1, sum(sign(train))); % TODO: without user
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
        estimated = estimated + ratingDiffr(arts(i), listened(a)) + train(usrs(i), arts(i)) * counts(arts(i), listened(a));
    end
    prediction(usrs(i), arts(i)) = estimated / mySum;
end
error = rsme(test, prediction);

end

