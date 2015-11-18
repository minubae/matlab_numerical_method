function [p,i] = fixed_point(p0, g, tol, N)
i = 1;
while i <= N
    p = g(p0);
    if math.fabs(p-p0) < tol
        break
    end
    i=i+1;
    p0 = p;
end