function err = o1Error(x, y, beta)
    y_hat = zeros(size(y));
    pred = sigmoid(x*beta);
    y_hat((pred > 0.5)) = 1;
    err = sum(abs(y-y_hat))/length(y);
end