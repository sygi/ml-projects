function [A,U] = alsUpdate(A0,U0,Ytrain,lambda)
   Mu = size(U0,2);
   Ma = size(A0,2);
   Mf = size(U0,1);
   U = U0;
   A = A0;
   
   
   for i=1:Mu 
      v0 = Ytrain(i,:);
      Ac = A(:,(v0>0));
      v0 = v0(v0>0);
      v1 = (Ac*Ac'+eye(Mf)*lambda)\Ac*v0';
      U(:,i)=v1;
   end
   
   for i=1:Ma
      v0 = Ytrain(:,i);
      Uc = U(:,(v0>0));
      v0 = v0(v0>0);
      v1 = (Uc*Uc'+eye(Mf)*lambda)\Uc*v0;
      A(:,i)=v1;
   end
end