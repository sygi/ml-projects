clear all;
load('classifNormalized');
Lambda = logspace(-2,2);
ERR = zeros(length(Lambda),2);
for i = 1:length(Lambda);
%     for j = 1:10
    ERR(i,:) = ERR(i,:) + crossValidation(myY_train,[myX_train,abs(myX_train)],4,10,1,Lambda(i))
%     end
%     ERR(i,:) = ERR(i,:) / 10
    fprintf('one lambda\n');
end

figure;
semilogx(Lambda,ERR(:,1),'LineWidth',2);
hold on;
semilogx(Lambda,ERR(:,2),'r','LineWidth',);
