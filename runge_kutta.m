%% Runge-Kutta (Order Four)
% To approximate the solution of the initial-value problem y'=f(t,y), a <= t <= b, y(a) = ?,
% at (N+1) equally spaced numbers in the interval [a,b]:
% INPUT: Endpoints a, b; integer N; initial condition ?.
% OUTPUT: Approximation w to y at the (N+1) values of t.
function [t,w] = runge_kutta(f,a,b,ya,N)

h = (b-a)/N;
t=zeros(N+1,1);
w=zeros(N+1,1);
t(1) = a;
w(1) = ya;

for i=1:N
    K1 = f(t(i),w(i));
    K2 = f(t(i)+h/2, w(i)+(h/2)*K1);
    K3 = f(t(i)+h/2, w(i)+(h/2)*K2);
    K4 = f(t(i)+h, w(i)+h*K3);
    
    w(i+1) = w(i) +(h/6)*(K1+2*K2+2*K3+K4);
    t(i+1) = a + i*h;
    
end

format long
disp('   t                   w')
disp([t w])
