clear;
load('classifNormalized.mat');
y = y_train;
x = [ones(length(y),1),X_train(:,[9])];
beta = logisticRegression(y,x,1,1000);
ran = randperm(length(x(:, 1)));
ran(1:100);
data = x(ran(1:100), :);
size(data)
yHat = 2*sigmoid(data*beta)-1;
% figure;
% plot(x(yHat<0,2),x(yHat<0,3),'og');
hold on;
% plot(x((yHat>0),2),x((yHat>0),3),'ob');
% plot(x((y==-1),2),x((y==-1),3),'+g');
% plot(x((y==1),2),x((y==1),3),'+b');
hold off;
logisticRegressionM(y,x,1,400);
