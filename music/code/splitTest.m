function tests = splitTest
% testing function for splitting data into clusters
    tests = functiontests(localfunctions);
end

function testCanReadValue(testCase)
    X = [1;2;53]; % one artist
    [clust, a, b, c] = splitClusters(X);
    [myClust, user, art] = getAddress(1, 1, clust);
    assert(getValueFromAddress(user, art, myClust, a, b, c) == 1);
    assert(myClust == 3);
end

function testCreatesZeroCluster(testCase)
    X = [0 1;0 2;0 3];
    [clust, a, b, c] = splitClusters(X);
    [myClust, user, art] = getAddress(2, 1, clust);
    assert(myClust == 1);
    assert(getValueFromAddress(user, art, myClust, a, b, c) == 0);
end

