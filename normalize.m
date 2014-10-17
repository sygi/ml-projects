function X = normalize(X)
%NORMALIZE - normalize data by setting mean to 0 and std to 1

X_mean = mean(X);
X = X - repmat(X_mean, length(X(:, 1)), 1);

X_std = std(X);
X = X ./ repmat(X_std, length(X(:, 1)), 1);

end

