clear all;
load('classifNormalized');
Lambda = logspace(-2,3);
ERR = zeros(length(Lambda),2);
for i = 1:length(Lambda);
    ERR(i,:) = crossValidation(myY_train,myX_train,4,20,0.5,Lambda(i));
end

figure;
semilogx(Lambda,ERR(:,1),'LineWidth',2);
hold on;
semilogx(Lambda,ERR(:,2),'r','LineWidth',2);
hold off;