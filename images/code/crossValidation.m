function [predictionTest,predictionTrain,y] = crossValidation(y,X,k,parameter,...
                                                treshold,seed,normalized)
%       generic cross-validation 
%
%       prediction,y_test] =
%       crossValidation(y,X,k,parameter,seed,normalize,treshold)


if ~exist('seed', 'var')
    seed = 1;
end

if ~exist('normalize','var')
    normalized = false;
end

if ~exist('treshold','var')
    treshold = 0;
end


%prepering data to split
setSeed(seed);
N = length(y);
Nk = floor(N/k);
idx = randperm(Nk*k)';
y = y(1:Nk*k);
X = X(1:Nk*k,:);
% pred = zeros(Nk,k);
predictionTest = zeros(Nk*k,1);
predictionTrain = zeros(Nk*k,k);
fprintf('stating %d-fold cross-validation\n',k);

    for i = 1:k
        fprintf('new fold\n');
        y_test = y(idx(1:Nk));
        X_test = X(idx(1:Nk),:);
        y_train = y(idx(Nk+1:end));
        X_train = X(idx(Nk+1:end),:);
        if (normalized)
            X_train = normalize(X_train,mean(X_train),std(X_train));
            X_test = normalize(X_test,mean(X_train),std(X_train));
        end
        %takin only the most correlated part of data:
        c = abs(corr(y_train,X_train));
        X_train = X_train(:,c>treshold);
        X_test = X_test(:,c>treshold);
      %estimating the probabilities
        [predictionTest(idx(1:Nk)),predictionTrain(idx(Nk+1:end),i)]=estimateSVM(X_train,y_train,X_test,parameter);
         %[predictionTest(idx(1:Nk)),predictionTrain(idx(Nk+1:end),i)]=estimateLogisticReg(X_train,y_train,X_test,parameter);
      %test prediction
        %prediction(idx(1:Nk))=y_test;
        %[predictionTest(idx(1:Nk)),predictionTrain(idx(Nk+1:end),i)]=estimateForest(X_train,y_train,X_test,parameter);
      %new better SVM
        [predictionTest(idx(1:Nk)),predictionTrain(idx(Nk+1:end),i)] = estimateSVMLib(X_train,y_train,X_test,y_test,parameter);
      %here add other estimate somethingtr
        idx = circshift(idx,[Nk, 0]);
    end
    predictionTrain = mean(predictionTrain,2);
    
end