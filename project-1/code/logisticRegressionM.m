function beta = logisticRegressionM(y,tX,alpha,maxIter)
% logisticRegression - logistic regression using gradient descent
%   
%   beta = logisticRegressionH(y,tX,alpha)
%   beta = logisticRegressionH(y,tX,alpha,maxIter)

if ~exist('maxIter', 'var')
    maxIter = 1000;
end

[N,D]=size(tX);
beta = zeros(D,1);
all_beta = zeros(D,maxIter);
griadient = zeros(maxIter,1);
for i = 1:maxIter
    gradien = -(tX')*(y - sigmoid(tX*beta))/N;
    beta = beta - alpha*gradien;
    all_beta(:,i)=beta;
    normGradient(i) = norm(gradien);
%     logisticLikelihood(y,tX,beta);
    if (normGradient(i) < 1e-5 )
        fprintf('finished')
        break;
    end
end

figure;
plot(1:maxIter,all_beta(1,:),'g','LineWidth',2);
hold on;
plot(1:maxIter,all_beta(2,:),'LineWidth',2);
l = legend('beta0', 'beta1');
yl = ylabel('beta');
xl = xlabel('iteration number');
preparePlot([xl,yl]);
print -dpdf beta9.pdf
% plot(1:maxIter,all_beta(3,:));
figure;
plot(1:maxIter,normGradient,'LineWidth',2);
xl = xlabel('iteration number');
yl = ylabel('gradient norm');
preparePlot([xl,yl]);
print -dpdf gradient9.pdf
gradient(maxIter)
end
