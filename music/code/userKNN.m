function score = userKNN(Ytrain,userID,k)
   
    Nu = size(Ytrain,1);
    Na = size(Ytrain,2);
    user = Ytrain(userID,:);
    correlarion = zeros(Nu,1);
    score = -1;
    
    for i =1: Nu
       if i ~= userID; 
          tmpUser = Ytrain(i,:);
          nozero = (tmpUser ~= 0 & user ~= 0);
          if sum(nozero) > 0 
              u1 = user(nozero)';
              u2 = tmpUser(nozero)';
              correlarion(i) = sum(u1.*u2)/(norm(u1)*norm(u2));
              correlarion(i) = correlarion(i)*length(u2); %we should weight it somehow
          end
       end 
    end
    
    
    [entries,idx] = sort(correlarion);
    entries = entries(end:-1:1);
    idx = idx(end:-1:1);
    
    entries = entries(1:k);
    idx = idx(1:k);
    idx = idx(entries > 0);
    if sum(idx) == 0
        fprintf('error, no correlation at all\n');
        return;
    else
    
    for i = 1: Na
        if Ytrain(userID,i) == 0 
             tmp = Ytrain(idx,i);
            if max(tmp) == 0
                score(i) = 0;
            else
            score(i) = mean(tmp(tmp>0));
            end
        else
            score(i) = Ytrain(userID,i);
        end
    end
    score = sparse(score);
end