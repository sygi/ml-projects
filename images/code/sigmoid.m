function y = sigmoid(x)
%sigmoid - logistic function
%
%   y = sigmoid(x)

   if x > 0
    y = exp(x)./(1+exp(x));
   else
    y = 1-1./(1+exp(x));
   end
end