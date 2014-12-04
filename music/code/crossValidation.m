function [error, real] = crossValidation(train, social)
% running cross validation on some given algorithm
% only weak test for now
setSeed(4);
p = linspace(0.01, 0.9, 1);
real = zeros(length(p), 1);
for current=1:length(p)
    K = 5;
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
        %err(i) = estimateMeanPrediction(train_new, test_new);
        %err(i) = p(current) * estimateNeighbourMean(train_new, social, test_new) ...
        %    + (1-p(current)) * estimateMeanPrediction(train_new, test_new);
        err(i) = estimateSlopeOne(train_new, test_new)
        perm = circshift(perm, [0, Nk]);
    end
    real(current) = mean(err)
end