clear all;
load('classifNormalized');
Lambda = logspace(-2,2);
ERR = zeros(length(Lambda),2);
for i = 1:length(Lambda);
%     for j = 1:10
    ERR(i,:) = ERR(i,:) + crossValidation(myY_train,myX_train(:,:),10,10,1,Lambda(i));
%     end
%     ERR(i,:) = ERR(i,:) / 10
    fprintf('one lambda\n');
end


semilogx(Lambda,ERR(:,1),'LineWidth',1);
hold on;
semilogx(Lambda,ERR(:,2),'r','LineWidth',1);
