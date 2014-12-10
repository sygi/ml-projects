load train_feats
D = numel(feats{1});  % feature dimensionality
X = zeros([length(labels) D]);

for i=1:length(labels)
    X(i,:) = feats{i}(:);  % convert to a vector of D dimensions
end

c = corr(labels,X);
l2 = labels(1:1000);
X2 = X(1:1000,abs(c)>0.25);
size(X2)

ThisStupidError = crossValidationM(l2,X2,2,10,1,1);