


permutacja = randperm(length(labels));
permutacja = permutacja(1:1000);
%pen. logistic regression (best) 0.7
%[plinear,y] = crossValidation(labels(permutacja),X(permutacja,:),4,0.8,0.1);
%linear SVM - sth about 0.8
%[p1,y] = crossValidation(labels(permutacja),X(permutacja,:),4,'linear');
[p2,y] = crossValidation(labels(permutacja),X(permutacja,:),4,'gaussian');


randPred = rand(size(y));
methodNames = {'linear','gausian','random'}; % this is to show it in the legend
avgTPRList = evaluateMultipleMethods(y, [p1,p2,randPred], true, methodNames );