function chap06_11 
%   Implementation of  BFGS  method for  unconstrained minimization
f = inline('transpose(x)*diag([10 5 1])*x','x');
gradf = inline('diag([10 5 1])*x','x'); 
hessf = inline('diag([10 5 1])','x');
x0 = [3; 1;  -5]; 
tol = 1e-6  
maxits = 20;  
disp('BFGS  method:');
k = 0; 
x = x0;  
g = gradf(x); 
s = ones(size(x));
B = eye(length(x)); %B = hessf(x)
while   norm(s) > tol  &    k < maxits;
    k=k+1; 
    s=-(B\g); 
    x=x+s;
    y=g;
    g=gradf(x);
    y=g-y;
    z=B*s;
    b=B+((y*y')/(y'*s))-((z*z')/(z'*s));
end;
 x,k
 disp(' ');
 disp('Newton''s method:');
 k=0; x=x0; s = ones(size(x));
 while norm(s)>tol  &   k<maxits 
    k=k+1;
    s=-(hessf(x)\gradf(x)); 
    x=x+s;
end;
x, k,
disp('Steepest descent:');
k=0;  x=x0; s = ones(size(x));
while norm(s)>tol  &    k<maxits 
    k=k+1;
    s=-gradf(x);
    [x_new, alpha]=LineSearch(f, x, s);
    s = x_new-x
    x=x_new;
end; 
    x, k
    function [x_new,  alpha] = LineSearch(f, x, s) 	%% min_alpha f(x+alpha*s)
    k = 0; 
    maxits = 10; 
    f_0 = phi(0,f,x,s); 
    alpha = 1; 
    f_1 = phi(alpha,f,x,s);
    while   f_1 > f_0  & k < maxits    
        k = k+1;  
        alpha = alpha/2; 
        f_1 = phi(alpha,f,x,s);
    end
    options = optimset('TolX', 1e-6,   'MaxIter', 50);
        alpha = fminbnd(@phi,0,2*alpha,options,f,x,s); 
        x_new = x+alpha*s;
        function [val] = phi(alpha,fun,x,s)
            val = feval(fun,x+alpha*s);