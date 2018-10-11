%Rubayet Hossain
%260611040
function ch5_13 

% Newton's method for non linear systems 
tol = eps;
maxits =  10;
x0 = [1; 1; 1]; %starting guess, taking each variable as 1
disp('Newton''s method:');
k = 0;
x = x0;
s = ones(size(x));  
while norm(s)> tol & k < maxits  
    k = k+1;
    s = -(Df(x)\f(x)); 
    x = x+s;
    fx =  f(x); 
end;
x, iterations = k
disp('MATLAB function fsolve:');
[x, fx, ~, output] =fsolve(@f, x0, optimset('TolX', tol, 'TolFun',tol, 'Display','off'));
x, iterations = output.iterations
function [y] =  f(x) 
y = [16*x(1)^4+16*x(2)^4+x(3)^4 - 16;  x(1)^2+x(2)^2+x(3)^2 - 3; x(1)^3 - x(2)];
function [J] =  Df(x)
J = [64*x(1)^3, 64*x(2)^3, 4*x(3)^3; 2*x(1), 2*x(2), 2*x(3); 3*x(1)^2,  - 1, 0];
