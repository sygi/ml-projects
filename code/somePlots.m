clear all;
load('Toronto_classification');


break;
corX = corrcoef(X_train);
figure(4);
imagesc(corX);
tit = title('Corelation between input variables');
preparePlot([tit]);
print -dpdf imagesc_Xcorrelation.pdf;

corY = corr(y_train,X_train);
figure(3);
bar(corY);
hy = ylabel('correlation with $y$');
hx = xlabel('input variable');
preparePlot([hy,hx]);
print -dpdf bar_ycorrelation.pdf;
load('Toronto_classification');

figure(1);
boxplot(X_train, 'orientation', 'horizontal');
hy = ylabel('input variable ');
hx = xlabel('distribution of variable');
tit = title('distribution of given data');
preparePlot([hx,hy,tit]);
print -dpdf boxplot_before.pdf


clear all;
load('classifNormalized');
figure(2);
boxplot(myX_train, 'orientation', 'horizontal');
hy = ylabel('input variable');
hx = xlabel('distribution of variable');
tit = title('distribution of data after preprocesing');
preparePlot([hx,hy,tit]);
print -dpdf boxplot_after.pdf