features = 300;
[usr,art] = size(Ytrain);
A = rand(features,art);
U = rand(features,usr);
N = 50;
err = zeros(1,N);
lambda = 1;
for i=1:N
%    err(i)= rmse(A'*U,Ytrain;
%    for j = 1:10
   [A,U] = alsUpdate(A,U,Ytrain,lambda);
%    end
   err(i)= alsError(A,U,Ytrain)
   if i>2
      if abs(err(i-1)-err(i)) < 1e-4;
          fprintf('converged');
          brak;
      end
   end
end