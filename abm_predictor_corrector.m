function [t,w]=abm_predictor_corrector(f,a,b,ya,N)

h=(b-a)/N;
t=(a:h:b)';
w=zeros(N+1,1);
wp=zeros(N+1,1);
w(1)=ya;

for i=1:3
    k1=h*f(t(i),w(i));
    k2=h*f(t(i)+h/2,w(i)+k1/2);
    k3=h*f(t(i)+h/2,w(i)+k2/2);
    k4=h*f(t(i)+h,w(i)+k3);
    w(i+1)=w(i)+(k1+2*k2+2*k3+k4)/6;
end

for i=4:N
    wp(i+1)=w(i)+h/24*(55*f(t(i),w(i))-59*f(t(i-1),w(i-1))+37*f(t(i-2),w(i-2))-9*f(t(i-3),w(i-3)));
    w(i+1)=w(i)+h/24*(9*f(t(i+1),wp(i+1))+19*f(t(i),w(i))+-5*f(t(i-1),w(i-1))+f(t(i-2),w(i-2)));
end

disp('   t                   w')
disp([t w])