lambda = 0.9;
[linearPred1,y] = linear(labels,X,4,lambda,0.2);
randPred = rand(size(linearPred1));
methodNames = {'Linear1', 'Random'}; % this is to show it in the legend
avgTPRList = evaluateMultipleMethods( y, [linearPred1,randPred], true, methodNames );