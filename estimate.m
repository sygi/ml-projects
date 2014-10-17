function y_test = estimate(X_train, y_train, X_test, predictor)
%ESTIMATE - estimates y_test based on X_test, using predictor
X_train = normalize(X_train);
y_test = predictor(X_train, y_train, X_test);

end

