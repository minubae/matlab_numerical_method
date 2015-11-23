function R = romberg(f,a,b,n)

h=b-a;
R=zeros(n,n);
R(1,1)=h/2*(f(a)+f(b));

for i=2:n
    R(i,1)=1/2*(R(i-1,1)+h*sum(f(a+((1:2^(i-2))-0.5)*h)));
    for j=2:i
        R(i,j)=R(i,j-1)+(R(i,j-1)-R(i-1,j-1))/(4^(j-1)-1);
    end
    h=h/2;
end