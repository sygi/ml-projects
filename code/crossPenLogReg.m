clear all;
load('classifNormalized');
lambda = logspace(-2, 1);
ERR = zeros(length(lambda),2);
for i = 1:length(lambda)
    lambda(i)
    for j = 1:10
    ERR(i,:) = ERR(i,:) + crossValidation(myY_train,myX_train(:,:),2,j + 10*i,1,lambda(i));
    end
    ERR(i,:) = ERR(i, :) / 10;
    fprintf('one lambda\n');
end

figure;
semilogx(lambda,ERR(:,1),'LineWidth',2);
hold on;
semilogx(lambda,ERR(:,2),'r','LineWidth',2);
