function Err = alsError(A,U,Ytrain)
    
    Err = 0;
    [id1,id2] = find(Ytrain);
    for i=1:length(id1)
       Err = Err + (A(:,id2(i))'*U(:,id1(i))-Ytrain(id1(i),id2(i)))^2;
    end
    Err= Err/length(id1);
    Err=sqrt(Err);
end