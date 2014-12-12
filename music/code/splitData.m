% The following script creates two kinds of test sets
% Ytest_strong contains pairs for new users to test (the non-zero entries).
% Ytest_weak contains pairs for existing users to test (the non-zero entries).
% Gstrong contains the friendship information of new users with all users
% Ytrain_new and Gtrain_new is the new training set 
clear all;
load songTrain;

% Test data for Strong generalization
% keep 10% of users for testing as 'new users'
% You should decide on your own how many new users you want to test on
setSeed(1);
nU = size(Ytrain,1);
idx = randperm(nU);
nTe = floor(nU*0.1); 
idxTe = idx(1:nTe);
idxTr = idx(nTe+1:end);
Ytrain_new = Ytrain(idxTr,:);
Ytest_strong = Ytrain(idxTe,:);
Gtrain_new = Gtrain(idxTr, idxTr);
Gstrong = Gtrain(idxTe, [idxTr idxTe]);

% Test data for weak generalization
% Keep 10 entries per existing user as test data
[D N] = size(Ytrain_new);
numD = 5; % number of artists held out per user
dd = [];
nn = [];
yy = [];
for n = 1:N
    On = find(Ytrain_new(:,n)~=0);
    if length(On)>10
        ind = unidrnd(length(On),numD,1); % choose some for testing
        d = On(ind);
        dd = [dd; d];
        nn = [nn; n*ones(numD,1)];
        yy = [yy; Ytrain_new(d,n)];
    end
end
Ytest_weak = sparse(dd,nn,yy,D,N);
Ytrain_new(sub2ind([D N], dd, nn)) = 0;
