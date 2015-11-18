function p=simpson(f, x0, x2)

% Calculate an h value from the x0 and the x2
h = (x2-x0)/2;

% Calculate an x1 value with the h
x1 = x0 + h;

% Simpson's Rule:
p = (h/3)*(f(x0)+4*f(x1)+f(x2));

dbtype('simpson.m')
display(f)