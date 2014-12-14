function [error] = rsme(predicted, real, unnormalize)
%RSME error between predicted matrix and real test one
%global maxListen;
if (exist('unnormalize', 'var') && unnormalize)
    fprintf('unNormalizing\n');
    predicted = unTransformData(predicted, find(real));
    real = unTransformData(real, find(real));
end
assert(all(size(real) == size(predicted)));
idx = find(real);
[usr, art] = find(real);
error = 0;
wrong = 0;
for i=1:length(idx)
    if (predicted(idx(i)) <= 0)
        wrong = wrong + 1;
        %usr(i)
        %art(i)
        %predicted(idx(i))
    end
    if (abs(predicted(idx(i)) - real(idx(i))) > 1e5)
        r = full(real(idx(i)));
        p = full(predicted(idx(i)));
        id = full(idx(i));
        fprintf('err %f real %f predicted %f in place (%d, %d)\n', (r-p)^2, r, p, full(usr(i)), full(art(i)));
    end
    error = error + (predicted(idx(i)) - real(idx(i)))^2;
end
error = error / length(idx);
error = sqrt(error);
wrong;
end