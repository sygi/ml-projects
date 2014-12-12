tmp = zeros(1,1,36);
figure;
for i=1:36
    tmp(1,1,i) = 1;
    subplot(3,12,i);
    im(hogDraw(tmp));
        colormap gray;
        axis off;
        colorbar off;
    tmp(1,1,i) = 0;
end