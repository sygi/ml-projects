% preprocess data, which includes: 
% normalization
% put some (like ~100 samples) data to vault and not touch it later
% remove outliers

% normalization
permute = randperm(length(X_train(:, 1)));
X_train = X_train(permute, :);
y_train = y_train(permute, :);
means = mean(X_train);
stds = std(X_train);

myX_test = X_test - repmat(means, length(X_test(:, 1)), 1);
myX_test = myX_test ./ repmat(stds, length(X_test(:, 1)), 1);

myX_train = normalize(X_train);

% put data to vault
permute = randperm(length(myX_train(:, 1)));
ind = permute(1:70);
vaultX = myX_train(ind, :);
vaultY = y_train(ind, :);
myX_train = myX_train(permute(71:end), :);
myY_train = y_train(permute(71:end), :);

% removing outliers
boxplot(myX_train, 'orientation', 'horizontal');
outliers = (abs(myX_train) > 5);
regular = logical(1 - max(outliers, [], 2));
myX_train = myX_train(regular, :);
myY_train = myY_train(regular, :);b

save('classifNormalized.mat', 'myX_test', 'myX_train', 'myY_train', 'vaultX', 'vaultY');

figure;
boxplot(myX_train, 'orientation', 'horizontal');
