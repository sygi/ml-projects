clear all;
load('reg_dummy');
Lambda = logspace(-5,2);
ERR = zeros(length(Lambda),2);
for i = 1:length(Lambda);
    for j = 1:10
    ERR(i,:) = ERR(i,:) + crossValidationM(myY_train,[myX_train(:,1:38) myX_train(:,1:38).^2 myX_train(:,1:38).^4],4,10+j,1,Lambda(i))
    end
      ERR(i,:) = ERR(i,:) / 10;
    fprintf('one lambda\n');
end

figure;
semilogx(Lambda,ERR(:,1),'LineWidth',2);
hold on;
semilogx(Lambda,ERR(:,2),'r','LineWidth',2);
