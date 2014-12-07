function [A,U] = alsUpdate(A0,U0,Ytrain,lambda)
   Mu = size(U0,2);
   Ma = size(A0,2);
   Mf = size(U0,1);
   U = U0;
   A = A0;
   
   for i=1:Mu 
      v0 = Ytrain(i,:);
      idx = (v0 ~= 0);
      Ac = A(:,idx);
      v0 = v0(idx);
      na = sum(idx); %na - numner of artist for this user
      %na = 1;
      assert(na ~= 0);
      v1 = (Ac*Ac'+eye(Mf)*lambda*na)\(Ac*v0');
      U(:,i)=v1;
   end
   
   for i=1:Ma
      v0 = Ytrain(:,i);
      idx = (v0 ~= 0);
      Uc = U(:,idx);
      v0 = v0(idx);
      nu = sum(idx); %nu - number of users for this artist
      %nu = 1;
      assert(nu ~= 0);
      v1 = (Uc*Uc'+eye(Mf)*lambda*nu)\(Uc*v0);
      A(:,i)=v1;
   end
end