
permutacja = randperm(length(labels));
permutacja = permutacja(1:4000);

%pen. logistic regression (best) 0.8 (for svd) some nice plots^^
%p3 = estimateLogisticReg(U(permutacja,:),labels(permutacja),U(permutacja,:),1);
%p4 = estimateLogisticReg(U(permutacja(1:2000),:),labels(permutacja(1:2000)),U(permutacja(1:2000),:),1);

%[p1,p2,y] = crossValidation(labels(permutacja),U(permutacja,1:120),4,0.1);
%p3 = p3(1:2000);
%p = p(1:2000);
%y = y(1:2000);

%linear SVM - sth about 0.8, svd 0.78
[p1,p2,y] = crossValidation(labels(permutacja),U(permutacja,1:500),4,'gaussian');
%[p2,~] = crossValidation(labels(permutacja),U(permutacja,:),4,'gaussian');

%those trees 0.5 with svm 0.77 (looks like deafoult trees works the best)
%[p1,~] = crossValidation(labels(permutacja),U2(permutacja,:),4,[0,0]);
%[trees,variables]
%[p3,y] = crossValidation(labels(permutacja),U2(permutacja,:),4,[0,0]);
%[p1,p2,y] = crossValidation(labels(permutacja),U2(permutacja,:),10,[1000,0]);

randPred = rand(size(y));
methodNames = {'test','train','random'}; % this is to show it in the legend
avgTPRList = evaluateMultipleMethods(y, [p1,p2,randPred], true, methodNames);

