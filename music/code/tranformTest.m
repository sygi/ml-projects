function tests = tranformTest
% testing function for making data transformation and untransformation
% make Ytrain global before running
    tests = functiontests(localfunctions);
end

function testOnRealArray(testCase)
    global Ytrain;
    trans = transformData(Ytrain);
    assert(length(find(trans)) == length(find(Ytrain)));
    untrans = unTransformData(trans);
    assert(sum(sum(untrans - Ytrain), 2) < 1e-6);
end