function [A,U] = colaborativeFiltering(Ytrain,noHidden,lambda,maxIter,alpha)
    %colaborative filering - low rank app. using gradient descent

   if ~exist('maxIter', 'var')
        maxIter = 100;
   end
    
   if ~exist('alpha','var')
       alpha = 0.00005;
   end
    NA = size(Ytrain,2);
    NU = size(Ytrain,1);
    A = rand(noHidden,NA);
    A2 = A;
    U = rand(noHidden,NU);
    U2 = U;
    
    for iterations = 1:maxIter
        for i = 1:NA
            Artist = Ytrain(:,i);
            Uexist = U(:,Artist ~= 0);
%             tmp1 = Uexist'*A(:,i);
%             tmp2 = Artist(Artist ~= 0 );
%             tmp3 = tmp1 - tmp2;
%             tmp4 = Uexist*tmp3;
%             A2(:,i) = A(:,i) - alpha*tmp4;
            A2(:,i) = A(:,i) - alpha*(Uexist*(Uexist'*A(:,i)-Artist(Artist ~= 0 )) +lambda*A(:,i));
        end
        
        for j = 1:NU
            User = Ytrain(j,:)';
            Aexist = A(:,User ~= 0);
%             tmp1 = Aexist'*U(:,i);
%             tmp2 = User(User ~= 0);
%             tmp3 = tmp1 - tmp2;
%             tmp4 = Aexist*tmp3;
%             U2(:,i) = U(:,i) - alpha*tmp4;
            U2(:,i) = U(:,i) - alpha*(Aexist*(Aexist'*U(:,j)-User(User ~= 0 ))+lambda*U(:,i));
        end
        
        if (mod(iterations,10) == 9)
            difference = sum(sum((U'*A-U2'*A2).^2))
            if difference < 100 
                fprintf('small difference\n done');
                A = A2;
                U = U2;
                break;
            end
            
            err = alsErrorM(A,U,Ytrain,lambda)
            if err < 100
                fprintf('small error\n done');
                A = A2;
                U = U2;
            end
        end
        
        
        A = A2;
        U = U2;
        
        
    end
end