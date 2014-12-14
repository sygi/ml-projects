N = 20;
lambda = logspace(-2,0,N);
err = zeros(1,N);

for i=1:N
    [B(:,i),err(:,i)] = sumPredicion(Xtr,sum(Xte,2),lambda(i));  
end