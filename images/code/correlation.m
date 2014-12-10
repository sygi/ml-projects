load train_feats
D = numel(feats{1});  % feature dimensionality
X = zeros([length(labels) D]);

for i=1:length(labels)
    X(i,:) = feats{i}(:);  % convert to a vector of D dimensions
end

break;

c = corr(labels,X); 
c = reshape(c,26,10,36);

figure;
im(hogDraw(c,100));
    colormap gray;
    axis off;
    colorbar off;
% print -dpdf 'averagePerson.pdf'
    
ca = abs(c);
    
figure;
for i=1:36
    subplot(3,12,i);
    imagesc(ca(:,:,i));
        axis off;
end
B=colorbar; 
set(B, 'Position', [.91 .11 .04 .815]);

% print -dpdf 'absoluteCorelation.pdf'

% c_sum = sum(c,3);
% figure;
% imagesc(c_sum);


