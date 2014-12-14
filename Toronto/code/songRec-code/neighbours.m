function Neigh = neighbours(Social, person, distance)
%NEIGHBOURS returns all the people that are in the distance at most
%'distance' in graph defined by Social from person 'person'
if (distance == 1)
    Neigh = find(Social(person, :));
    return
end
nearest = find(Social(person, :));
Neigh = nearest;
for i=1:length(nearest)
    Neigh = [Neigh neighbours(Social, nearest(i), distance - 1)];
end
Neigh = unique(Neigh);
end