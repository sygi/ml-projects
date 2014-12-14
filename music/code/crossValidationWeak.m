function [real,trainErr, prop] = crossValidation(train, social)
% running cross validation on some given algorithm
% only weak test for now
p = randperm(100);
p = p(1:3);
hidden = [8]; %linspace(5, 100, 10);
lds = [0.0006];
seeds = 2:7;
Ks = [5];
real = zeros(length(seeds),length(Ks));
trainErr = zeros(length(seeds), length(Ks));
for k=1:length(hidden)
K = 5;
for mySeed=1:length(seeds);
fprintf('new seed\n');
setSeed(floor(mySeed*4 + 13));
for current=1:1
    [D N] = size(train);
    perm = randperm(D);
    Nk = floor(D / K);
    err = zeros(1, K);
    err2 = zeros(1, K);
    fprintf('starting fold with %d hidden\n', hidden(k));
    for i = 1:K
        test_new = sparse([], [], [], D, N);
        train_new = train;
        test_new(perm(1:Nk), :) = train(perm(1:Nk), :);
        train_new(perm(1:Nk), :) = 0;
%         test_new(usrEntr(perm(1:Nk)), artEntr(perm(1:Nk))) = train(usrEntr(perm(1:Nk)), artEntr(perm(1:Nk)));
%         train_new = train;
%         train_new(usrEntr(perm(1:Nk)), artEntr(perm(1:Nk))) = 0;
        % run some classifier
        
        
         [err(i), pred] = estimateMeanPrediction(train_new, test_new);
         err(i);
         %err2(i) = estimateMeanPrediction(train_new, train_new)
%         mp(i) = err(i)
        %sm
        
         %[err(i), sm] = estimateMeanPrediction(train_new, test_new);
         %err(i)
         %err(i) = estimateNeighbourMean(train_new, social, test_new);
         %err(i)
%         [err(i), sm] = estimateMeanPrediction(train_new', train_new');
        
        %err(i) = estimateALSweak(train_new, test_new, social, lds(current), 42);
        %err(i)
        %[err(i), sm] = estimateMeanPrediction(train_new', train_new');
        %mp2(i) = err(i)
        %sm
        %err(i) = p(current) * estimateNeighbourMean(train_new, social, test_new) ...
        %    + (1-p(current)) * estimateMeanPrediction(train_new, test_new);
        %[err(i), pred] = estimateSlopeOne(train_new, test_new);
        %sp(i) = err(i)
        %[err(i), pred] = estimateSlopeOne(train_new', test_new');
        %sp2(i) = err(i)
        %err(i) = estimateALS(train_new, test_new, 41, lds(current));
        %al(i) = err(i)
        %err(i) = estimateALS(train_new',test_new', hidden(k), lds(current));
        %al2(i) = err(i)
        %[err(i), sm] = estimateKNN(train_new, test_new, 15, lds(current), 42);
        %kn(i) = err(i)
        %err(i) = estimateKNN(train_new', test_new', hidden(k), lds(current), 42);
        %kn2(i) = err(i)
        % err(i) = estimateCombiningAlgorithms(train_new, test_new, 50, 1e5);
        %fprintf('Mean Prediction: %f\nSlope one: %f\nAls: %f\nKNN prediction: %f\n', mp(i), sp(i), al(i), kn(i));
        %fprintf('error %f for lambda = %f\n', err(i), lds(current));
        perm = circshift(perm, [0, Nk]);
    end
    %fprintf('Mean Prediction: %f %f\nSlope one: %f %f\nAls: %f %f\nKNN prediction: %f %f\n', ...
    %    mean(mp), mean(mp2), mean(sp), mean(sp2), mean(al), mean(al2), mean(kn), mean(kn2));
    real(mySeed, k) = mean(err);
    real(mySeed, k)
end
end
end
