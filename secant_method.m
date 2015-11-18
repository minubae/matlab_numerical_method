function [p,i] = secant_method(p0,p1,f,tol,N)
i = 2;
q0 = f(p0);
q1 = f(p1);
while i <= N
    p = p1 - q1*(p1-p0) / (q1-q0);
    if abs(p-p1)< tol
        break
    end
    i=i+1;
    
    p0 = p1;
    q0 = q1;
    p1 = p;
    q1 = f(p);
end
