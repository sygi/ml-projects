function d = distance(v1, v2)
%DISTANCE - notation of distance between two vectors
% used by KNN
assert(length(v1) == length(v2));
d = 0;
for i=1:length(v1)
    d = d + abs(v1(i) - v2(i));
end
d = d ./ length(v1);

end

