function [z,w] = pcaM(z0,w0,Ytrain)
    maxIter = 10;
    z = z0;
    w = w0;
    
    for i = 1:maxIter
        fprintf('iter: %d\n',i);
        z = (w'*w)\(w'*Ytrain);
        z = z';
        w = (z'*z)\(z'*Ytrain');
        w = w';

    end
end