

%linear (best)
%[p,y] = crossValidation(labels(1:3000),X(1:3000,:),4,0.9,0.2);

% SVM linear make sense, quadratic make more sense, mlp make less :P
%rbf also don't make much sense
% [p,y] = crossValidation(labels(1:3000),X(1:3000,:),4,'linear',0.2);
% [p2,y] = crossValidation(labels(1:3000),X(1:3000,:),4,'quadratic',0.2);
% [p3,y] = crossValidation(labels(1:3000),X(1:3000,:),4,'mlp',0.2);
% [p4,y] = crossValidation(labels(1:3000),X(1:3000,:),4,'rbf',0.2);



randPred = rand(size(p));
methodNames = {'linear SVM','quandratic SVM', 'mlp SVM','rbf SVM','Random'}; % this is to show it in the legend
avgTPRList = evaluateMultipleMethods( y, [p,p2,p3,p4,randPred], true, methodNames );