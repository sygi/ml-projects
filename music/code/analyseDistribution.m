artists = sum(sign(Ytrain));
artists = artists(artists > 0);

counts = [];
for i=1:length(artists)
    counts = [counts artists(i) * ones(1,artists(i))];
end
hist(counts(counts >= 2 & counts < 100),100);

% subplot(2, 2, 1);
% hist(artists(artists < 10^3), 100);
% t = title('given artists listen counts');
% preparePlot(t);
% 
% logArtists = log(artists);
% subplot(2,2,2);
% hist(logArtists, 100);
% t = title('$\log$(listen counts)');
% preparePlot(t);
% 
% sqrtArtists = sqrt(artists);
% subplot(2,2,3);
% hist(sqrtArtists(sqrtArtists < 100), 100);
% t = title('$\sqrt{\mbox{listen counts}}$');
% preparePlot(t);
% 
% powerArtists = artists .^ (-0.5);
% subplot(2,2,4);
% hist(powerArtists, 100);
% t = title('$\frac{1}{\sqrt{\mbox{listen counts}}}$');
% preparePlot(t);