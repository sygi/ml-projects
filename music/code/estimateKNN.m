function [error, small, prediction, distribution] = estimateKNN(train, test, K, lambda, hidden)
%estimates knn error using lower rank approximation got by ALS

orig = train;
zeroArt = all(train == 0);
zeroUsr = all(train == 0, 2);
train = train(:, any(train ~= 0));
train = train(any(train ~= 0, 2), :);
artSum = sum(orig);
    
maxIter = 40;
[A,U] = ALS(train,hidden,lambda,maxIter);
% TestErr = alsError(A,U,Ytest);
A2 = zeros(size(A,1), size(test, 2));
U2 = zeros(size(U,1), size(test, 1));
A2(:, any(orig ~= 0)) = A;
U2(:, any(orig ~= 0, 2)) = U;

prediction = sparse([], [], [], size(test,1), size(test,2));
[usr, art] = find(test);
for i=1:length(usr)
    values = zeros(0, 3);
    arts = find(orig(usr(i), :));
    userRow = U2(:, usr(i));
    artistRow = A2(:, art(i));
    for j=1:length(arts)
        newArtistRow = A2(:, arts(j));
        mat = [distance(artistRow, newArtistRow), orig(usr(i), arts(j)) 0];
        if (abs(artSum(arts(j)) - artSum(art(i))) < 0)
            values = [values; mat];
        end
    end
    usrs = find(orig(:, art(i)));
    for j=1:length(usrs)
        newUserRow = U2(:, usrs(j));
        values = [values; [distance(userRow, newUserRow) orig(usrs(j), art(i)) 1]];
    end
    if (min(size(values)) == 0)
        prediction(usr(i), art(i)) = 1e-10;
        fprintf('no users and no artists?!\n');
    else
        values = sortrows(values);
        sumPr = 0;
        number = min(K, size(values,1));
        fromUsers = 0;
        for j=1:number;
            sumPr = sumPr + values(j, 2);
            fromUsers = fromUsers + values(j, 3);
        end
        prediction(usr(i), art(i)) = sumPr/number;
        %fprintf('from users: %f\n', fromUsers / number);
        if (isnan(prediction(usr(i), art(i))))
            fprintf('aaaA@!$!@$!\n');
            fprintf('%f %f\n', sumPr, number);
            fprintf('%d %d\n', size(values,1), min(size(values)));
        end
    end
end

prediction = boundPrediction(prediction, orig, test);

[error, distribution, small] = logError(prediction, test, orig);
drawErrorDistribution(distribution', orig', 'distribution of error using knn');
end