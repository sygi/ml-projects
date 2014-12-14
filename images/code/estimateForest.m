function [predTest,predTrain] = estimateForest(X_trn,Y_trn,X_tst,paramiters)
  
  Y_trn = Y_trn +1;
  
  model = classRF_train(X_trn,Y_trn,paramiters(1),paramiters(2));
    
  test_options.predict_all = 1;
  [~, ~, prediction_pre_tree] = classRF_predict(X_trn,model,test_options);
  predTrain = mean(prediction_pre_tree,2);
  %trErr = sum((Y_trn-pred).^2);
  %trErr = sqrt(trErr/length(Y_trn))
  
  [~, ~, prediction_pre_tree] = classRF_predict(X_tst,model,test_options);
  predTest = mean(prediction_pre_tree,2) -1;
  %teErr = sum((Y_tst-pred).^2);
  %teErr = sqrt(teErr/length(Y_tst))
  
end