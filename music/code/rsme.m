function error = rsme(predicted, real)
%RSME error between predicted matrix and real test one
idx = find(real);
error = 0;
for i=1:length(idx)
    assert(predicted(idx(i)) ~= 0);
    error = error + (predicted(idx(i)) - real(idx(i)))^2;
end
error = error / length(idx);
error = sqrt(error);
end