
%Rubayet Hossain- 260611040
function ch05_2 
%bisection, Newton, and secant methods
fs =  {'x^3 - 2*x - 5' 'exp( - x) - x' 'x*sin(x) - 1' 'x^3 - 3*x^2+3*x - 1'};
dfs  =  {'3*x^2 - 2' ' - exp( - x) - 1' 'x*cos(x)+sin(x)' '3*x^2 - 6*x+3'};
a0 =  [1.5 0 0.5 0.5]; 
b0 =  [2.5 1 1.5 1.4];
tol =  1e-10; 
maxits  =  10;
part =  {'(a)' '(b)' '(c)' '(d)'};
for i=1:4    
    fprintf('\n%s f(x) =  %s  =  0\n', part{i}, fs{i});
    f =  inline(fs{i},'x');    
    disp(' '); 
    disp('Bisection method:'); 
    disp([' k 	a	f(a)	b ','f(b)']);
    k =  0;
    a =  a0(i);
    fa  =  f(a);
    b =  b0(i);
    fb  =  f(b);
    fprintf('%3d %17.10e %17.10e %17.10e %17.10e\n', k, a, fa, b, fb);
    while b - a > tol & k < maxits
        k =  k+1;
        m  =  a+(b - a)/2;
        fm =  f(m);
        if sign(fa) == sign(fm), a =  m; 
            fa =  fm;        
        else
            b =  m;
            fb  =  fm; 
        end
        fprintf('%3d %17.10e %17.10e %17.10e %17.10e\n', k, a, fa, b, fb);
    end
    disp(' ');
    disp('Newton''s method:');  
    disp(' k 	x 	f(x)');
    delx  =  1;
    k =  0;
    x =  a0(i); 
    fx =  f(x);
    df  =  inline(dfs{i},'x'); 
    fprintf('%3d %17.10e %17.10e\n', k, x, fx); 
    while abs(delx)> tol & k < maxits 
             k =  k+1; d =  df(x);
             delx  =   - fx/d; 
             x =  x+delx;
             fx =  f(x);  
             fprintf('%3d %17.10e %17.10e\n', k, x, fx);  
    end
    disp(' '); 
    disp('Secant method:');    
    disp(' k 	x 	f(x)'); 
    delx  =  1; 
    k =  0; 
    x0 =  a0(i);
    fx0  =  f(x0);   
    fprintf('%3d %17.10e %17.10e\n', k, x0, fx0); 
    k =  1; 
    x1 =  b0(i); 
    fx1  =  f(x1); 
    fprintf('%3d %17.10e %17.10e\n', k, x1, fx1);   
    while abs(delx)> tol & k < maxits
        k =  k+1;
        d =  (fx1  -  fx0)/(x1 - x0);
        delx  =   - fx1/d;
        x0 =  x1; 
        fx0  =  fx1;   
        x1 =  x0  -  fx0/d;
        fx1  =  f(x1); 
        fprintf('%3d %17.10e %17.10e\n', k, x1, fx1);  
    end
    disp(' '); 
    disp('fzero:'); 
    options =  optimset('TolX', tol, 'MaxIter', maxits); 
    [x, fx, ~, output] =  fzero(f, [a0(i) b0(i)], options); 
    disp(' k 	x 	f(x)'); 
    fprintf('%3d %17.10e %17.10e\n', output.iterations, x, fx);
    disp(' ');
end