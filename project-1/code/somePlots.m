clear all;
load('Toronto_regression');
load('reg_dummy');

corX = corrcoef(myX_train);
figure(4);
imagesc(corX);
colorbar;
tit = title('Corelation between input variables');
preparePlot([tit]);
print -dpdf imagesc_Xcorrelation.pdf;

%to remove 50,55,67,77

corY = corr(y_train,myX_train);
figure(3);
bar(corY);
hy = ylabel('correlation with $y$');
hx = xlabel('input variable');
preparePlot([hy,hx]);
print -dpdf bar_ycorrelation.pdf;


break;


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