[U, S, V]=svds(X,1000);
diagS = diag(S);
save 'svd1000.mat' 'U' 'diagS'
