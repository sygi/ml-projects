function [error, prediction] = estimateKNN(train, test, normalize, K, lambda, hidden)
%estimates knn error using lower rank approximation got by ALS

if (normalize)
    train = transformData(train);
    test = transformTestData(test);
end

if (lambda < 1 && ~normalize)
    lambda = lambda * 20000;
end

orig = train;
zeroArt = all(train == 0);
zeroUsr = all(train == 0, 2);
train = train(:, any(train ~= 0));
train = train(any(train ~= 0, 2), :);
    
maxIter = 50;
[A,U] = ALS(train,hidden,lambda,maxIter);
% TestErr = alsError(A,U,Ytest);
A2 = zeros(size(A,1), size(test, 2));
U2 = zeros(size(U,1), size(test, 1));
A2(:, any(orig ~= 0)) = A;
U2(:, any(orig ~= 0, 2)) = U;

prediction = sparse([], [], [], size(test,1), size(test,2));
[usr, art] = find(test);
for i=1:length(usr)
    values = zeros(0, 2);
    arts = find(orig(usr(i), :));
    userRow = U2(:, usr(i));
    artistRow = A2(:, art(i));
    for j=1:length(arts)
        newArtistRow = A2(:, arts(j));
        mat = [distance(artistRow, newArtistRow), orig(usr(i), arts(j))];
        values = [values; mat];
    end
    usrs = find(orig(:, art(i)));
    for j=1:length(usrs)
        newUserRow = U2(:, usrs(j));
        values = [values; [distance(userRow, newUserRow) orig(usrs(j), art(i))]];
    end
    if min(size(values) == 0)
        prediction(usr(i), art(i)) = -1
    else
        values = sortrows(values);
        sumPr = 0;
        number = min(K, size(values,1));
        for j=1:number;
            sumPr = sumPr + values(j, 2);
        end
        prediction(usr(i), art(i)) = sumPr/number;
    end
end
error = logError(prediction, test, normalize);
end