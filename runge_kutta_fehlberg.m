%% Runge-Kutta-Fehlberg Method
% To approximate the solution of the initial-value problem y'=f(t,y), a <= t <= b, y(a) = ?,
% with local truncation error within a given tolerance:
% INPUT: Endpoints a, b; integer N; initial condition ?; tolerance TOL; maximum step size hmax;
% minimun step size hmin.
% OUTPUT: t, w, h where w approximates y(t) and the step size h was used or a message that
% teh minimum step size was exceeded.
% Test Command: runge_kutta_fehlberg(f, 0, 2 , 0.5 , 0.00001, 0.25, 0.01)
function [t,w] = runge_kutta_fehlberg(f,a,b,ya,tol,hmax,hmin)

% TODO:
% It needs to be fixed to find a correct output.

% t=zeros(N+1,1);
% w=zeros(N+1,1);
% t(1)=a;
% w(1)=ya;
t=a;
w=ya;
h=hmax;
FLAG=1;

while FLAG == 1
    K_1 = h*f(t,w);
    K_2 = h*f(t+(1/4)*h, w+(1/4)*K_1);
    K_3 = h*f(t+(3/8)*h, w+(3/32)*K_1 + (9/32)*K_2);
    K_4 = h*f(t+(12/13)*h, w+(1932/2197)*K_1 - (7200/2197)*K_2 + (7296/2197)*K_3);
    K_5 = h*f(t+h, w+(439/216)*K_1 - 8*K_2 + (3680/513)*K_3 - (845/4104)*K_4);
    K_6 = h*f(t+(1/2)*h, w - (8/27)*K_1 + 2*K_2 - (3544/2565)*K_3 + (1859/4104)*K_4 - (11/40)*K_5);

    R = (1/h)*abs((1/360)*K_1 - (128/4275)*K_3 - (2197/75240)*K_4 + (1/50)*K_5 + (2/55)*K_6);
                
    if R <= tol
        t = t+h;
        w = w + (25/216)*K_1 + (1408/2565)*K_3 + (2197/4104)/K_4 - (1/5)*K_5;
    end

    q = 0.84*(tol/R)^(1/4);
                
    if q <= 0.1
        h = 0.1*h;                    
    end
    
    if q >= 4
        h = 4*h;
    else
        h = q*h;
    end
    
    if h > hmax
        h = hmax;
    end
                
    if t >= b
        FLAG = 0;
    elseif (t+h) > b
        h = b - t;
    elseif h < hmin
        FLAG = 0;
    end 
end


                       