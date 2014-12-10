function [error, real,trainErr] = crossValidation(train, social, normalize)
% running cross validation on some given algorithm
% only weak test for now
if ~exist('normalize', 'var')
    normalize = false;
end
train = train(:, sum(train) ~= 0);
train = train(sum(train,2) ~= 0, :);
%maxListen = max(train, [], 2);
%for u=1:size(train,1)
%    train(u, :) = train(u, :) ./ maxListen(u);
%end
    
if (normalize)
    train = transformData(train);
end

% for u=1:size(train,1)
%     listenSums(u)=max(1,sum(train(u,:)));
%     train(u,:) = train(u,:) ./ max(1,sum(train(u,:)));
% end
p = randperm(100);
p = p(1:3);
hidden = [1]; %linspace(5, 100, 10);
lds = [0.001];
if (~normalize)
    lds = lds .* 2000;
end
real = zeros(length(lds), 1);
K = 5;
for mySeed=1:2
fprintf('new seed\n');
setSeed(floor(mySeed*3 + 14));
for current=1:length(lds)
    fprintf('starting lambda %f\n', lds(current));
    %K = current + 3;
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
        % err(i) = estimateMeanPrediction(train_new, test_new, normalize);
        %err(i) = p(current) * estimateNeighbourMean(train_new, social, test_new) ...
        %    + (1-p(current)) * estimateMeanPrediction(train_new, test_new);
        %err(i) = estimateSlopeOne(train_new, test_new)
        err(i) = estimateALS(train_new,test_new, 15, normalize, lds(current));
        fprintf('error %f for lambda = %f\n', err(i), lds(current));
        perm = circshift(perm, [0, Nk]);
    end
    real(current) = real(current) + mean(err);
end
end
real = (real ./ 2)