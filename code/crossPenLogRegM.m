clear all;
load('classifNormalized');
Lambda = logspace(-1,-0.1);
ERR = zeros(length(Lambda),2);
for i = 1:length(Lambda);
    ERR(i,:) = crossValidation(myY_train,myX_train(:,:),10,42,1,Lambda(i));
end

figure;
hold off;
plot(Lambda,ERR(:,1),'LineWidth',2);
hold on;
plot(Lambda,ERR(:,2),'r','LineWidth',2);
