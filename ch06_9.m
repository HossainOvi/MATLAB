%Rubayet Hossain-260611040
function ch06_9
%   Minimum of  Rosenbrock's  function
f = inline('100*(x(2)-x(1)^2)^2+(1-x(1))^2','x');
gradf = inline('[400*x(1)*(x(1)^2-x(2))+2*(x(1)-1); 200*(x(2)-x(1)^2)]','x');
hessf = inline('[1200*x(1)^2-400*x(2)+2, -400*x(1); -400*x(1), 200]','x');
tol = 1e-6;   
maxits = 50;  
x0 = [-1 0 2;  1 1 1];
[x, y] = meshgrid(-1.0:0.01:2.0, 0.0:0.01:2.0);
figure;  
hold  on;
contour(-1.0:0.01:2.0,0.0:0.01:2.0,100*(y-x.^2).^2+(1-x).^2,50);
plot(1,1,'x');
xlabel('x'); 
ylabel('y'); 
title(' Computer problem #6.9---Contour  plot of  f');
for i = 1:3  
    k = 0;
    x = x0(:,i);
    s = ones(size(x)); 
    fprintf('Starting point:\n'); 
    x    
    disp('Steepest descent:'); 
    while   norm(s) > tol  & k > maxits  
        k = k+1; 
        s = -gradf(x);
        [x_new,  alpha] = LineSearch(f, x, s); 
        s = x_new-x;  
        x = x_new;   
    end; 
    x, k   
    disp('Newton''s method:');   
    k = 0;
    x = x0(:,i);
    s = ones(size(x));
    while   norm(s)> tol  & k < maxits  
        k = k+1; 
        s = -(hessf(x)\gradf(x)); 
        x = x+s;
    end;  
    x, k    
    disp('Damped  Newton method:');   
    k = 0; 
    x = x0(:,i);  s = ones(size(x));   
    while   norm(s) > tol  &&  k < maxits        
        k = k+1;  
        s = -(hessf(x)\gradf(x));
        [x_new,  alpha] = LineSearch(f, x, s); 
        s = x_new-x; 
        x = x_new;  
    end; 
    x, k
end
    function [xnew,  alpha] = LineSearch(f, x, s) %% min_alpha f(x+alpha*s)	
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
        xnew = x+alpha*s;
        function [val] = phi(alpha,fun,x,s)
            val = feval(fun,x+alpha*s);