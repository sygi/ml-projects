function Err = alsError(A,U,Ytrain,lambda)
    
    Err = lambda * (sum(sum(A.^2)) + sum(sum(U.^2)));
    Err = 0;
    [id1,id2] = find(Ytrain);
    for i=1:length(id1)
       Err = Err + (U(:,id1(i))' * A(:, id2(i))-Ytrain(id1(i),id2(i)))^2;
       Err = Err + lambda * sum((U(:,id1(i)) .^2) + (A(:, id2(i)).^2));
    end
    Err= Err/length(id1);
    Err=sqrt(Err);
end
