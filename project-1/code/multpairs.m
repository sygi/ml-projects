function Y = multpairs(X)
col = size(X, 2);
Y = [];
for i = 1:col
    for j = i:col
        Y(:, end+1) = X(:, i) .* X(:, j);
    end
end
end