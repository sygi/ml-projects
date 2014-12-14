function Value = getValueFromAddress(user, artist, clusterNumber, null, small, big)
% gets real value stored in one of the arrays: null, small, big
% according to clusterNumber
if clusterNumber == 1
    Value = null(user, artist);
elseif clusterNumber == 2
    Value = small(user, artist);
elseif clusterNumber == 3
    Value = big(user, artist);
else
    assert(false);
    
end

