function err = squareError(x,y,beta)

    N = length(y);
    err = (y - x*beta)'*(y-x*beta)/N;
    err = sqrt(err);
   
end