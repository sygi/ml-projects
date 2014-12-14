load train_feats
D = numel(feats{1});  % feature dimensionality
X = zeros([length(labels) D]);

for i=1:length(labels)
    X(i,:) = feats{i}(:);  % convert to a vector of D dimensions
end

labels = labels>0;

save('train_vector.mat','X','labels');