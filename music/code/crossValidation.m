function [real,trainErr] = crossValidation(train, social, normalize)
% running cross validation on some given algorithm
% only weak test for now
if ~exist('normalize', 'var')
    normalize = false;
end
p = randperm(100);
p = p(1:3);
hidden = [1]; %linspace(5, 100, 10);
lds = [0.001];
if (~normalize)
    lds = lds .* 400000;
end
seeds = 11:12;
real = zeros(2,1);
K = 5;
for mySeed=1:length(seeds);
fprintf('new seed\n');
setSeed(floor(mySeed*7 + 4));
for current=1:1
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
        
        
        err(i) = estimateMeanPrediction(train_new, test_new, normalize);
        mp(i) = err(i)
        %err(i) = p(current) * estimateNeighbourMean(train_new, social, test_new) ...
        %    + (1-p(current)) * estimateMeanPrediction(train_new, test_new);
        err(i) = estimateSlopeOne(train_new, test_new, normalize);
        sp(i) = err(i)
        err(i) = estimateALS(train_new,test_new, 70, normalize, lds(current));
        al(i) = err(i)
        err(i) = estimateKNN(train_new, test_new, normalize, 10, lds(current), 50);
        kn(i) = err(i)
        % err(i) = estimateCombiningAlgorithms(train_new, test_new, 50, 1e5, normalize);
        fprintf('Mean Prediction: %f\nSlope one: %f\nAls: %f\nKNN prediction: %f\n', mp(i), sp(i), al(i), kn(i));
        fprintf('error %f for lambda = %f\n', err(i), lds(current));
        perm = circshift(perm, [0, Nk]);
    end
    fprintf('Mean Prediction: %f\nSlope one: %f\nAls: %f\nKNN prediction: %f\n', mean(mp), mean(sp), mean(al), mean(kn));
    real(mySeed) = mean(err)
end
end
