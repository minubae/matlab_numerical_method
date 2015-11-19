%% Neville's Iterated Interpolation
% Theorem 3.5: Let f be defined at x0, x1,...,xk and let xj and xi be two distinct numbers in this set.
% Then P(x) = (x-xj)P0,1,...,j-1,j+1,...,k(x) - (x-xi)P0,1,...,j-1,j+1,...,k(x) / (xi-xj)
% is the kth Lagrange polynomial that interpolates f at the k+1 points x0, x1,..., xk.
% The procedure that uses the result of Theorem 3.5 to recursively generate interpolating
% polynomial approximations is called Nevill's method.
% Let Qi,j(x), for 0 <= j <= i, denote the interpolating polynomial of degree j on the (j+1) numbers
% xi-j, xi-j+1,..., xi-1,xi; that is, Qi,j = Pi-j, i-j+1,.., i-1, i.
% 
% To evaluate the interpolating polynomial P on the n+1 distinct numbers x0,...xn
% at the number x for the function f
% INPUT: Numbers x, x0, x1,...,xn; values f(x0), f(x1),...,f(xn) as the first column Q0,0, Q1,0,...,Qn,0 of Q.
% OUTPUT: The table Q with P(x) = Qn,n.
function [Q] = neville(x,xi,fi)
% display(xi)
n=length(xi)-1;
Q=zeros(n+1,n+1);
Q(:,1)=fi(:);
for i=1:n
  for j=1:i
    Q(i+1,j+1)=((x-xi(i-j+1))*Q(i+1,j)-(x-xi(i+1))*Q(i,j))/(xi(i+1)-xi(i-j+1));
  end
end

% x = 2.1
% xi = [2.0, 2.2, 2.3]
% fi = [0.6931, 0.7885, 0.8329]



