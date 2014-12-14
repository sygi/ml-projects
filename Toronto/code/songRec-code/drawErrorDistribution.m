function drawErrorDistribution(distribution, train, methodName)
threshold = 0;
artSum = sum(train ~= 0);
[usr, art] = find(distribution);
errN = []; errB = []; errS = [];
artN = []; artS = []; artB = [];
for i=1:length(art)
    err = distribution(usr(i), art(i)).^2;
    if (err < threshold)
        errN = [errN; err];
        artN = [artN; artSum(art(i))];
    elseif distribution(usr(i), art(i)) > 0
        errB = [errB; err];
        artB = [artB; artSum(art(i))];
    else
        errS = [errS; err];
        artS = [artS; artSum(art(i))];
    end
end
figure;
artSizes = [artS; artB];
errs = [errS; errB];
p = randperm(length(artSizes));
colors = zeros(size(errs,1), 1);
colors(p > length(artS)) = 1;
gscatter(artSizes(p), errs(p), colors, 'rb', '..', 5);
legend('too small', 'too big');
if (exist('methodName', 'var'))
    title(methodName);
end
pause(1)
end

