clear all;
load('data/Toronto_regression.mat');
categorical = 39:52;
myX_train = X_train;
for i = 1:length(categorical)
    values = unique(X_train(:, categorical(i)));
    for j = 1:length(values)
        myX_train(:,end+1) = X_train(:, categorical(i)) == values(j);
    end
end

for i = 1:length(categorical)
    myX_train = myX_train(:, [1:categorical(i)-1 (categorical(i)+1):end]);
    categorical = categorical - 1
end
