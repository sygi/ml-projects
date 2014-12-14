
X_test = zeros(size(feats,1),numel(feats{1}));

for i=1:size(feats,1)
    X_test(i,:) = feats{i}(:);  % convert to a vector of D dimensions
end