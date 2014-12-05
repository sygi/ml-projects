function [A,U] = colaborativeFiltering(Ytrain,noHidden,alpha,maxIter)
    %colaborative filering - low rank app. using gradient descent

   if ~exist('maxIter', 'var')
        maxIter = 50;
   end
    
   if ~exist('lambda','var')
       alpha = 0.5;
   end
    NA = size(Ytrain,2);
    NU = size(Ytrain,1);
    A = rand(noHidden,NA);
    A2 = A;
    U = rand(noHidden,NU);
    U2 = U;
    
    for iteracje = 1:maxIter
        for i = 1:NA
            Artist = Ytrain(:,i);
            Uexist = U(:,Artist ~= 0);
            A2(:,i) = A(:,i) - alpha*(Uexist'*A(:,i)-Artist(Artist ~= 0 ))*Uexist';
        end
        
        for j = 1:NU
            User = Ytrain(j,:);
            Aexist = A(:,User ~= 0);
            U2(:,i) = U(:,i) - alpha*(Aexist'*U(:,j)-User(User ~= 0 ))*Aexist';
        end
        
        A = A2;
        U = U2;
    end
end