function [r,Mu] = kmeans(X,K)
    Mu = rand(size(X,1),K);
    maxIters = 100;
    r0 = zeros(1,size(X,2));
    
    for i=1:maxIters
       [r,Mu] = kmeansUpdate(Mu,X);
       if (sum(abs(r0-r)) < 1e-6)
          fprintf('r stoped changing in ineration: %d\n',i);
          
          break;
       end
       r0 = r;
    end
end