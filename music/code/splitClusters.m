function [cluster, Null, Small, Rest] = splitClusters(X)
% split (user, artist) matrix into 3 clusters (by columns):
% 1. artists with 0 listen counts
% 2. artists with < 51 listen counts
% 3. artists with >= 51 listen counts
% cluster is length(artists) a row vector having number of cluster
% of each X column, Null, Small and Rest are X submatrices for different
% clusters.

split = 51;

artists = sum(X);
zeroCounts = (artists == 0);
Null = X(:, zeroCounts);
assert(sum(sum(Null, 1), 2) == 0);

smallCounts = artists > 0 & artists < split;
Small = X(:, smallCounts);

bigCounts = artists >= split;
Rest = X(:, bigCounts);

cluster = zeros(1, size(X, 2));
cluster(zeroCounts) = 1;
cluster(smallCounts) = 2;
cluster(bigCounts) = 3;


assert(sum(zeroCounts) + sum(smallCounts) + sum(bigCounts) == size(X, 2));
assert(sum(cluster == 0) == 0);