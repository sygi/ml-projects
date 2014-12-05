function error = rsme(predicted, real, unnormalize)
%RSME error between predicted matrix and real test one

if (exist('unnormalize', 'var') && unnormalize)
    predicted = unTransformData(predicted, find(real));
    real = unTransformData(real, find(real));
end

idx = find(real);
error = 0;
wrong = 0;
for i=1:length(idx)
    if (predicted(idx(i)) == 0)
        wrong = wrong + 1;
    end
%    assert(predicted(idx(i)) ~= 0);
    if (predicted(idx(i)) - real(idx(i)) > 1e5)
        r = full(real(idx(i)));
        p = full(predicted(idx(i)));
        id = full(idx(i));
        fprintf('real %f predicted %f in place %d\n', r, p, id);
    end
    error = error + (predicted(idx(i)) - real(idx(i)))^2;
end
error = error / length(idx);
error = sqrt(error);
wrong
end