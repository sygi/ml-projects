clear all;
load('Toronto_classification');

corX = corrcoef(X_train);
figure(4);
imagesc(corX);
tit = title('corelation between input variables');
preparePlot([tit]);
print -dpdf imagesc_Xcorrelation.pdf;

corY = corr(y_train,X_train);
figure(3);
bar(corY);
hy = ylabel('correlation');
hx = xlabel('numbeer of variable');
preparePlot([hy,hx]);
print -dpdf bar_ycorrelation.pdf;
load('Toronto_classification');

break;

figure(1);
boxplot(X_train, 'orientation', 'horizontal');
hy = ylabel('number of variable ');
hx = xlabel('distribution of variable');
tit = title('given data distribution');
preparePlot([hx,hy,tit]);
print -dpdf boxplot_before.pdf


clear all;
load('classifNormalized');
figure(2);
boxplot(myX_train, 'orientation', 'horizontal');
hy = ylabel('number of variable ');
hx = xlabel('distribution of variable');
tit = title('data distribution after preprocess');
preparePlot([hx,hy,tit]);
print -dpdf boxplot_after.pdf