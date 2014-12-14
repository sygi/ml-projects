function [error, distribution, smallErr] = logError(predicted, real, train)
%LOG_ERROR between predicted matrix and real test one

assert(all(size(real) == size(predicted)));
idx = find(real);
[usr, art] = find(real);
error = 0;
tooBig = 0;
tooSmall = 0;
tb = [];
ts = [];
lim = 20;
smallErr = 0;
smallNo = 0;
artists = sum(train);
distribution = sparse([],[],[],size(predicted,1), size(predicted,2));
for i=1:length(idx)
    if (false && (predicted(idx(i)) - real(idx(i)))^2 > 2)
        if (predicted(idx(i)) > real(idx(i)))
            tooBig = tooBig + 1;
            tb = [tb; real(idx(i))];
        else
            tooSmall = tooSmall + 1;
            ts = [ts; real(idx(i))];
        end
        r = full(real(idx(i)));
        p = full(predicted(idx(i)));
        id = full(idx(i));
        fprintf('err %f real %f predicted %f in place (%d, %d)\n', (r-p)^2, r, p, full(usr(i)), full(art(i)));
    end
    distribution(idx(i)) = (predicted(idx(i)) - real(idx(i)));
    error = error + (predicted(idx(i)) - real(idx(i))) .^ 2;
    if (artists(art(i)) < lim)
        smallErr = smallErr + distribution(idx(i)).^2;
        smallNo = smallNo + 1;
    end
end
error = error / length(idx);
smallErr = smallErr / smallNo;
end