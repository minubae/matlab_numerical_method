%% Testing Methods

%% The Method of False Position
clear all; clc;

f=@(x)sqrt(x-1)-2*sin(x);
[p,i]=regula_falsi(f, 2, 3, 10^-2, 20)

%% The Bisection Method 
[p,i]=bisection_n(f,2,3,10^-2, 20)

%% The Newton's Method
df=@(x) 1/(2*(x-1)^(1/2))-2*cos(x);
[p,i]=newton_n(f,df,2,10^-2, 20)

%% The Simpson's Rule
clear all; clc;

f1=@(x)2*x^3+3*x^2-x+1;
f2=@(x)380*x^3-240*x+2;
p=simpson(f1, 0, 1)
p=simpson(f2, 2, 3)