function matrixToGraphviz(X, filename)
%MATRIXTOGRAPHVIZ Summary of this function goes here
%   Detailed explanation goes here
    fid = fopen(filename, 'w');
    fprintf(fid, 'graph G {\n');
    [one, two] = find(X);
    % Temp = fill(length(one));
    for i=1:length(one)
        if (one(i) < two(i))
            Temp = strcat(int2str(one(i)), ' -- ', int2str(two(i)), ';\n');
            fprintf(fid, Temp);
        end
    end
    fprintf(fid, '}\n');
    fclose(fid);
end

