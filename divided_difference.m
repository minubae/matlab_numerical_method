%% Newton's Divided-Difference Formula
% Iterated interpolation was used in the previous section to generate successively higher-degree
% polynomial approximations at a specific point. Divided-difference methods are used to successively
% generate the polynomial themselves.
% To obtain the divided-difference coefficients of the interpolatory polynomial P on the (n+1)
% distinct numbers x0, x1, ... , xn for the function f:
% INPUT: Numbers x0, x1, ... , xn; values f(x0), f(x1),...,f(xn) as F0,0, F1,0,...,Fn,0.
% OUTPUT: The numbers F0,0, F1,1,...,Fn,n where
% Pn(x) = F0,0 + Sum (Fi,i) from i=1 to n * Product(x-xj) from j=0 to i-1. (Fi,i is f[x0,x1,...,xi])
% x = [1.0, 1.3, 1.6, 1.9, 2.2]
% f = [0.7651977, 0.6200860, 0.4554022, 0.2818186, 0.1103623]
function F = divided_difference(x, f)
n=length(x)-1;
F=zeros(n+1,n+1);
F(:,1)=f(:);

for i=1:n
  for j=1:i
      F(i+1,j+1)=(F(i+1,j)-F(i,j))/(x(i+1)-x(i-j+1));
  end
end