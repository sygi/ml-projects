function [diffr count] = averageDifferenceOfArtistListenCounts(X)
%averageDifferenceOfArtistListenCounts - returns two square (artist x artist)
% matrices. diffr(i,j) denotes sum of differences in listen counts
% of artists i and j by the users that listened to both artists.
% count(i,j) denotes number of such users
[usrs arts] = size(X);
diffr = zeros(arts, arts);
count = zeros(arts, arts);
for a1=1:arts
    for a2=a1+1:arts
        common = intersect(find(X(:, a1)), find(X(:, a2))); % users that listened to both of them
        count(a1, a2) = length(common);
        count(a2, a1) = count(a1, a2);
        diffr(a1, a2) = sum(X(common, a1) - X(common, a2));
        diffr(a2, a1) = -diffr(a1, a2);
    end
end
end

