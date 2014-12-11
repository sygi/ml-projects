lambda = 0.9;
%linear (best)
[p,y] = linear(labels,X,4,lambda,0.2);
% SVM linear make sense, quadratic make more sense, mlp make less :P
%
% [p,y] = estimateROC_SVM(labels,X,4,'rbf',0.2,4000);
randPred = rand(size(p));
methodNames = {'SVM', 'Random'}; % this is to show it in the legend
avgTPRList = evaluateMultipleMethods( y, [p,randPred], true, methodNames );