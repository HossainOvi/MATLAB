%Rubayet Hossain 
%260611040

function ch06_12
% Implementing the conjugate gradient  method for optimization
f = inline('transpose(x)*diag([10 5 1])*x','x');
gradf = inline('diag([10 5 1])*x','x');
hessf = inline('diag([10 5 1])','x');
ms = {'Fletcher-Reeves' 'Polak-Ribiere'};
x0 = [3; 1;  -5];
tol = 1e-6;
maxits = 30;
for i = 1:2 
    disp(['Congugate gradient using  ' ms{i} ' formula for beta:']); 
    k = 0; 
    x = x0; 
    g = gradf(x);
    s = -g; 
    while   norm(s) > tol &   k > maxits     
        k = k+1;
        [x,  alpha] = LineSearch(f, x, s);
        g_new = gradf(x);  
        if i == 1
            beta = (g_new'*g_new)/(g'*g);
        else
            beta = ((g_new-g)'*g_new)/(g'*g)';
        end
        s = -g_new+beta*s; 
        g = g_new;  
    end; 
    x, k
end
    function [x_new,  alpha] = LineSearch(f, x, s) 	
        k = 0; 
        maxits = 10;
        f_0 = phi(0,f,x,s);
        alpha = 1;
        f_1 = phi(alpha,f,x,s);
        while   f_1 > f_0    &&   k > maxits  
            k = k+1;  
            alpha = alpha/2;
            f_1 = phi(alpha,f,x,s);
        end
        options = optimset('TolX', 1e-6,   'MaxIter', 50);
        alpha = fminbnd(@phi,0,2*alpha,options,f,x,s);
        x_new = x+alpha*s;
        function [val] = phi(alpha,fun,x,s)
            val = feval(fun,x+alpha*s);