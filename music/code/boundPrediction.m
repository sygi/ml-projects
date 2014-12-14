function [new_prediction] = boundPrediction(predicted, trainData, testData)
%BOUND_PREDICTION for each prediction made increases or decreases it so
%that it fits the interval: [min_count_in_this_row_and_column,
%max_count_...]
[usr art] = find(testData);
for i=1:length(usr)
    predicted(usr(i), art(i)) = ...
        min(predicted(usr(i), art(i)), max(max(trainData(usr(i), :)), max(trainData(:, art(i)))));
    predicted(usr(i), art(i)) = ...
        max(predicted(usr(i), art(i)), min(min(trainData(usr(i), :)), min(trainData(:, art(i)))));
end
new_prediction = predicted;
end

