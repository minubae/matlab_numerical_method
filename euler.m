%% Euler's Method
% y(t_i+1) = y(t_i) +h*f(t_i, y(t_i)).
% w0 = y0; w_i+1 = w_i + h*w(t_i, w_i), for each i = 0,1,...,N-1.
% To approximate the solution of the initial-value problem, dy/dt = f(t,y), a <= t <= b, y(a)=w0
% at (N+1) equally spaced numbers in the interval [a,b]:
% INPUT: Differential equation f(t,y); endpoints a, b; integer N; initial condition y0.
% OUTPUT: Approximation w to y at the (N+1) values of t.
function [t,y]=euler(f,a,b,ya,N)

h=(b-a)/N;
t=zeros(N+1,1);
y=zeros(N+1,1);
t(1)=a;
y(1)=ya;

for k=1:N
    t(k+1)=t(k)+h;
    y(k+1)=y(k)+h*f(t(k),y(k));
end
