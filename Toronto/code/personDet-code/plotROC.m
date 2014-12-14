
%permutacja = randperm(length(labels));
%permutacja = permutacja(1:4000);

%pen. logistic regression (best) 0.8 (for svd) some nice plots^^
%p3 = estimateLogisticReg(U(permutacja,:),labels(permutacja),U(permutacja,:),1);
%p4 = estimateLogisticReg(U(permutacja(1:2000),:),labels(permutacja(1:2000)),U(permutacja(1:2000),:),1);

%[plog,plog2,y] = crossValidation(labels(permutacja),U(permutacja,1:120),4,0.1);
%p3 = p3(1:2000);
%p = p(1:2000);
%y = y(1:2000);

%linear SVM - sth about 0.8, svd 0.78
[p1,p2,y] = crossValidation(labels(permutacja),U(permutacja,column(1:120)),10,' -g 2.0 -c 256');
%[p2,~,~] = crossValidation(labels(permutacja),U(permutacja,column(1:120)),10,'-t 0 -c 32');
%[p3,~,~] = crossValidation(labels(permutacja),U(permutacja,column(1:120)),10,'-g 2.0 -c 220');
%[p5,p6,~] = crossValidation(labels(permutacja),U(permutacja,column(1:200)),10,'-g 2.0 -c 256');
%[p7,p8,y] = crossValidation(labels(permutacja),U(permutacja,column(1:200)),10,'-g 2.0 -c 300');
%[p2,~] = crossValidation(labels(permutacja),U(permutacja,:),4,'gaussian');

%those trees 0.5 with svm 0.77 (looks like deafoult trees works the best)
%[p1,~] = crossValidation(labels(permutacja),U2(permutacja,:),4,[0,0]);
%[trees,variables]
%[pfor,pfor2,y] = crossValidation(labels(permutacja),U(permutacja,column(1:100)),4,[2000,0]);
%[pfor3, pfor4,y] = crossValidation(labels(permutacja),U(permutacja,column(1:100)),4,[2000,0]);
%[p1,p2,y] = crossValidation(labels(permutacja),U2(permutacja,:),10,[1000,0]);

randPred = rand(size(y));
methodNames = {'rbf test','rpf train'}; % this is to show it in the legend
avgTPRList = evaluateMultipleMethods(y, [p1,p2], true, methodNames);

