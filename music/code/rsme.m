function error = rsme(predicted, real, unnormalize)
%RSME error between predicted matrix and real test one

if (exist('unnormalize', 'var') && unnormalize)
    predicted = unTransformData(predicted);
    real = unTransformData(real);
end

idx = find(real);
error = 0;
wrong = 0;
for i=1:length(idx)
    if (predicted(idx(i)) == 0)
        wrong = wrong + 1;
    end
%    assert(predicted(idx(i)) ~= 0);
    error = error + (predicted(idx(i)) - real(idx(i)))^2;
end
error = error / length(idx);
error = sqrt(error);
wrong
end