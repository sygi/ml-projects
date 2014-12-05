function done = printNames(names,clusters,K)
    for k = 1:K;
       this = find(clusters == k);
       fprintf('cluster: %d, size: %d\n',k,length(this));
       %if (length(this)>0)
        %  for i = 1:length(this)
         %   tmp = names(this(i));
          %  disp(tmp);
          %end
       %end
    end
    done = true;
end