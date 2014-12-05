function [error, real,trainErr] = crossValidation(train, social, normalize)
% running cross validation on some given algorithm
% only weak test for now
if (exist('normalize', 'var') && normalize)
    train = transformData(train);
end
p = randperm(100);
p = p(1:10);
real = zeros(length(p), 1);
for current=1:length(p)
    setSeed(p(current));
    K = current + 1;
    [D N] = size(train);
    entries = length(find(train));
    perm = randperm(entries);
    idx = find(train);
    Nk = floor(entries / K);
    err = zeros(1, K);
    trainErr = zeros(1,K);
    fprintf('starting %d fold\n', K);
    for i = 1:K
        test_new = sparse([], [], [], D, N);
        test_new(idx(perm(1:Nk))) = train(idx(perm(1:Nk)));
        train_new = train;
        train_new(idx(perm(1:Nk))) = 0;
        % run some classifier
        % err(i) = estimateMeanPrediction(train_new, test_new);
        %err(i) = p(current) * estimateNeighbourMean(train_new, social, test_new) ...
        %    + (1-p(current)) * estimateMeanPrediction(train_new, test_new);
        %err(i) = estimateSlopeOne(train_new, test_new)
        [err(i),trainErr(i)] = estimateALS(train_new,test_new,10);
        perm = circshift(perm, [0, Nk]);
    end
    real(current) = mean(err)
end
error = mean(real);