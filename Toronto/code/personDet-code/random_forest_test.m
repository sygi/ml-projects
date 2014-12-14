function [pred,y] = estimateForest(X_trn,Y_trn,X_tst,paramiters)

  model = classRF_train(X_trn,Y_trn);
    
  test_options.predict_all = 1;
  [Y_hat, votes, prediction_pre_tree] = classRF_predict(X_tst,model,test_options);
  fprintf('\nexample 17: error rate %f\n',   length(find(Y_hat~=Y_tst))/length(Y_tst));