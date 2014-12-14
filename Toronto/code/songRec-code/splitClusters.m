function [cluster, Null, Small, Rest] = splitClusters(X, split1, split2)
% split (user, artist) matrix into 3 clusters (by columns):
% 1. artists with < split1 listen counts
% 2. artists with >= split1 and < split2 listen counts
% 3. artists with >= split2 listen counts
% cluster is a length(artists) row vector having number of cluster
% of each X column.
% Null, Small and Rest are X submatrices for different clusters.

artists = sum(X);
zeroCounts = (artists < split1);
Null = X(:, zeroCounts);

smallCounts = (artists >= split1) & (artists < split2);
Small = X(:, smallCounts);

bigCounts = artists >= split2;
Rest = X(:, bigCounts);

cluster = zeros(1, size(X, 2));
cluster(zeroCounts) = 1;
cluster(smallCounts) = 2;
cluster(bigCounts) = 3;

assert(sum(zeroCounts) + sum(smallCounts) + sum(bigCounts) == size(X, 2));
assert(sum(cluster == 0) == 0);