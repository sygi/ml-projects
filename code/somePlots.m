clear all;
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