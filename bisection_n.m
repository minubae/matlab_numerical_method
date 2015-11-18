function [p,i]=bisection_n(f,a,b,tol, N)
i=1;
while i <= N
 p=(a+b)/2;
 i=i+1;
 if p-a<tol
     break
 end
 if f(a)*f(p)>0
     a=p;
 else
     b=p;
 end
end

dbtype('bisection_n.m')
display(f)