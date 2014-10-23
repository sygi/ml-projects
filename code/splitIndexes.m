function Idx = splitIndexes(N,k,seed)
% splitIndexes - splits indexes 1:N into k sets


if ~exist('seed', 'var')
    seed = 1;
end
setSeed(seed);
idx = randperm(N);
Nk = floor(N/k);
for i = 1:k
    Idx(i,:) = idx(1+(i-1)*Nk:i*Nk);
end
end