function [Ytrain_new, Ytest_weak] = splitDataFunction(Ytrain, artPerUser, seed)
% The following script creates two kinds of test sets
% Ytest_strong contains pairs for new users to test (the non-zero entries).
% Ytest_weak contains pairs for existing users to test (the non-zero entries).
% Gstrong contains the friendship information of new users with all users
% Ytrain_new and Gtrain_new is the new training set 

% Test data for Strong generalization
% keep 10% of users for testing as 'new users'
% You should decide on your own how many new users you want to test on
if (~exist('artPerUser', 'var'))
    artPerUser = 5;
end
if (~exist('seed', 'var'))
    seed = 132;
end
setSeed(seed);
nU = size(Ytrain,1);
idx = randperm(nU);
idxTr = idx(1:end);
Ytrain_new = Ytrain(idxTr,:);

% Test data for weak generalization
% Keep 10 entries per existing user as test data
[D N] = size(Ytrain_new);
numD = artPerUser; % number of artists held out per user
dd = [];
nn = [];
yy = [];
for n = 1:N
    On = find(Ytrain_new(:,n)~=0);
    if (length(On)>20)
        ind = unidrnd(length(On),numD,1); % choose some for testing
        d = On(ind);
        dd = [dd; d];
        nn = [nn; n*ones(numD,1)];
        yy = [yy; Ytrain_new(d,n)];
    end
end
Ytest_weak = sparse(dd,nn,yy,D,N);
Ytrain_new(sub2ind([D N], dd, nn)) = 0;
