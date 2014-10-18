function l = logisticLikelihood(y,tX,beta)
    l = y'*tX*beta - sum(log(1+exp(tX*beta)));
    l = -l;
end