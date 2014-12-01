function error = crossValidation(train)
% running cross validation on some given algorithm
% only weak test for now
setSeed(10);

K = 50;
train_new = train;
[D N] = size(train_new);
entries = length(find(train));
perm = randperm(entries);
idx = find(train);
Nk = floor(entries / K);
err = zeros(1, K);

for i = 1:K
    test_new = sparse([], [], [], D, N);
    test_new(idx(perm(1:Nk))) = train(idx(perm(1:Nk)));
    train_new = train;
    train_new(idx(perm(1:Nk))) = 0;
    % run some classifier
    err(i) = estimateMeanPrediction(train_new, test_new);
    
    perm = circshift(perm, [0, Nk]);
end

error = mean(err)

end