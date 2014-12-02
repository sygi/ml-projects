data = Ytrain;
data = data(find(data));

hist(data(data < 10^3), 100);
one = xlabel('listen count value');b
two = ylabel('number of entries in $Y_{train}$');
preparePlot([one two]);

logArtists = log(data);
hist(logArtists, 100);
one = xlabel('logarithm of listen count value');
two = ylabel('number of entries in $Y_{train}$');
preparePlot([one two]);

% 
% sqrtArtists = sqrt(artists);
% subplot(2,2,3);
% hist(sqrtArtists(sqrtArtists < 100), 100);
% t = title('$\sqrt{\mbox{listen counts}}$');
% preparePlot(t);
% 
% powerArtists = data .^ (-0.5);
% subplot(2,2,4);
% hist(powerArtists, 100);
% t = title('$\frac{1}{\sqrt{\mbox{listen counts}}}$');
% preparePlot(t);