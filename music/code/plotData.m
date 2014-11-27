load songTrain;

% print some basic statistics
fprintf('number of artists %d\n', size(Ytrain,2));
fprintf('number of users %d\n', size(Ytrain,1));
fprintf('number of training entries %d\n', nnz(Ytrain));

% plot number of counts per artist and per user
figure(1);
subplot(211);
semilogy(sort(sum(Ytrain,1),'descend'),'.','markersize', 10);
grid on;
hy = ylabel('Counts');
hx = xlabel('Artists');
ht = title('listening counts per artist');
set(gca,'fontsize',10,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy; ht],'fontsize',18,'fontname','avantgarde','color',[.3 .3 .3]);
subplot(212);
semilogy(sort(sum(Ytrain,2),'descend'),'.','markersize', 10);
hy = ylabel('Counts');
hx = xlabel('Users');
ht = title('listening counts per user');
grid on;
set(gca,'fontsize',10,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy; ht],'fontsize',18,'fontname','avantgarde','color',[.3 .3 .3]);
print('-dpng', 'fig1');

figure(2)
% plot data
subplot(121);
spy(Ytrain');
hx = xlabel('Users');
hy = ylabel('Artists');
ht = title('listering counts');
grid on;
set(gca,'fontsize',10,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy; ht],'fontsize',18,'fontname','avantgarde','color',[.3 .3 .3]);

% plot friendship graph
subplot(122);
spy(Gtrain);
hx = xlabel('Users');
hy = ylabel('Users');
ht = title('Friendship graph');
grid on;
set(gca,'fontsize',10,'fontname','Helvetica','box','off','tickdir','out','ticklength',[.02 .02],'xcolor',0.5*[1 1 1],'ycolor',0.5*[1 1 1]);
set([hx; hy; ht],'fontsize',18,'fontname','avantgarde','color',[.3 .3 .3]);

print('-dpng', 'fig2');

