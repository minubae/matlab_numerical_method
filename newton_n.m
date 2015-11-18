function [p,i]=newton_n(f,df,p0,tol, N)
i=1;
while i <= N
 p=p0 - f(p0)/df(p0);
 
 if abs(p-p0)<tol
     break
 end
 i=i+1;
 p0=p;
end
dbtype('newton_n.m')
display(f)
display(df)