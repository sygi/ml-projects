function [C, u, a] = getAddress(user, artist, clusters)
% get listen count of artist by user, knowing that data is decomposed into
% three clusters: null, small and big (in this order)
C = clusters(artist);
clusters = clusters(1:artist);
a = sum(clusters == C);
u = user;

end

