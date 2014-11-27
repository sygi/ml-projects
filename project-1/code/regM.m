clear all;
load('reg_dummy')

newTrain = myX_train(:, 1:38);
beta = ridgeRegression(myY_train, addOnes([newTrain newTrain .^2 newTrain.^4]), 0);
load('Toronto_regression')

y_test = addOnes([myX_test(:,1:38),myX_test(:,1:38).^2,myX_test(:,1:38).^4])*beta;
csvwrite('predictions_regression.csv',y_test);
% 
% 
% rand = randperm(size(myX_train,1));
% data = rand(1:100);
% testDataX = myX_train(data, :);
% testDataY = myY_train(data, :);
% errTest = squareError(addOnes([testDataX(:, 1:38) testDataX(:, 1:38).^2 testDataX(:, 1:38).^4]),testDataY,beta)