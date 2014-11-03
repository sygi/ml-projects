function tX = addOnes(X)
%ADD ONES - adds a column of ones in front of X
tX = [ones(length(X(:, 1)), 1) X];
end