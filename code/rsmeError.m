function err = rsmeError(x, y, beta)
%RSME error
err = sum((y - sigmoid(x*beta)) .^ 2)/ length(y);
err = sqrt(err);

end

