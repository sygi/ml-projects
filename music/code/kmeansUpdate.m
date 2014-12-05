function [r,Mu] = kmeansUpdate(Mu,X)
    
  N = size(X,2);
  K = size(Mu,2);
  r = zeros(1,N);
  distances = zeros(N,K);
  
  for k = 1:K
     distances(:,k) = diag(X'*X)+Mu(:,k)'*Mu(:,k)-2*X'*Mu(:,k);
  end
  [minimum,place] = min(distances');
  r = place;
  
  for k = 1:K
     Mu(:,k) = (mean(X(:,r == k)'))';
  end
end