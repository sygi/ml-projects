clear all;
load('classifNormalized');
% Lambda = logspace(-2,2);
lambda = 10;
folds = 2:20;
ERR = zeros(length(folds),2);
for i = 1:length(folds);
    for j = 1:10
        ERR(i,:) = ERR(i, :) + crossValidation(myY_train,myX_train(:,:),folds(i),j,3,lambda);
    end
    fprintf('one fold\n');
    ERR(i, :) = ERR(i, :) / 10;
end

figure;
plot(folds,ERR(:,1),'LineWidth',2);
hold on;
plot(folds,ERR(:,2),'r','LineWidth',2);
