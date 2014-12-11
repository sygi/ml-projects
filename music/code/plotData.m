load songTrain;

% print some basic statistics
fprintf('number of artists %d\n', size(Ytrain,2));
fprintf('number of users %d\n', size(Ytrain,1));
fprintf('number of training entries %d\n', nnz(Ytrain));

% plot number of counts per artist and per user
figure(1);
semilogy(sort(sum(Ytrain,1),'descend'),'.','markersize', 10);
grid on;
hy = ylabel('Counts');
hx = xlabel('Artists');
ht = title('listening counts per artist');
set(gca,'fontsize',10,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy; ht],'fontsize',18,'fontname','avantgarde','color',[.3 .3 .3]);
print('-dpdf', 'artists');

