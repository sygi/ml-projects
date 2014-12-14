function X = normalize(X,m,st)
%NORMALIZE - normalize data by setting mean to 0 and std to 1

X = X - repmat(m, length(X(:, 1)), 1);
X = X ./ repmat(st, length(X(:, 1)), 1);

end

